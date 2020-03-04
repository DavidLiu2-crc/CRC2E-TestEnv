	% keysightIVI-COM Driver Example Program
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
    driver = instrument.driver.AgXSAn();

    % Edit resource and options as needed.  Resource is ignored if option Simulate=true
    resourceDesc = 'MyAlias';
    % resourceDesc = 'TCPIP0::<host_name or IP addr>::INSTR';

    initOptions = 'QueryInstrStatus=true, Simulate=true, DriverSetup= Model=, Trace=false';			
    idquery = true;
    reset   = true;

    driver.Initialize(resourceDesc, idquery, reset, initOptions);
    disp('Driver Initialized');

    % Print a few IIviDriver.Identity properties
    disp(['Identifier:      ', driver.Identity.Identifier]);
    disp(['Revision:        ', driver.Identity.Revision]);
    disp(['Vendor:          ', driver.Identity.Vendor]);
    disp(['Description:     ', driver.Identity.Description]);
    disp(['InstrumentModel: ', driver.Identity.InstrumentModel]);
    disp(['FirmwareRev:     ', driver.Identity.InstrumentFirmwareRevision]);
    disp(['Serial #:        ', driver.DeviceSpecific.System.SerialNumber]);
    simulate = driver.DriverOperation.Simulate;
    if simulate == true
		disp(blanks(1));
        disp('Simulate:        True');
    else
        disp('Simulate:        False');
    end
    disp(blanks(1));

    model = driver.Identity.InstrumentModel;
    if (strcmp(model,'M9420A') == 0 && strcmp(model,'M9421A') == 0 && strcmp(model,'M90XA') == 0 && strcmp(model,'M8920A') == 0 && strcmp(model,'M9410A') == 0)
    disp('');
       
    

          disp('');
          disp('-------- DEMO MARKER MEASUREMENT -------');
          disp('');
                %Set the analyzer center frequency to 50MHZ
            driver.DeviceSpecific.Frequency.Center = 50000000.0;
            %Set the analyzer span to 50MHZ
            driver.DeviceSpecific.Frequency.Span = 50000000.0;
            %Turn on the 50 MHz calibrator signal
            driver.DeviceSpecific.Input.AmplitudeReference =0;
            %Set analyzer to continuous sweep mode
            driver.DeviceSpecific.Acquisition.ContinuousSweepModeEnabled = true;
            %User enters the peak excursion value
                 
            fPeakExcursion = input('Enter PEAK EXCURSION in dB: ');
            %Set the peak excursion
            driver.DeviceSpecific.SA.Marker.PeakExcursion = fPeakExcursion;
            %Set the peak thresold
            driver.DeviceSpecific.SA.Marker.Threshold = -90;
            %Trigger a sweep and wait for completion
            driver.DeviceSpecific.Trigger.Source = 0;
            System.Threading.Thread.Sleep(2000);
            %Set the marker to the maximum peak
            driver.DeviceSpecific.SA.Marker.Search(1);
            %Query, read and display the marker frequency
          disp('RESULT: Marker Frequency is:  Hz ');
          disp( driver.DeviceSpecific.SA.Marker.Position);
            %Query, read and display the marker amplitude
          disp('RESULT: Marker Amplitude is:  DB ');
          disp(driver.DeviceSpecific.SA.Marker.Amplitude);

          disp('');
          disp('-------- DEMO INTERNAL ALIGNMENT -------');
          disp('');
            
                %Initiate self-alignment
          disp('Performing self-alignment...');
            driver.DeviceSpecific.Calibration.Calibrate();
          disp('Alignment Successful');
           
          disp('');
          disp('-------- DEMO REAL64 TRACE DATA READ -------');
          disp('');

            %Set the analyzer center frequency to 50MHZ
            driver.DeviceSpecific.Frequency.Center = 50000000.0;
            %Set the analyzer span to 50MHZ
            driver.DeviceSpecific.Frequency.Span = 50000000.0;
            %Turn on the 50 MHz calibrator signal
            driver.DeviceSpecific.Input.AmplitudeReference = 0;
            %Set analyzer to continuous sweep mode
            driver.DeviceSpecific.Acquisition.ContinuousSweepModeEnabled = true;
            %Specify 10 dB per division for the amplitude scale.
            driver.DeviceSpecific.Display.YScale = 10;
            %Trigger a sweep and wait for sweep to complete Query the trace data
            
            
            TraceData = driver.DeviceSpecific.Traces.Item('TRACE1').ReadY(10000);
          disp('Trace Data : ');
            for idx = 1:length(TraceData)
              disp(TraceData(idx));
            end
            %Console.WriteLine(QuesCondition);
          disp('');
          disp('-------- DEMO POWER SUITE MEASUREMENT READ -------');
          disp('');

            %Set the analyzer center frequency to 50MHZ
            driver.DeviceSpecific.Frequency.Center = 50000000.0;
            %Set the analyzer span to 50MHZ
            driver.DeviceSpecific.Frequency.Span = 50000000.0;
            %Turn on the 50 MHz calibrator signal
            driver.DeviceSpecific.Input.AmplitudeReference = 0;
            %Set analyzer to continuous sweep mode
            driver.DeviceSpecific.Acquisition.ContinuousSweepModeEnabled = true;
            %Specify 10 dB per division for the amplitude scale.
            driver.DeviceSpecific.Display.YScale = 10;
            %Initiate CCDF pwer suite measurment
            %Trigger a sweep and wait for sweep to complete
            %Trigger a sweep and wait for completion
            driver.DeviceSpecific.SA.PowerStatistics.ConfigureNoPreset();
            driver.DeviceSpecific.SA.PowerStatistics.Traces.Initiate();
            %Query the trace data 
        
            CCDFData = driver.DeviceSpecific.SA.PowerStatistics.Traces.Item('PST_Results').Read(10000);
          disp('CCDF Data : ');
            for idx1 = 1:length(CCDFData)
              disp(CCDFData(idx1));
            end
    else 
        disp('M9420A, M9421A, M8920A and M90XA does not supports the SA application, they only supports few basic SA common commands, so this example will not work fully with this model.');
    end				
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

disp('Done');
disp(blanks(1)');

