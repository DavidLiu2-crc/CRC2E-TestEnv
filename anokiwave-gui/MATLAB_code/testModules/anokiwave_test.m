% Close all open ports
fclose(instrfind)

%%% FSW

% Open VISA object for R&S FSW
visaObj = visa('agilent', 'TCPIP0::142.92.75.111::hislip0');
visaObj.ByteOrder = 'littleEndian';
visaObj.EOSMode = 'read&write';
visaObj.EOSCharCode = 'LF';
visaObj.Timeout = 45;
fopen(visaObj);
fprintf(visaObj, '*RST;*CLS');
visaObj.Timeout = 5;
fprintf(visaObj, '*CLS;*RST');                  % Clear error queue and mode preset
%     fprintf(visaObj, 'SYST:DISP:UPD OFF');          % No display for improved performance
fprintf(visaObj, 'INST IQ');                    % Open IQ Analyzer
fprintf(visaObj, 'INP:ATT 0');
fprintf(visaObj, 'FREQ:CENT 28 GHz');
fprintf(visaObj, 'TRAC:IQ:SRAT 200 MHz'); % Set sample rate
fprintf(visaObj, 'TRAC:IQ:RLEN 1000');
fprintf(visaObj, 'TRAC:IQ:DATA:FORM IQP');
fprintf(visaObj, 'FORM REAL,32');
fprintf(visaObj, 'INIT:CONT OFF');              % Turn off continuous triggering
fprintf(visaObj, '*WAI');                       % Wait until finished   
% fprintf(visaObj, 'TRIG:SOUR TIME');             % Set trigger source to periodic timer

%%% ANOKIWAVE

% Open a COM port
s = serial('COM4', 'BaudRate', 115200);
fopen(s)

% Enable beam
enable_beam(s, true);

% Scan beam
for az = -40:20:40
    for el = -40:20:40
        
        % Steer beam
        vx = sind(az)*cosd(el);
        vy = cosd(az)*cosd(el);
        vz = sind(el);
        phi = atan2d(vz, -vx);
        theta = acosd(vy);
        steer_beam(s, theta, phi, false, 0, 28000);
        
        % Pause
        pause(0.5)
        
        % Acquire data
        fprintf(visaObj, 'INIT:IMM;*WAI');
        
    end
end

% Disable beam
enable_beam(s, false);

% Close ports
fclose(s)
fclose(visaObj)

disp('')

function ack = enable_beam(s, enable)
    % Write command
    cmd = hex2dec('E0');                % Header
    if enable, enable = 1; end;         % Enable (true/false)
    cmd = [cmd enable];
    fwrite(s, [cmd, checksum(cmd)]);
    % Read response
    ack = fread(s, 1);                  % ACK/NACK
end

function ack = steer_beam(s, theta, phi, tx_mode, bw, fMHz)
    % Write command
    cmd = hex2dec('A0');                % Header
    bcb = 0;                            % Beam configuration byte
    if tx_mode bcb = bcb + 4; end;      % - Transmit mode (true/false)
    bcb = bcb + bw;                     % - Beam width (0-3)
    [mst, lst] = theta_uint16(theta);    % Theta
    [msp, lsp] = phi_uint16(phi);        % Phi
    [msf, lsf] = freq_uint16(fMHz);      % Frequency (MHz)
    cmd = [cmd bcb mst lst msp lsp msf lsf];
    fwrite(s, [cmd, checksum(cmd)]);
    % Read response
    ack = fread(s, 1);                  % ACK/NACK
end

function [msb, lsb] = theta_uint16(theta)
    val = floor((theta/90)*65536);
    msb = floor(val/256);
    lsb = val - 256*msb;
end

function [msb, lsb] = phi_uint16(theta)
    val = floor((theta/360)*65536);
    msb = floor(val/256);
    lsb = val - 256*msb;
end

function [msb, lsb] = freq_uint16(fMHz)
    val = floor(fMHz);
    msb = floor(val/256);
    lsb = val - 256*msb;
end

function c = checksum(cmd)
    c = cmd(1);
    for n = 2:length(cmd)
        c = xor(c, cmd(n));
    end
end