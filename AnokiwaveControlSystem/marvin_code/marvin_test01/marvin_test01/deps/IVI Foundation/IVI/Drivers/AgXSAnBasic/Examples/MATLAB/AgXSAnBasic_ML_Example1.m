	% Copyright Keysight Technologies 2012-2019 
	%
	% Keysight IVI-COM Driver Example Program
	% 
	% Creates a driver object, reads a few Identity interface
	% properties, and checks the instrument error queue.
	% May include additional instrument specific functionality.
	% 
	% See driver help topic "Programming with the IVI-COM Driver in Various Development Environments"
	% for additional programming information.
	%
	% Runs in simulation mode without an instrument.

disp(blanks(1)');
disp('  ML_Example1');
try
    
    % Create driver instance
    driver = instrument.driver.AgXSAnBasic();
    driverAgXSAn = instrument.driver.AgXSAn();
    % Edit resource and options as needed.  Resource is ignored if option Simulate=true
    resourceDesc = 'GPIB0::18::INSTR';
    % resourceDesc = 'TCPIP0::<host_name or IP addr>::INSTR';

    initOptions = 'QueryInstrStatus=true, Simulate=true, DriverSetup= Model=, Trace=false';			
    idquery = true;
    reset   = true;

    driver.Initialize(resourceDesc, idquery, reset, initOptions);
    disp('Driver Initialized');

    driverAgXSAn.Initialize(resourceDesc, idquery, reset, initOptions);
    disp('Host Driver Initialized');
    % Print a few IIviDriver.Identity properties
    disp(['Identifier:      ', driver.Identity.Identifier]);
    disp(['Revision:        ', driver.Identity.Revision]);
    disp(['Vendor:          ', driver.Identity.Vendor]);
    disp(['Description:     ', driver.Identity.Description]);
    disp(['InstrumentModel: ', driver.Identity.InstrumentModel]);
    disp(['FirmwareRev:     ', driver.Identity.InstrumentFirmwareRevision]);
    disp(['Serial #:        ', driverAgXSAn.DeviceSpecific.System.SerialNumber]);
    simulate = driver.DriverOperation.Simulate;
    if simulate == true
		disp(blanks(1));
        disp('Simulate:        True');
    else
        disp('Simulate:        False');
    end
    disp(blanks(1));


    %Set Center frequency to 2.5 GHz using AgXSAn host driver
                driverAgXSAn.DeviceSpecific.Frequency.Center = 2.5E+9;
               disp('Center Frequency is set to');
                CenterFreq = driverAgXSAn.DeviceSpecific.Frequency.Center;
                disp(CenterFreq);
                %Set Input port to RF using AgXSAn host driver
                
                driverAgXSAn.DeviceSpecific.Input.Port = 3;
   
                disp('Spectrum Measurement');
   
                %Set frequency span to 25 MHz
                freqSpan = 25E+6;
                driver.DeviceSpecific.Spectrum.FrequencySpan = freqSpan;
                disp('Frequency span is set to : 25 MHz');

                %Read spectrum
                [spectrumRes] = driver.DeviceSpecific.Spectrum.Traces.Item(driver.DeviceSpecific.Spectrum.Traces.Name(1)).Read(5000);
                
                 disp(' Spectrum Ouput (Only <=100 Points): ');
                points = length(spectrumRes);                
                spoints = sprintf(' Points : %d', points);
                disp(spoints);
                if (points > 100)
                    points = 100;
                end
               str2 = '';
                for i = 1: points 
                    str = sprintf('%g',spectrumRes(i));
                    str2 = strcat(str2,str);                    
                    if(i<points)
                        str2 = strcat(str2,',');
                    end
                end
                disp(str2)
                  disp(blanks(2));
                  
                  
    %Waveform Section
                disp('Waveform Measurement');

                %Configure Waveform
                driver.DeviceSpecific.Waveform.Configure();
                
                model = driver.Identity.InstrumentModel;
                if ((strcmp(model,'M9420A') == 0) && (strcmp(model,'M9421A') == 0) && (strcmp(model,'M90XA') == 0) && (strcmp(model,'M8920A') == 0))
                    %Set power attenuation using the AgXSAn host driver to 20
                    powerAttenuation = 20;
                    driverAgXSAn.DeviceSpecific.Level.Attenuation = powerAttenuation;
                    powerAttenuation = driverAgXSAn.DeviceSpecific.Level.Attenuation;
                    disp('Power Attenuation is set to');
                    disp(powerAttenuation);

                    %Set power attenuation to 20
                    powerAttenuation = 20;
                    driver.DeviceSpecific.Input.RF.Attenuation = powerAttenuation;
                    disp('Power Attenuation is set to : 20');
                end
                %Set Sweep time to 5 ms
                sweepTime = 5E-3;
                driver.DeviceSpecific.Waveform.SweepTime = sweepTime;
                disp('SweepTime is set to : 5 ms');

                %read Waveforms
                [WaveformRes] = driver.DeviceSpecific.Waveform.Traces.Item(driver.DeviceSpecific.Waveform.Traces.Name(1)).Read(5000);
                disp(' Waveform Ouput (Only <=100 Points): ');
                points = length(WaveformRes);
                spoints = sprintf(' Points : %d', points);
                disp(spoints);
                if (points > 100)
                    points = 100;
                end
               str2 = '';
                for i = 1: points 
                    str = sprintf('%g',WaveformRes(i));
                    str2 = strcat(str2,str);                    
                    if(i<points)
                        str2 = strcat(str2,',');
                    end
                end
                disp(str2); 
    disp(blanks(2));
               				
    % Check instrument for errors
    errorNum = -1;
    errorMsg = ('');
    disp(blanks(1)');
    while (errorNum ~= 0)
    	[errorNum, errorMsg] = driver.Utility.ErrorQuery();
    	disp(['ErrorQuery: ', num2str(errorNum), ', ', errorMsg]);
    end

catch exception
    disp(getReport(exception));
end

if driver.Initialized
    driver.Close();
    disp('Driver Closed');
end


if driverAgXSAn.Initialized
    driverAgXSAn.Close();
    disp('Driver Closed');
end
disp('Done');
disp(blanks(1)');

