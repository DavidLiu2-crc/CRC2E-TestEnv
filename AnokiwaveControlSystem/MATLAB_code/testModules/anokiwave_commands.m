% Test MATLAB script to interface with Anokiwave PAA through usb/serial port

clc; % Clear the matlab workspace (variables)
instrreset; %C lear the instrument connection/objects
disp(seriallist) % Show which serial ports are connected to user computer

% Initialize the serial port with these properties
s = serial('COM4', 'BaudRate', 115200, 'ByteOrder', 'bigEndian', 'Timeout', 0.03 );
% Open the connection with serial port
fopen(s);
% Turn off terminator serial port warning
warning('off','all'); %warning




% --- BEGIN TEST ENVIRONMENT WITH ANOKIWAVE ---

% Testing all basic commands in Table 4-2

% command_set_scratch(s, 1023);
% resp = command_read_scratch(s);
%
% command_set_scratch(s, ["ab", "cd", "ef", "af"]);
% resp = command_read_scratch(s);
%
% resp = command_request_fixed(s);
%
% command_PAA_point(s, 1, 0, 90, 0, 28000);
% quick_detail(s);
% command_PAA_point(s, 1, 0, 89, 0, 28000);
% quick_detail(s);
%
% command_factory_reset(s, 1);
%
% readout = command_array_config(s);
% command_configureIP(s, "192.168.1.35");
% readout = command_array_config(s);
%
% command_factory_reset(s, 0);
%
% command_enable_beam(s, 0);
% summ = command_status_detail_request(s);
% command_enable_beam(s, 1);
% summ = command_status_detail_request(s);
% command_enable_beam(s, 0);
%
% summ = command_status_summary_request(s);
% command_status_detail_request(s);


% Testing various
% Changing IP works!
% configureIP(s, "192.168.1.10");
% readout = array_config(s);
% configureIP(s, "192.168.1.35");
% readout = array_config(s);

%Playing with beam steering - 1
% time_f = 0;
% time_g = 0;
% for theta = 0:40
%     tic
%     PAA_point(s, 0, 0, theta, 150, 40000);
%     %status_detail_request(s);
%     if mod(theta, 10) == 0
%         fprintf("Theta angle incremented by %d", theta);
%         toc
%     end
% end

%Playing with beam steering - 2
command_enable_beam(s, 1);
tic
data_mapped = PAA_map(s, [0,90,15, 0,360,60, 28000]);
toc

% --- END TEST ENVIRONMENT WITH ANOKIWAVE ---

% Close the connection with serial port (free up connection resource)
fclose(s);




% --- BEGIN INTERFACE FUNCTION DEFINITION WITH PAA ---

% Defines a function that sends a message into the scratch register
function command_set_scratch(serial, mess)
% command_set_scratch Sends a set of bytes to load into the scratch register
%   command_set_scratch(serial, mess)
%       serial: reference to an opened serial port
%       mess  : Either a double value or hexadecimal array containing the
%       inforation to be written into scratch register

    % Starting byte (header)
    cmd = hex2dec('81');

    % Directly convert hexadecimal array to double
    if isstring(mess)
        byte0 = hex2dec(mess(1)); % LSB byte
        byte1 = hex2dec(mess(2)); % Second LSB Byte
        byte2 = hex2dec(mess(3)); % Second MSB Byte
        byte3 = hex2dec(mess(4)); % MSB Byte
    % Parse message into bits if message is a double
    elseif isa(mess, 'double')
        byte0 = floor(mess / 16777215);% First MSB Byte
        val = mess - byte0 * 16777215;
        byte1 = floor(val / 65536);    % Second MSB Byte
        val = val - byte1 * 65536;
        byte2 = floor(val / 256);      %Second LSB Byte
        byte3 = val - byte2 * 256;     %LSB byte
    end

    % Create command array from pointing parameters
    cmd = [cmd byte0 byte1 byte2 byte3];
    % Send the command
    response = send_command(serial, cmd);
    % ACK Status Received or single NCK byte

end

% Defines a function that request the values in scratch register
function response = command_read_scratch(serial)
% command_read_scratch Request the information stored in scratch register
%   response = command_read_scratch(serial)
%       serial: reference to an opened serial port
%
%   command_read_scratch will send the READ SCRATCH REQUEST command and return the
%   information stored in the scratch register of PAA

    % Starting byte (header)
    cmd = hex2dec('82');
    % Send the command and read the response
    response = send_command(serial, cmd);

    % Display the information stored in scratch register if ack [scratch] checksum is received
    if length(response) == (4+2)
        fprintf("Scratch register: %x %x %x %x \n", response(2), response(3), response(4), response(5));
    end
end

% Defines a function that request the values in fixed register
function fixed = command_request_fixed(serial)
% command_request_fixed Sends the command to read the fixed imformation register
%   response = command_request_fixed(serial)
%       serial: reference to an opened serial port
%
%   command_request_fixed will send the REQUEST FIXED SEQUENCE command and return
%   the content of the fixed register. Expect fixed values of ['AA' '55''DE' 'B1'].
%   Otherwise, assume that interference in data stream between computer and PAA

    % Starting byte (header)
    cmd = hex2dec('83');
    % Send the command and read the response
    response = send_command(serial, cmd);
    % Parse the response into ack and fixed bytes
    fixed = response(2:5);
    % Display whether the fixed response is good
    display_fixed(response);
end

function tele = command_PAA_point(serial, mode, beam, theta, phi, fMHz)
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

    % Accept mode values: (TX = 1, RX = 0)
    if mode, mode = 1; end
    % Accept beam values from 0,1,2,3
    if beam == 0 beam_byte = hex2dec('00');
    elseif beam == 1 beam_byte = hex2dec('01');
    elseif beam == 2 beam_byte = hex2dec('10');
    elseif beam == 3 beam_byte = hex2dec('11');
    end
    beam_byte = beam_byte + 4 * mode; % Parse the mode and beam into beam byte

    % Convert the theta angle, phi angle, freq mhz to bytes
    [mst, lst] = theta_uint16(theta);
    [msp, lsp] = phi_uint16(phi);
    [msf, lsf] = freq_uint16(fMHz);

    % Create command array from pointing parameters
    cmd = [cmd beam_byte mst lst msp lsp msf lsf];
    % Send the command
    response = send_command(serial, cmd);
    % ACK Status Received or single NCK byte
    tele = decode_ackstatus(response);
end

function config = command_array_config(serial)
    % command_array_config Sends command to PAA to request array configuration
    %   config = command_array_config(serial)
    %       serial: reference to an opened serial port
    %       config: Returns an array containing PAA configuration info
    %
    %   command_array_config will return and display the current PAA configuration
    %   (Revision number, Serial number, IP Address)

    % Starting byte (header)
    cmd = hex2dec('B1');
    % Send the command and read the response
    response = send_command(serial, cmd);
    % Parse the config response into double or string values of information
    config = decode_config(response);
    % Display the current configuration of the PAA
    display_config(config);
end

function response = command_factory_reset(serial, reset_flag)
    % command_factory_reset Sends the command to perform a factory reset on PAA
    %   response = command_factory_reset(serial, reset_flag)
    %       serial:     reference to an opened serial port
    %       reset_flag: Accepts (0 = False, 1 = True)
    %
    %   command_factory_reset will ask the user to confirm whether or
    %   not to reset the PAA back to factory settings

    % Starting byte (header)
    cmd = hex2dec('C0');

    % Confirm that the user wants to reset the device
    if reset_flag
        user_response = input("Are you sure you want to reset the device to Factory Settings (yes/no)? ", 's');
        if lower(user_response) == "yes"
            cmd = [cmd hex2dec('ba') hex2dec('11')]; % Factory reset command
        else
            cmd = [cmd hex2dec("00") hex2dec("00")];
        end
    end
    % Send the command
    response = send_command(serial, cmd);
    % ACK Status Received or single NCK byte
end

%Defines a function to set the PPA IP address
%function ack = configureIP(serial, addr1, addr2, addr3, addr4)
function ack = command_configureIP(serial, address)
% command_configureIP Sends the command to set the IP address
%   command_configureIP(serial, address)
%       serial:     reference to an opened serial port
%       address:    Accepts a string representing the IP address (ex."192.168.1.25")
%
%   command_configureIP will configure the IP address of the PAA device (only by USB/UART)
%   Must pass string vector like "192.162.1.54" not char vector '192.168.3.2'

    % Starting byte (header)
    cmd = hex2dec('C1');
    % Break up address string into octets
    octets = strsplit(address, ".");
    addr1 = str2num(octets(1));
    addr2 = str2num(octets(2));
    addr3 = str2num(octets(3));
    addr4 = str2num(octets(4));
    % Create command array from IP address octets
    cmd = [cmd addr1 addr2 addr3 addr4];
    % Send the command
    response = send_command(serial, cmd);
    % ACK Status Received or single NCK byte
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
    response = send_command(serial, cmd);
    % ACK Status Received or single NCK byte
    ack = response(1);
end

% Defines a function that sends the status summary request
function summ = command_status_summary_request(serial)
% command_status_summary_request Sends the command STATUS SUMMARY REQUEST
%   summ = command_status_summary_request(serial)
%       serial: reference to opened serial port
%
%   command_status_summary_request will return and display the status summary of
%   the PAA device
%   [PAA over-current Fault, PAA Temperature Warning, PAA Over-temperature,
%   PAA Failure, Digital Error, RF Error]

    % Starting byte (header)
    cmd = hex2dec('F0');
    % Send the command
    response = send_command(serial, cmd);
    % Parse the summary response into flags of information
    % ack = response(1);
    summ = response(2);
    % Display the readable summary in matlab console
    display_status_summary(response);
end

% Defines a function that sends the status detail request
function detail = command_status_detail_request(serial)
% command_status_detail_request Sends the command STATUS DETAIL REQUEST
%   summ = command_status_detail_request(serial)
%       serial: reference to opened serial port
%
%   command_status_detail_request will return and display the status detail of
%   the PAA device
%   [ Status Angles and frequency, Summary, Temperatures]

    % Starting byte (header)
    cmd = hex2dec('F1');
    % Send the command
    response = send_command(serial, cmd);
    % Parse the information received after requesting status detail
    [ack, setup, summ, temp] = decode_status_detail(response);
    % Parse together the setup, summary and temperature to return detail
    detail = [setup, summ, temp];
    % Display the status, summary and temperature of the PAA device
    display_status_detail(setup, summ, temp);
end

% --- END INTERFACE FUNCTION DEFINITION WITH PAA ---




% --- START HELPER FUNCTION DEFINITION WITH PAA ---

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

    % Check if command is empty
    if isempty(cmd)
        disp("Check the port, no response from serial port")
        %Quit script because wrong device configured
        return;
    end
end

%Defines a function that sends the command through serial
function response = send_command(serial, cmd)
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
    print_command(send_cmd, 'send', 'hex');
    % Write to the serial port the command
    fwrite(serial, send_cmd);
    % Read immediately whether it be an acknowledgement or information requested
    response = fread(serial);
    % Display what the command read back after transmission
    print_command(response, 'read', 'hex');

    %if length(response) > 1 & length(response) == 6
    %    tele = decode_ackstatus(response);
    %else
    %    disp("Try command again, NCK received");
    %end

    % Trobleshooting command in case NCK received
    %display_ack(response(1));
    %if length(response) == 6
    %    %display_ackstatus(tele);
    %end
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

% Defines a function that converts (4 bytes) to (0-90 angles)
function angle = theta_value(msb, lsb)
% theta_value Converts the 4 bytes received from PAA and converts
% to double value
%   angle = theta_value(msb, lsb)
%       msb: Byte representing the Most Significant positions
%       lsb: Byte representing the Least Significant positions
%       angle: Double value containing angle information (0 - 90)
%
%   theta_value will take the bytes in hexadecimal and convert it
%   back to a double (readable) value.

    value = lsb + msb*256;
    angle = value * (90 / 65535);
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

% Defines a function that converts (4 bytes) to (0-360 angles)
function angle = phi_value(msb, lsb)
% phi_value Converts the 4 bytes received from PAA and converts
% to double value
%   angle = phi_value(msb, lsb)
%       msb: Byte representing the Most Significant positions
%       lsb: Byte representing the Least Significant positions
%       angle: Double value containing angle information (0 - 90)
%
%   phi_value will take the bytes in hexadecimal and convert it
%   back to a double (readable) value.

    value = lsb + msb*256;
    angle = value * (360 / 65535);
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

% Defines a function that converts (4 bytes) to (double value)
function freq = freq_value(msb, lsb)
    % Combine two seperate hexadecimal bytes to one
    freq = lsb + msb*256;
end

% % Defines a function to parse the response after fixed request is sent
% function fixed = decode_fixed(response)
% % decode_fixed: returns the values stored in fixed register
% %   fixed = decode_fixed(response)
% %       response: represents the command array the PAA responed with
%
%     % Extract the ack/nack byte
%     ack = response(1);
%     fixed = response(2:5);
% end

% Defines a function the displays the fixed register values
function display_fixed(response)
% display_fixed: Displays the whether the fixed register returned correct values or need to try again
%   display_fixed(response)
%       response: represents the command array the PAA responed with
%
%   display_fixed shows the user whether the fixed register values received
%   are correct or not.

    % Parse the data positions representing fixed register values
    fixed = response(2:5);
    % Checks if all the values received are correct
    if (fixed(1) == 170)
        if (fixed(2) == 85)
            if (fixed(3) == 222)
                if (fixed(4) == 177)
                    % Display message if all values checks out
                    disp("Fixed register response correct")
                    return
                end
            end
        end
    end
    % Otherwise, display an incorrect value message
    disp("Fixed register reponse incorrect: %s", response)
end

% Checks if response command for ACK
function check_ack(response)

    if length(response) == 6
        tele = decode_ackstatus(response);
        display_ackstatus(tele);
    end
end

% Defines a function to extract the ACK, telemetry from Status Summary
% Suppose response is a string of hex values
%function [ack, tele] = decode_status(serial, response)
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



% Defines a function to extract the ACK, Config from Configuration Response
function config = decode_config(response)
% decode_config: Parses the response from sending Array Config Request
%   config = decode_config(response)
%       response: represents the command array the PAA responed with
%
%   decode_config parses and returns the config response [Revision number,
%   Serial number, IP address]

    %Splice response into seperate bytes
    %cmd = split(response, " ");

    if length(response) == 10
        % Extract the ack/nak byte
        ack = response(1);
        % Extract the revision number bytes
        numRev_major = response(2);
        numRev_minor = response(3);
        numRev = num2str(numRev_major) + "." + num2str(numRev_minor);
        % Extract the serial number bytes
        serialNum1 = response(4);
        serialNum2 = response(5);
        numSerial = serialNum1*256 + serialNum2; % Convert two seperate bytes to one number
        % Extract the IP address bytes
        IP1 = response(6);
        IP2 = response(7);
        IP3 = response(8);
        IP4 = response(9);
        numIP = num2str(IP1) +"."+ num2str(IP2) +"."+ num2str(IP3) +"."+ num2str(IP4);
        % Parse the configuration response
        config = [numRev, numSerial, numIP];
    else
        disp("Configuration information expected, unknown command seqeunce received")
        config = response;
    end
end

% Defines a function to extract the setup response
function setup = decode_setup(response)
% decode_setup: Parses the response representing PAA setup
%   setup = decode_setup(response)
%       response: represents the command array the PAA responed with
%
%   decode_setup parses and returns the setup response [Theta angle, phi angle, frequency]

    % Splice response into seperate bytes
    % cmd = split(response, " ");
    % Extract the ack/nack byte
    %ack = response(1);
    % Extract the theta angle bytes
    theta1 = response(1);
    theta2 = response(2);
    theta = theta_value(theta1, theta2); % Pass the bytes to numerical value (0-90)
    % Extract the phi angle bytes
    phi1 = response(3);
    phi2 = response(4);
    phi = phi_value(phi1, phi2); % Pass the bytes to numerical values (0-360)
    % Extract the frequency bytes
    freq1 = response(5);
    freq2 = response(6);
    freq = freq_value(freq1, freq2); % Pass the bits to numberical values
    % Parse the double values to be returned
    setup = [theta, phi, freq];
end

% Defines a function to extract the ACK, Setup, Summary, Temp from Status Detail Response
function [ack, setup, summ, temp] = decode_status_detail(response)
% decode_status_detail: Parses the response representing PAA status detail
%   [ack, setup, summ, temp] = decode_status_detail(response)
%       response: represents the command array the PAA responed with
%
%   decode_status_detail parses and returns the setup response [Setup, Summary, Temperature]

    % Splice response into seperate bytes
    %cmd = split(response, " ");
    % Extract the ack/nack byte
    ack = response(1);
    setup = response(2:7);
    % Parse the subset of bytes representing setup into double array
    setup = decode_setup( setup );
    %display_status(status);
    % Extract the summary byte
    summ = response(8);
    %summ = display_status_detail( summ );
    %display_status_summary(summ);
    % Extract the temperature bytes
    tempNW = response(9);
    tempNE = response(10);
    tempSW = response(11);
    tempSE = response(12);
    tempController = response(13);
    % Parse the results into temperature report
    temp = [tempNW tempNE tempSW tempSE tempController];
    %display_temp(temp);
end

% Easily shows the status detail: Angles and frequency
function setup = quick_detail(serial)
% quick_detail Displays the angles and frequency of the current position
%   setup = quick_detail(serial)
%       serial: reference to opened serial port
%
%   quick_detail will return the Theta angle, Phi angle and
%   frequency of the PAA as currently set up

    % Starting byte (header)
    cmd = hex2dec('F1');
    % Send the command
    response = send_command(serial, cmd);
    % Parse the information received after requesting status detail
    [ack, setup, summ, temp] = decode_status_detail(response);
    % Parse together the setup, summary and temperature to return detail
    display_status(setup);
end

% Defines a function to display the ACK Status response
function display_ackstatus(tele)
    disp(" ");
    fprintf("Max temperature: %d\n", tele(1));
    fprintf("Min temperature: %d\n", tele(2));
    fprintf("Average Receive Gain: %f\n", tele(3));
    fprintf("Average Transmit Power: %f\n", tele(4));
    disp(" ");
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
    flag_fixed = bitget(byte, 8);
    flag_ack = bitget(byte, 7);
    flag_txrx = bitget(byte, 6);
    paa_fault = bitget(byte, 5);
    % Grab only the last 4 bits
    counter = bitand(byte, 15);

    if and(flag_ack, not(paa_fault))
        cmd_ack = 1;
        % Display to the user the ack status
        %if flag_ack disp_ack = "ACK"; else disp_ack = "NAK"; end
        %fprintf("Command sent was: %s\n", disp_ack)
        %if flag_txrx disp_txrx = "TX Mode"; else disp_txrx = "RX Mode"; end
        %fprintf("Currently set to: %s\n", disp_txrx)
        %if paa_fault disp_paaFault = "fault"; else disp_paaFault = "No fault"; end
        %fprintf("PAA: %s\n", disp_paaFault)
        %fprintf('Instruction counter: %d \n', counter )
    else
        cmd_ack = 0;
        disp("Try to send the command again, NAK or PAA fault received");
    end
end


function display_config(config)
    disp(" ")
    fprintf("Revision number: %s\n", config(1));
    fprintf("Serial number: %s\n", config(2));
    fprintf("IP Address: %s\n", config(3));
    disp(" ")
end

% % Defines a function to extract the ACK, Summary Status from Status Summary
% function [ack, summ] = decode_status_summary(response)
%     % Splice response into seperate bytes
%     %cmd = split(response, " ");
%     % Extract the ack/nack byte
%     ack = response(1);
%     % Decode the summary status byte into bits
%     summ = response(2);
% end

% Defines a function to display the status detail to matlab console
function display_status_detail(status, summ, temp)
    display_status(status);
    display_status_summary(summ);
    display_temp(temp);
end

% Defines a function to display the summary response
function display_status_summary(byte)
    %bin_summ = hex2dec(byte);
    % Extract particular position of bits
    flag_comm_error = bitget(byte, 1);
    flag_PAA_overcurrent_fault = bitget(byte, 2);
    flag_PAA_temperature_fault = bitget(byte, 3);
    flag_PAA_overTemp_fault = bitget(byte, 4);
    flag_PAA_failure = bitget(byte, 5);
    flag_digital_error = bitget(byte, 6);
    flag_RF_error = bitget(byte, 7);
    % Display the status in readable english
    disp(" "); % Leave empty line for readablity
    if flag_comm_error disp("Command Interface: Parity or format error"), else disp("Command Interface: No Error"), end
    if flag_PAA_overcurrent_fault disp("PAA Over-current: Fault"), else disp("PAA Over-current: No fault"), end
    if flag_PAA_temperature_fault disp("PAA Temperature: Warning"),else disp("PAA Temperature: Normal"), end
    if flag_PAA_overTemp_fault disp("PAA Over-Temperature: True"), else disp("PAA Over-Temperature: False"), end
    if flag_PAA_failure disp("PAA Failure: Fault"), else disp("PAA Failure: No Fault"), end
    if flag_digital_error disp("Digital Error: Fault"),else disp("Digital Error: No Fault"), end
    if flag_RF_error disp("RF Error: Fault"),else disp("RF Error: No Fault"), end
    disp(" "); % Leave empty line for readablity
end

function display_status(status)
    disp(" ")
    fprintf("PAA theta angle: %3.3f\n", status(1));
    fprintf("PAA phi angle: %3.3f\n", status(2));
    fprintf("PAA frequency: %3.3f\n", status(3));
    disp(" ")
end

function display_temp(temp)
    disp(" ")
    fprintf("Temperature Northwest: %d\n", temp(1));
    fprintf("Temperature Northeast: %d\n", temp(2));
    fprintf("Temperature Southwest: %d\n", temp(3));
    fprintf("Temperature Southeast: %d\n", temp(4));
    fprintf("Temperature Controller: %d\n", temp(5));
    disp(" ")
end






% --- BEGIN INTERMEDIATE FUNCTION DEFINITION WITH PAA ---

% Defines a function that sweeps through and grabs the average power
% received at current beam steered direction. Returns a spherical shell
% map representing the matrix
function dataOutput = PAA_map(serial, steer_param)
% PAA_map accepts angle parameters and sends them to the PAA and returns a
% matrix containing the average power observed at each pointing location
%   data = PAA_map(serial, steer_param)
%       serial: reference to opened serial port
%       steer_param: A double array in the form of [azum_min, azum_max,
%       azum_resolution, elev_min, elev_max, elev_resolution, frequency]
%

    % Define the limits of steering scope
    azum_min = steer_param(1); azum_max = steer_param(2); azum_res = steer_param(3);
    elev_min = steer_param(4); elev_max = steer_param(5); elev_res = steer_param(6);
    freq = steer_param(7);

    % Define the size of data memory to store the map
    azum_size = ceil( (azum_max - azum_min)/azum_res );
    azum_domain = azum_min:azum_res:azum_max;
    elev_size = ceil( (elev_max - elev_min)/elev_res );
    elev_domain = elev_min:elev_res:elev_max;
    % Define a matrix that can hold all the data
    avg_power_matrix = zeros(azum_size, elev_size);

    % Begin iteration
    for t = 1:length(azum_domain)
        for p = 1:length(elev_domain)
            %Assume PAA in receiving mode
            tele = command_PAA_point(serial, 0, 0, azum_domain(t), elev_domain(p), freq);
            [theta, phi] = convert_coord(azum_domain(t), elev_domain(p));
            fprintf("Sent: %f, %f \n", azum_domain(t), elev_domain(p));
            fprintf("Sent: %f, %f \n",theta, phi);
            setup = quick_detail(serial);
            % Once pointed, try to call/pull data from signal analyzer
            %data = call_spectrum_analyzer(port);
            % Compute the mean power

            % Append data to matrix
            avg_power_matrix(t, p) = 0;
        end
    end
    dataOutput = avg_power_matrix;
end

function [theta, phi] = convert_coord(azum, elev)
% convert_coord converts azumith/elevation  to spherical angles
%   [theta, phi] = convert_coord(azum, elev)
%       azum: double value [-90 to 90] representing x / azumith angle
%       elev: double value [-90 to 90] representing y / elevation angle
%
%   convert_coord takes two double values and returns two double values

    % Project the azumith and elevation angles into cartesian plane
    gx = cosd(elev) * sind(azum);
    gy = cosd(elev) * cosd(azum);
    gz = sind(elev);
    % Converts cartesian into spherical coordinates
    phi = atan2d(gz, -gx);
    theta = acosd(gy);
end

function data = call_spectrum_analyzer(port)
    % Set up connection with spectrum analyzer over IP

    % Connect the port

    % Send the command to pull data

    % Define frequency of interest

    % Calculate the time average mean power

    % Return the mean power
end



% --- END INTERMEDIATE FUNCITON DEFINITION WITH PAA ---
