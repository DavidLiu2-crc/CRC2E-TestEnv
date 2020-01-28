%%% MATLAB script to test visa connection with PXA
clc; clear;

% DO THINGS HERE
%%% ---------------- Fetch data here ----------------
visaObj = openVisa();

blockSize = 10000;

% Set up visa instrument for fetching (assuming already open)
fprintf(visaObj, [':FCAP:LENG ' num2str(blockSize)] );
fprintf(visaObj, [':FCAP:BLOC ' num2str(blockSize)] );

figure();   % Open up a figure

fprintf(visaObj, ':INIT:FCAP'); % Begin capture
fprintf(visaObj, 'FETCH:FCAP?');% Fetch the block of data

rawData = binblockread(visaObj, 'float32');

fread(visaObj, 1);

iqData = reshape(rawData .', 2, length(rawData)/2 ).';
if ~(isempty(iqData))
    iqData = complex( iqData(1:blockSize,1), iqData(1:blockSize, 2) );
end

%Define time domain from raw data length
dataTime = 1e6 * (0:blockSize-1) / (param_samplingRate * 1e6);
rawdB = 20*log10( abs(iqData)) + 10;

plot(dataTime, rawdB);


%%% --- Close the VISA connection
fclose(visaObj);


%%% Defines a function to open the VISA connection
function visaObj = openVisa
    %%% ---------------- Instrument settings ----------------
    param_blockSize = 10000;    % Block size in bytes
    param_centerFreq = 28;      % Center Frequency (GHz)
    param_samplingRate = 200;   % Sampling Rate (MHz)
    param_attenuation = 0;      % Attenuation in (dB)

    param_triggerPeriod = 200;  % Trigger Period in mS
    param_triggerOffeset = -5;  % Triger Offset in uS

    param_preamplifier = 1;     % Preamplifier =1:On, =0:Off
    
    %%% ---------------- Find visa in IP ----------------
    visaObj = instrfind('Tag', 'deepCapture');      %% Check if visa object already connected
    agilentVisaInfo = instrhwinfo('visa', 'agilent');%% Find any visa connected instruments

    VISAAddresses = agilentVisaInfo.ObjectConstructorName;
    VISAValue = 1;
    VISAAddress = extractBetween( VISAAddresses{VISAValue} , '''' , '''' );
    VISAAddress = VISAAddress(2);

    % if visaObj is empy
    if isempty(visaObj)
        % Then open a visa object pointing to the available device
        visaObj = visa('agilent', VISAAddress, 'Tag', 'deepCapture');
    else
        % Otherwise, close the existing object and open this referenced one
        fclose(visaObj);
        %visaObj = visa('agilent', VISAAddress, 'Tag', 'deepCapture');
    end

    %%% ---------------- Set up VISA nnection parameters ----------------
    blockSize = 10000;
    visaObj.InputBufferSize = (blockSize + 1)*8*2;  %% Input buffer size
    visaObj.ByteOrder = 'bigEndian';                %% Byte order
    visaObj.EOSMode = 'read&write';                 %% EOS mode
    visaObj.EOSCharCode = 'LF';                     %% Terminator byte

    visaObj.Timeout = 45;   %% Set timeout for connection

    fopen(visaObj);         %% Open the visa object with parameters above

    visaIDN = query(visaObj, '*IDN?');  %REF pg132; Get Identification Query
    mdlIndx = regexpi(visaIDN, 'N9030A');
    if isempty(mdlIndx) % Check if the device initialized is correct
        myException = MException('DeepCapture:IncorrectInstrument', 'Verify that the connected device at VISA IP is an X-Series Analyzer.');
        fclose(visaObj);
        throw(myException);
    end

    %%% ---------------- Send initialization commands to PXA ----------------
    fprintf(visaObj, '*RST; *CLS'); % Reset, clear error queue, status register

    fprintf(visaObj, ':INST:SEL BASIC');%REF pg224; Start IQ Basic Mode
    fprintf(visaObj, '*CLS;*RST');      %REF pg255; Clear Error Queue

    fprintf(visaObj, [':FREQ:CENT ' num2str(param_centerFreq) ' GHz'] );   % Set Center Freq
    fprintf(visaObj, [':WAV:SRAT ' num2str(param_samplingRate) ' MHz'] );  % Samping rate

    fprintf(visaObj, ':FORM REAL,32');  % SCPI Read Format (REAL, 32 ; REAL, 64)
    fprintf(visaObj, ':INIT:FCAP');     % Initiate fast capture

    opComplete = query(visaObj, '*OPC?');% Check if operation complete

    fprintf(visaObj, ':TRIG:WAV:SOUR FRAM');
    fprintf(visaObj, ':TRIG:FRAM:SYNC OFF');
    fprintf(visaObj, [':TRIG:FRAM:PER ' num2str(param_triggerPeriod) ' ms']);

    fprintf(visaObj, [':POW:ATT ' num2str(param_attenuation)] );
    if param_preamplifier == 1
        fprintf(visaObj, ':POW:RF:GAIN:STAT ON');
        fprintf(visaObj, ':POW:GAIN:BAND FULL');
    else
        fprintf(visaObj, ':POW:RF:GAIN:STAT OFF');
    end

    fprintf(visaObj, [':FCAP:LENG ' num2str(blockSize)] );
end

