% Test the connection to Keysight Signal Analyzer over TCPIP Connection

% --- Set up VISA object in MATLAB ---
% List all VISA addresses visible
VISAAddresses = {};
AgilentVISAInfo = instrhwinfo('visa', 'agilent');
KeysightVISAInfo = instrhwinfo('visa', 'keysight');
% Parse the IP from the VISA Info strings
VISAAddress   = VISAAddresses{VISAValue};   % @() SOME SET OF STRING SPLITER

% Create VISA Object to which to connect to
visaObj = instrfind('Tag', 'deepCapture');
if isempty(visaObj)
    visaObj = visa('agilent', VISAAddress, 'Tag', 'deepCapture');
else
    fclose(visaObj);
end

% Configure bit transmission properties of VISA
% Set buffer size - 8 bytes/point * 2 (1 each for I & Q) + additional block for buffer
visaObj.InputBufferSize = (blockSize+1)*8*2;
% Set Endianness of the data
visaObj.ByteOrder = 'bigEndian';
% Set EOS Mode
visaObj.EOSMode = 'read&write';
% Set EOS Character
visaObj.EOSCharCode = 'LF';

visaObj.Timeout = 45; % Temporarily set the timeout value to 45 sec

% --- Open VISA interface connection ---
fopen(visaObj);

% --- Initialize VISA instrument ---
% Reset the analyzer, Clear Error Queue & Status Registers set internal alignments to Partial
fprintf(visaObj, '*RST;*CLS'); % Reset OPC states and Clear Status byte and clear all event registers

visaObj.Timeout = 5; % Set the timeout value to 5 sec

% Check to make sure we are connected to a N9030A
idn = query(visaObj, '*IDN?');
mdlIndx = regexpi(idn, 'N9030A');
if isempty(mdlIndx)
    myException = MException('DeepCapture:Incorrectinstrument','Confirm that you have an X-Series analyzer at the specified VISA address');
    throw(myException);
end

% --- Configure Mode on PXA Instrument ---
fprintf(visaObj, ':INST:SEL BASIC'); % Set instrument to IQ Basic mode

fprintf(visaObj, '*CLS;*RST'); % Clear error queue and do a mode preset

fprintf(visaObj, ':CONF:WAV'); % configure waveform

fprintf(visaObj, [':FREQ:CENT ' '28000' ' GHz']); % Set center frequency

fprintf(visaObj, [':WAV:SRAT ' '100' ' MHz']); % Set sampling rate

fprintf(visaObj, ':FORM REAL,32'); % Set SCPI Read Format (Possible settings are REAL, 32;  REAL, 64)

fprintf(visaObj, ':INIT:FCAP'); % Initiate a fast capture (deep capture)

% Query to determine when meausurement is complete
opVal = query(visaObj, '*OPC?');

% fprintf(visaObj, ':TRIG:WAV:SOUR EXT1'); % Set the trigger source to EXT1

% Set the trigger source to internal (periodic timer)
fprintf(visaObj, ':TRIG:WAV:SOUR FRAM');
fprintf(visaObj, ':TRIG:FRAM:SYNC OFF');
fprintf(visaObj, [':TRIG:FRAM:PER ' '100' ' ms']);


%fprintf(visaObj, [':POW:ATT ' get(handles.txtAtt, 'String')]); % Set attenuation

% Turn internal preamplifier on and set to full frequency range
% if get(handles.rdo_preamp, 'Value') == 1
%     fprintf(visaObj, ':POW:RF:GAIN:STAT ON');
%     fprintf(visaObj, ':POW:GAIN:BAND FULL');
% else
%     fprintf(visaObj, ':POW:RF:GAIN:STAT OFF');
% end

% Enable IF amplifier
% test = query(visaObj, ':IF:GAIN:AUTO?');
% fprintf(visaObj, ':IF:GAIN:AUTO OFF');
% fprintf(visaObj, ':IF:GAIN ON');

% Set capture length in points
% Use an even number when bit packing is AUTO or BIT32
reqPoints = blockSize;
if ~isequal(mod(reqPoints, 2), 0)
    reqPoints = reqPoints + 1;
end
fprintf(visaObj, [':FCAP:LENG ' num2str(reqPoints)]);
