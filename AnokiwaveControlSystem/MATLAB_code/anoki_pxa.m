% Test the connection to Keysight Signal Analyzer over TCPIP Connection and Anokiwave over serial
%
%   Sets up PXA over network
%   Sets up Anokiwave over Serial COM port (Usually COM4)
%   Call ladybugPanoramicGrab executable and puts image in \Results
%
%   Points Anokiwave Antenna in angles listed in \anglePoint.csv
%   Fetchs data block from PXA and computes the peak amplitude of Impulse response
%
%   Save the gathered data in a Matlab Workspace to \Results
%
% -----------------------------------------------------------------------------

% --- Reset the MATLAB workspace ----------------------------------------------
clc; clear; close all;
instrreset;           %% Clear the instrument connection and objects
disp(seriallist)      %% Shows which serial ports are connected to user computer
% Turn off terminator serial port warning
warning('off','all'); %% warning

% Sets up sweepingfrequency of Antenna and Center frequency of PXA
paramFreq = 28050;          % Center frequency in MHz
paramSamplingRate = 200;    % Sampling rate in MHz
% Sets up PXA fetching parameters
blockSize = 10000;          % Number of data points to sample every trigger
modeBeam = 0;

param_triggerOffset = -5;   % Triger Offset in uS

% --- Initialize the serial port -----------------------------------------------
AnokiSerial = serial('COM4', 'BaudRate', 115200, 'ByteOrder', 'bigEndian', 'Timeout', 0.1);
fopen(AnokiSerial);
% --- Initialize and open the visa port ----------------------------------------
visaObj = VisaFindOpen('N9030A', blockSize);
VisaInitIQBasic(visaObj, blockSize);

% --- Run ladybug executable to grab snapshot ----------------------------------
system('ladybugTestGrab.exe &');
disp('Capturing snapshot and saving from Ladybug V5');

% --- Initialize PAA to start steering beam ------------------------------------
% TODO : Find proper set of commands to set Anokiwave PAA to latch RX data
ack = command_enable_beam(AnokiSerial, 1);                % Enable the beam
command_PAA_point(AnokiSerial, 0, 0, 0, 0, paramFreq);    % Need to start pointing to received data

% --- Read from pattern to point in from file ----------------------------------
arrayPoint = readmatrix('anglePoint.csv');

% Extract pattern information from file
azim_min = arrayPoint(1,1);
elev_min = arrayPoint(1,2);
numRow = arrayPoint(2,1);
numCol = arrayPoint(2,2);
azim_max = arrayPoint(3,1);
elev_max = arrayPoint(3,2);
% Generate axis to plot the angle pattern properly
domain_azim = linspace(azim_min, azim_max, numRow);
domain_elev = linspace(elev_min, elev_max, numCol);

% --- Read the sample impulse response file ------------------------------------
load chirp_140MHz_200MSps.mat;
%load chirp_140MHz_1GSps.mat;
[W, X, ACF_dB] = fftSampleImpulseData(I, R);

% --- Begin iterative angle sweeping -------------------------------------------
disp('Beginning Sweep across Phase Array Antenna');
matrix_peakImpulsePower = zeros(length(arrayPoint) - 3, 1);
tic

for i = 4:length(arrayPoint)
    % Assume beam mode = 0:RX and Beam config = 0:Beam0
    paramModeTXRX = 0;

    % Convert and send the azimuth and elevation angles to PAA spherical angle
    %[theta, phi] = convert_coord( arrayPoint(i, 1), arrayPoint(i, 2) );
    theta = arrayPoint(i, 1);
    phi = arrayPoint(i, 2);
    command_PAA_point(AnokiSerial, 0, modeBeam, theta, phi, paramFreq);

    % Call upon the PAA to fetch the a snapshot of data
    rawData = VisaFetchIQ(visaObj, paramFreq, paramSamplingRate, blockSize);
    iqIFdata = ProcessIQChirp(rawData, blockSize, paramSamplingRate, W, X, ACF_dB);

    matrix_peakImpulsePower(i - 3) = max(iqIFdata);
end
disp("Time to sweep antenna array");
toc

% Reshape vector to heatmap matrix
matrix_peakImpulsePower = reshape(matrix_peakImpulsePower, numRow, numCol);
%matrix_peakImpulsePower = flip(matrix_peakImpulsePower,2);
matrix_peakImpulsePower = matrix_peakImpulsePower.';

% --- Draw heatmap figure and set up plot properties ----------------------
figure();
hFigure = heatmap(domain_azim, domain_elev, matrix_peakImpulsePower, 'Colormap', jet);
hFigure.Title = 'Anokiwave Antenna - Peak Impulse Amplitude Sweep';
hFigure.XLabel = 'Azimuth angle';
hFigure.YLabel = 'Elevation angle';
caxis(hFigure, [-85, -55]);
disp('Heatmap displayed');

% --- Check heatmap result ------------------------------------------------
if (max(matrix_peakImpulsePower) < -80)
    disp("Check cable and communication connections: No chirp impulse received");
end


% --- Close the connections -----------------------------------------------
fclose(AnokiSerial);          % Close the serial connection to Anokiwave
fclose(visaObj);    % Close the TCPIP connection to VXA Visa device

% Save the sweeped data for further processing
save('Results\anokiSweepData.mat', 'matrix_peakImpulsePower', 'domain_azim', 'domain_elev');






% --- Start Helper function definition with Visa  ------------------------------

% Defines a function to initialize and open the Visa object at an IP address
function visaObj = VisaFindOpen(device, blockSize)
    % --- Instrument settings ------------------------------------------------
    param_visaTimeout = 10;     % Timeout initial connection time

    % --- Initialize the visa port ---------------------------------------------
    visaObj = instrfind('Tag', 'deepCapture');        %% Check if visa object already connected
    agilentVisaInfo = instrhwinfo('visa', 'agilent'); %% Find any visa connected instruments

    % --- Display number of Visa instruments found
    visaDevices = agilentVisaInfo.ObjectConstructorName;
    for i = 1:length(visaDevices)
        disp( "Device " + num2str(i) + " : " + visaDevices(1) );
    end
    % --- Prompt which device to connect to if multiple devices found in IP
    if length(visaDevices) > 1
        visaOption = input("Pick a number corresponding to visa address")
    else
        visaOption = 1;
    end

    % --- Parse the Visa address from instrument object ------------------------
    VISAhandle = visaDevices{visaOption};   %% Object name of visa
    VISAAddress = extractBetween( VISAhandle , '''' , '''' );
    VISAAddress = char( VISAAddress(2) );                               %% Grab the IP address

    disp(['Connecting to VISA device at: ' VISAAddress]);
    if isempty(visaObj) % if visaObj is empy
        % Then open a visa object pointing to the available device
        visaObj = visa('agilent', VISAAddress, 'Tag', 'deepCapture');
    else % Otherwise, close the existing object and open this referenced one
        fclose(visaObj);
    end

    %%% --- Set up VISA connection parameters ----------------------------------
    visaObj.InputBufferSize = (blockSize + 1)*8*2;  %% Input buffer size
    visaObj.ByteOrder = 'bigEndian';                %% Byte order
    visaObj.EOSMode = 'read&write';                 %% EOS mode
    visaObj.EOSCharCode = 'LF';                     %% Terminator byte
    visaObj.Timeout = param_visaTimeout;   %% Set timeout for connection
    %%% --- Start connection to VISA device ------------------------------------
    fopen(visaObj);         %% Open the visa object with parameters above

    visaIDN = query(visaObj, '*IDN?');  %REF pg132; Get Identification Query
    mdlIndx = regexpi(visaIDN, device);
    % Check if the expected device initialized was correct
    if isempty(mdlIndx)
        myException = MException('DeepCapture:IncorrectInstrument', 'Verify that the connected device at VISA IP is an X-Series Analyzer.');
        fclose(visaObj);
        throw(myException);
    end
    fprintf(visaObj, ':DISP:ENAB ON');  % Show real-time data (for debugging)
    disp( strcat('Connected to Visa device : ',device) );
end

function VisaInitIQBasic(visaObj, blockSize)
    param_triggerPeriod = 200;  % Trigger Period in mS

    param_preamplifier = 1;     % Preamplifier =1:On, =0:Off
    param_attenuation = 0;      % Attenuation dB

    %%% --- Send initialization commands to PXA --------------------------------
    fprintf(visaObj, ':INST:SEL BASIC');%REF pg224; Start IQ Basic Mode
    fprintf(visaObj, '*CLS;*RST');      %REF pg255; Clear Error Queue

    fprintf(visaObj, ':CONF:WAV');          % Configure waveform
    fprintf(visaObj, ':FORM REAL,32');      % SCPI Read Format (REAL, 32 ; REAL, 64)
    fprintf(visaObj, ':INIT:FCAP');         % Initiate fast capture

    opComplete = query(visaObj, '*OPC?');   % Check if operation complete

    fprintf(visaObj, ':TRIG:WAV:SOUR FRAM');% REF pg354; IQ Trigger Source
    fprintf(visaObj, ':TRIG:FRAM:SYNC OFF');% REF pg375; Sync source off
    fprintf(visaObj, [':TRIG:FRAM:PER ' num2str(param_triggerPeriod) ' ms']);

    fprintf(visaObj, [':POW:ATT ' num2str(param_attenuation)] );    %
    if param_preamplifier == 1
        fprintf(visaObj, ':POW:RF:GAIN:STAT ON');   %
        fprintf(visaObj, ':POW:GAIN:BAND FULL');    %
    else
        fprintf(visaObj, ':POW:RF:GAIN:STAT OFF');  %
    end

    fprintf(visaObj, [':FCAP:LENG ' num2str(blockSize)]);

    disp("PXA initialized.");
end


% Defines a function to fetch iqData from PXA
function rawData = VisaFetchIQ(visaObj, centreFreq, samplingRate, blockSize);

    % Set up the center frequency before fetching data

    fprintf(visaObj, [':FREQ:CENT ' num2str(centreFreq) ' MHz'] );
    fprintf(visaObj, [':WAV:SRAT ' num2str(samplingRate) ' MHz'] );  % Samping rate
    % Set up the block size for reading data
    fprintf(visaObj, [':FCAP:LENG ' num2str(blockSize)] );
    fprintf(visaObj, [':FCAP:BLOC ' num2str(blockSize)] );

    fprintf(visaObj, ':INIT:FCAP'); % Begin capturing dataType
    fprintf(visaObj, 'FETCH:FCAP?');% Fetch the block of dataType

    % Get the data block spectrum over snapshot
    rawData = binblockread(visaObj, 'float32');
    fread(visaObj, 1);
end

function ir = ProcessIQChirp(rawData, blockSize, samplingRate, W, X, ACF_dB)
    [iqTime, iqRaw, iqData] = parseRawData(rawData, blockSize, samplingRate);
    %figure(1); plot(iqTime, iqRaw);
    ir = fftIQdata(iqData, W, X, ACF_dB);
    %figure(2); plot(iqTime, ir);
end

% Defines a function to parse the raw PXA data
function [iqTime, iqRaw, iqData] = parseRawData(rawData, blockSize, samplingRate)
    % Reshape data from [x1 y1 x2 y2 ... xn yn] to 2 column matrix
    iqData = reshape(rawData.', 2, length(rawData)/2).';
    if ~(isempty(iqData))
        iqData = complex(iqData(1:blockSize, 1), iqData(1:blockSize, 2));
    end

    % Obtain the time domain from raw data tabLength
    iqTime = 1e6*(0:blockSize-1)/(samplingRate*1e6);
    iqRaw = 20*log10(abs(iqData)) + 10;
end

function [W, X, ACF_dB] = fftSampleImpulseData(I, R)
    % Process rawData
    x = transpose(R + j*I);
    x = x / sqrt(sum(abs(x).^2));
    X = fftshift(fft(x));
    W = window(@flattopwin, length(X));
    ACF_dB = 20*log10(sum(abs(X).^2)) - 20*log10(sum(W.*abs(X).^2));
end

function ir = fftIQdata(iqData, W, X, ACF_dB)
    Y = fftshift(fft(iqData));
    ir = 20*log10(abs(ifft(ifftshift(W .* Y .* X)))) + 10;  % dBm into 50 ohm load
    ir = ir - 10*log10(sum(abs(X).^2));
    ir = ir + ACF_dB;
end

% --- Start Helper function definition with PAA --------------------------------

% Defines a function that commands the PAA to point in a direction
function command_PAA_point(serial, mode, beam, theta, phi, fMHz)
    % command_PAA_point  Sends command to point the PAA. Displays ACK/NCK
    %   tele = command_PAA_point(serial, mode, beam, theta, phi, fMhz)
    %       serial: reference to an opened serial port
    %       mode:   Accepts(0 = RX, 1 = TX)
    %       beam:   Accepts (0,1,2,3) as beam configuration
    %       theta:  Accepts floating values (0 - 90 degrees) along device orthgonal
    %       phi:    Accepts floating values (0 - 360 degrees) along plane parallel to device
    %       fMhz:   Accepts whole values that define the frequency in MHz (27500 to 30000).
    %       tele:   Returns an array containing the ACK/NCK Telemetry
    %
    %   command_PAA_point sends the command byte directly through serial port and the
    %   response byte sequence is returned.

    % Starting byte (header)

    cmd = hex2dec('A0');

    beam_byte = 0;

    % Accept mode values: (TX = 1, RX = 0)
    if mode, beam_byte = 4; end

    % Accept beam values from 0,1,2,3
    if beam == 0;
    elseif beam == 1, beam_byte = beam_byte + 1;
    elseif beam == 2, beam_byte = beam_byte + 2;
    elseif beam == 3, beam_byte = beam_byte + 3;
    end

    % Convert the theta angle, phi angle, freq mhz to bytes
    [mst, lst] = theta_uint16(theta);
    [msp, lsp] = phi_uint16(phi);
    [msf, lsf] = freq_uint16(fMHz);

    % Create command array from pointing parameters
    cmd = [cmd beam_byte mst lst msp lsp msf lsf];
    % Send the command
    ack = send_command(serial, cmd, 1);
end

%Define function for enable beam command
function ack = command_enable_beam(serial, enable_flag)
    % command_enable_beam Sends the command to enable the beam (WILL BEGIN IRRADIATING)
    %   command_enable_beam(serial, enable_flag)
    %       serial:     reference to an opened serial port
    %       enable_flag:Accepts (0 = Disable, 1 = Enable)
    %
    %   command_enable_beam will configure the PAA to begin beam at it's current
    %   configuration

    % Starting byte (header)
    cmd = hex2dec('E0');
    if enable_flag, enable_flag =  1; end
    % Create command array from enable flag
    cmd = [cmd enable_flag];
    % Send the command
    ack = send_command(serial, cmd, 1);
end

% Defines a function to append the checksum byte to a command
function c = checksum(cmd)
    % checksum Returns the hexadecimal byte of all values in char array
    %   checksum_byte = checksum(cmd)
    %       cmd: double array containing hexadecimal representation of command
    %
    %   checksum XOR through each value in command and returns a checksum byte
    %   that can be appended to the end of a command to be sent through serial port

    c = cmd(1); % Initialize first value
    for n = 2:length(cmd) % Loop through every byte in command
        c = bitxor(c, cmd(n)); % XOR this and last byte
    end
end

% Defines a function to display the data stream in serial port
function print_command(cmd, sendType, dataType)
    % print_command Display the command array in matlab console
    %   print_command(cmd, sendType, dataType)
    %       cmd     : double array containing hexadecimal representation of command
    %       sendType: defines whether command was sent of received ('send', 'read')
    %       dataType: defines whether to show command as decimals or hexadecimals
    %
    %   print_command displays the command in the matlab console with
    %   information about data stream direction and data type

    % Check if command is empty
    if isempty(cmd)
        disp("Check the port, no response from serial port")
        %Quit script because wrong device configured
        return;
    end

    % Print what kind of command was sent
    if sendType == 'send'
        fprintf("Command sent: ");
    elseif sendType == 'read'
        fprintf("Command read: ");
    end

    % Display each byte one by one
    for i = cmd
        if dataType == 'dec'
            fprintf('%d ',i)
        elseif dataType == 'hex'
            fprintf('%02X ',i)
        end
    end
    fprintf("\n"); % Add new line for readibility
end

%Defines a function that sends the command through serial
function response = send_command(serial, cmd, byteBack)
    % send_command Sends a command array through the serial port
    %   response = send_commmand(serial, cmd)
    %       serial: reference to an opened serial port
    %       cmd   : double array containing hexadecimal representation of command
    %   send_command will append the checksum byte to the command array and
    %   sends it through the serial port. This fnction can be used to send
    %   information or request information

    % Append the checksum byte
    send_cmd = [cmd checksum(cmd)];
    % Display what the command will look like before transmission
    %print_command(send_cmd, 'send', 'hex');
    % Write to the serial port the command
    fwrite(serial, send_cmd);
    % Read immediately whether it be an acknowledgement or information requested
    response = fread(serial, 6);
    % Quick check if NCK received
    %print_command(response, 'read', 'hex');
    if length(response) > 1
        ack = response(1);
    else
        ack = response;
    display_ack(ack);
    end
end

% Defines a function that converts (0-90 angles) to 4 bytes
function [msb, lsb] = theta_uint16(angle)
    % theta_uint16 Converts angle (double value) to bytes (MSB, LSB)
    %   [msb, lsb] = theta_uint16(theta)
    %       angle: Double value containing angle information (0 - 90)
    %       msb: Byte representing the Most Significant positions
    %       lsb: Byte representing the Least Significant positions
    %
    %   theta_uint16 will take a double value and parse it into
    %   hexadecimal bytes that can be send to the PAA. Does not bound
    %   the input to accepted range!

    % Remaps the theta angle (0-90) to 0d65535 / 0xffff
    val = floor((angle/90) * 65535);
    % Split byte up into 4 bytes
    msb = floor( val/256 );
    lsb = val - msb*256;
end

% Defines a function that converts (0-360 angles) to 4 bytes
function [msb, lsb] = phi_uint16(angle)
    % phi_uint16 Converts angle (double value) to bytes (MSB, LSB)
    %   [msb, lsb] = phi_uint16(theta)
    %       angle: Double value containing angle information (0 - 360)
    %       msb: Byte representing the Most Significant positions
    %       lsb: Byte representing the Least Significant positions
    %
    %   phi_uint16 will take a double value and parse it into
    %   hexadecimal bytes that can be send to the PAA. Does not bound
    %   the input to accepted range!

    % Remaps the theta angle (0-90) to 0d65535 / 0xffff
    val = floor((angle/360) * 65535);
    % Split byte up into 4 bytes
    msb = floor( val/256 );
    lsb = val - 256*msb;
end

% Defines a function that converts the MHz frequency to bytes
function [msb, lsb] = freq_uint16(fMHz)
    % freq_uint16 Remaps the frequency
    %   [msb, lsb] = freq_uint16(fMHz)
    %       fMHz: Double value containing frequency value in megahertz
    %       msb: Byte representing the Most Significant positions
    %       lsb: Byte representing the Least Significant positions
    %
    %   freq_uint16 will take a double value and parse it into
    %   hexadecimal bytes that can be send to the PAA. Does not bound
    %   the input to accepted range!

    val = floor(fMHz);
    % Split byte up into 4 bytes
    msb = floor( val/256 );
    lsb = val - 256*msb;
end

% Defines a function that converts the azimuth and elevation coordinate to spherical
function [theta, phi] = convert_coord(azim, elev)

    % Convert to cartesian coordinate
    gx = sind(elev);
    gy = sind(azim);
    gz = cosd(elev)*cosd(azim);

    % Convert cartesian to polar coord in PAA
    theta = acosd(gz);
    phi = atan2d(gy, gx);
    if (phi < 0)
        phi = phi + 360;
    end

end

function tele = decode_ackstatus(response)
    % decode_ackstatus: Reads the response after Status Summary Request
    %   decode_ackstatus(response)
    %       response: represents the command array the PAA responed with
    %       serial monitor
    %
    %   decode_ackstatus will return the global telemetry information
    %   telemetry = [Max Temperature, Min Temperature, Average Receive Gain, Average Transmit Power]

    %Splice response into seperate bytes
    %cmd = split(response, " ");
    % Extract the ACK/NCK byte
    ack = response(1);
    % Extract the temperature byte
    tMax = response(2);
    tMin = response(3);
    % Extract the gain byte
    aGain= response(4);
    % Correct aGain for signed byte
    if aGain > 127, aGain = -(aGain-127); end
    aGain = aGain * 0.25;
    % Extract the power byte
    aPower= response(5) * 0.25;
    % Parse the telemetry  response
    tele = [tMax tMin aGain aPower];
end

% Defines a function to display the ACK/NCK response
function cmd_ack = display_ack(byte)
    % display_ack: Displays the ack flags received after each command is sent
    %   flag_ack = display_ack(byte)
    %       byte: Represents the ack byte from the response of a sent command
    %
    %   display_ack will return whether the command was successfully sent or not

    % Convert ack byte to ack double
    %bin_ack = hex2dec(byte);
    % Extract particular position of bits to be telemetry flags
    flag_fixed = bitget(byte, 7);
    flag_ack = bitget(byte, 6);
    flag_txrx = bitget(byte, 8);
    paa_fault = bitget(byte, 4);
    % Grab only the last 4 bits
    counter = bitand(byte, 15);

    if and(flag_ack, not(paa_fault))
        cmd_ack = 1;
    else
        cmd_ack = 0;
        disp("Try to send the command again, NAK or PAA fault received");
    end
end