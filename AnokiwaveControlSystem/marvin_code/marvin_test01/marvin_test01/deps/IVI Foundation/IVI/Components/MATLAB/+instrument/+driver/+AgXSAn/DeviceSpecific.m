classdef DeviceSpecific < instrument.ivicom.Interface
    %DEVICESPECIFIC IAgXSAn6 interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = DeviceSpecific(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);

            %% Initialize properties
            try
                obj.Display3 = instrument.driver.AgXSAn.DeviceSpecific.Display3(obj.interface.Display3);
            catch %#ok<CTCH>
            end

            try
                obj.SA4 = instrument.driver.AgXSAn.DeviceSpecific.SA4(obj.interface.SA4);
            catch %#ok<CTCH>
            end

            try
                obj.Status2 = instrument.driver.AgXSAn.DeviceSpecific.Status2(obj.interface.Status2);
            catch %#ok<CTCH>
            end

            try
                obj.Calibration2 = instrument.driver.AgXSAn.DeviceSpecific.Calibration2(obj.interface.Calibration2);
            catch %#ok<CTCH>
            end

            try
                obj.Display2 = instrument.driver.AgXSAn.DeviceSpecific.Display2(obj.interface.Display2);
            catch %#ok<CTCH>
            end

            try
                obj.SA3 = instrument.driver.AgXSAn.DeviceSpecific.SA3(obj.interface.SA3);
            catch %#ok<CTCH>
            end

            try
                obj.Trigger3 = instrument.driver.AgXSAn.DeviceSpecific.Trigger3(obj.interface.Trigger3);
            catch %#ok<CTCH>
            end

            try
                obj.Frequency3 = instrument.driver.AgXSAn.DeviceSpecific.Frequency3(obj.interface.Frequency3);
            catch %#ok<CTCH>
            end

            try
                obj.Input2 = instrument.driver.AgXSAn.DeviceSpecific.Input2(obj.interface.Input2);
            catch %#ok<CTCH>
            end

            try
                obj.Level2 = instrument.driver.AgXSAn.DeviceSpecific.Level2(obj.interface.Level2);
            catch %#ok<CTCH>
            end

            try
                obj.System5 = instrument.driver.AgXSAn.DeviceSpecific.System5(obj.interface.System5);
            catch %#ok<CTCH>
            end

            try
                obj.SS = instrument.driver.AgXSAn.DeviceSpecific.SS(obj.interface.SS);
            catch %#ok<CTCH>
            end

            try
                obj.Output2 = instrument.driver.AgXSAn.DeviceSpecific.Output2(obj.interface.Output2);
            catch %#ok<CTCH>
            end

            try
                obj.System4 = instrument.driver.AgXSAn.DeviceSpecific.System4(obj.interface.System4);
            catch %#ok<CTCH>
            end

            try
                obj.Trigger2 = instrument.driver.AgXSAn.DeviceSpecific.Trigger2(obj.interface.Trigger2);
            catch %#ok<CTCH>
            end

            try
                obj.Frequency2 = instrument.driver.AgXSAn.DeviceSpecific.Frequency2(obj.interface.Frequency2);
            catch %#ok<CTCH>
            end

            try
                obj.System3 = instrument.driver.AgXSAn.DeviceSpecific.System3(obj.interface.System3);
            catch %#ok<CTCH>
            end

            try
                obj.SA2 = instrument.driver.AgXSAn.DeviceSpecific.SA2(obj.interface.SA2);
            catch %#ok<CTCH>
            end

            try
                obj.System2 = instrument.driver.AgXSAn.DeviceSpecific.System2(obj.interface.System2);
            catch %#ok<CTCH>
            end

            try
                obj.Traces = instrument.driver.AgXSAn.DeviceSpecific.Traces(obj.interface.Traces);
            catch %#ok<CTCH>
            end

            try
                obj.Level = instrument.driver.AgXSAn.DeviceSpecific.Level(obj.interface.Level);
            catch %#ok<CTCH>
            end

            try
                obj.Acquisition = instrument.driver.AgXSAn.DeviceSpecific.Acquisition(obj.interface.Acquisition);
            catch %#ok<CTCH>
            end

            try
                obj.Display = instrument.driver.AgXSAn.DeviceSpecific.Display(obj.interface.Display);
            catch %#ok<CTCH>
            end

            try
                obj.Trigger = instrument.driver.AgXSAn.DeviceSpecific.Trigger(obj.interface.Trigger);
            catch %#ok<CTCH>
            end

            try
                obj.Preselector = instrument.driver.AgXSAn.DeviceSpecific.Preselector(obj.interface.Preselector);
            catch %#ok<CTCH>
            end

            try
                obj.Events = instrument.driver.AgXSAn.DeviceSpecific.Events(obj.interface.Events);
            catch %#ok<CTCH>
            end

            try
                obj.Arm = instrument.driver.AgXSAn.DeviceSpecific.Arm(obj.interface.Arm);
            catch %#ok<CTCH>
            end

            try
                obj.EventLog = instrument.driver.AgXSAn.DeviceSpecific.EventLog(obj.interface.EventLog);
            catch %#ok<CTCH>
            end

            try
                obj.Time = instrument.driver.AgXSAn.DeviceSpecific.Time(obj.interface.Time);
            catch %#ok<CTCH>
            end

            try
                obj.SA = instrument.driver.AgXSAn.DeviceSpecific.SA(obj.interface.SA);
            catch %#ok<CTCH>
            end

            try
                obj.Catalog = instrument.driver.AgXSAn.DeviceSpecific.Catalog(obj.interface.Catalog);
            catch %#ok<CTCH>
            end

            try
                obj.Calibration = instrument.driver.AgXSAn.DeviceSpecific.Calibration(obj.interface.Calibration);
            catch %#ok<CTCH>
            end

            try
                obj.HardCopy = instrument.driver.AgXSAn.DeviceSpecific.HardCopy(obj.interface.HardCopy);
            catch %#ok<CTCH>
            end

            try
                obj.RefOscillator = instrument.driver.AgXSAn.DeviceSpecific.RefOscillator(obj.interface.RefOscillator);
            catch %#ok<CTCH>
            end

            try
                obj.StateTriggers = instrument.driver.AgXSAn.DeviceSpecific.StateTriggers(obj.interface.StateTriggers);
            catch %#ok<CTCH>
            end

            try
                obj.Status = instrument.driver.AgXSAn.DeviceSpecific.Status(obj.interface.Status);
            catch %#ok<CTCH>
            end

            try
                obj.System = instrument.driver.AgXSAn.DeviceSpecific.System(obj.interface.System);
            catch %#ok<CTCH>
            end

            try
                obj.Frequency = instrument.driver.AgXSAn.DeviceSpecific.Frequency(obj.interface.Frequency);
            catch %#ok<CTCH>
            end

            try
                obj.Radio = instrument.driver.AgXSAn.DeviceSpecific.Radio(obj.interface.Radio);
            catch %#ok<CTCH>
            end

            try
                obj.AnalogDemodulator = instrument.driver.AgXSAn.DeviceSpecific.AnalogDemodulator(obj.interface.AnalogDemodulator);
            catch %#ok<CTCH>
            end

            try
                obj.Input = instrument.driver.AgXSAn.DeviceSpecific.Input(obj.interface.Input);
            catch %#ok<CTCH>
            end

            try
                obj.MemoryOperation = instrument.driver.AgXSAn.DeviceSpecific.MemoryOperation(obj.interface.MemoryOperation);
            catch %#ok<CTCH>
            end

            try
                obj.Output = instrument.driver.AgXSAn.DeviceSpecific.Output(obj.interface.Output);
            catch %#ok<CTCH>
            end

            try
                obj.DriverOperation = instrument.driver.AgXSAn.DeviceSpecific.DriverOperation(obj.interface.DriverOperation);
            catch %#ok<CTCH>
            end

            try
                obj.Identity = instrument.driver.AgXSAn.DeviceSpecific.Identity(obj.interface.Identity);
            catch %#ok<CTCH>
            end

            try
                obj.Utility = instrument.driver.AgXSAn.DeviceSpecific.Utility(obj.interface.Utility);
            catch %#ok<CTCH>
            end

        end
        
        function delete(obj)
            obj.Display3 = [];
            obj.SA4 = [];
            obj.Status2 = [];
            obj.Calibration2 = [];
            obj.Display2 = [];
            obj.SA3 = [];
            obj.Trigger3 = [];
            obj.Frequency3 = [];
            obj.Input2 = [];
            obj.Level2 = [];
            obj.System5 = [];
            obj.SS = [];
            obj.Output2 = [];
            obj.System4 = [];
            obj.Trigger2 = [];
            obj.Frequency2 = [];
            obj.System3 = [];
            obj.SA2 = [];
            obj.System2 = [];
            obj.Traces = [];
            obj.Level = [];
            obj.Acquisition = [];
            obj.Display = [];
            obj.Trigger = [];
            obj.Preselector = [];
            obj.Events = [];
            obj.Arm = [];
            obj.EventLog = [];
            obj.Time = [];
            obj.SA = [];
            obj.Catalog = [];
            obj.Calibration = [];
            obj.HardCopy = [];
            obj.RefOscillator = [];
            obj.StateTriggers = [];
            obj.Status = [];
            obj.System = [];
            obj.Frequency = [];
            obj.Radio = [];
            obj.AnalogDemodulator = [];
            obj.Input = [];
            obj.MemoryOperation = [];
            obj.Output = [];
            obj.DriverOperation = [];
            obj.Identity = [];
            obj.Utility = [];
        end

    end
    
    %% Public Read Only Properties
    properties (SetAccess = private)

        %DISPLAY3 Pointer to the IAgXSAnDisplay interface. Read Only.
        Display3

        %SA4 Pointer to the IAgXSAnSA nterface. Read Only.
        SA4

        %STATUS2 Pointer to the IAgXSAnStatus interface. Read Only.
        Status2

        %CALIBRATION2 Pointer to the IAgXSAnCalibration interface. Read Only.
        Calibration2

        %DISPLAY2 Pointer to the IAgXSAnDisplay interface. Read Only.
        Display2

        %SA3 Pointer to the IAgXSAnSA nterface. Read Only.
        SA3

        %TRIGGER3 Pointer to the IAgXSAnTrigger interface Read Only.
        Trigger3

        %FREQUENCY3 Pointer to IAgXSAnFrequency interface. Read Only.
        Frequency3

        %INPUT2 Pointer to IAgXSAnInput interface. Read Only.
        Input2

        %LEVEL2 Pointer to the IAgXSAnLevel interface Read Only.
        Level2

        %SYSTEM5 Pointer to the IAgXSAnSystem interface. Read Only.
        System5

        %SS Pointer to the IAgXSAn5SS interface. Read Only.
        SS

        %OUTPUT2 Pointer to the IAgXSAnOutput interface. Read Only.
        Output2

        %SYSTEM4 Pointer to the IAgXSAnSystem interface. Read Only.
        System4

        %TRIGGER2 Pointer to the IAgXSAnTrigger interface Read Only.
        Trigger2

        %FREQUENCY2 Pointer to IAgXSAnFrequency interface. Read Only.
        Frequency2

        %SYSTEM3 Pointer to the IAgXSAnSystem interface. Read Only.
        System3

        %SA2 Pointer to the IAgXSAnSA nterface. Read Only.
        SA2

        %SYSTEM2 Pointer to the IAgXSAnSystem interface. Read Only.
        System2

        %TRACES Pointer to the IAgXSAnTraces interface. Read Only.
        Traces

        %LEVEL Pointer to the IAgXSAnLevel interface Read Only.
        Level

        %ACQUISITION Pointer to the IAgXSAnAcquisition interface Read Only.
        Acquisition

        %DISPLAY Pointer to the IAgXSAnDisplay interface. Read Only.
        Display

        %TRIGGER Pointer to the IAgXSAnTrigger interface Read Only.
        Trigger

        %PRESELECTOR Pointer to the IAgXSAnPreselector interface Read Only.
        Preselector

        %EVENTS Pointer to the IAgXSAnEvents interface. Read Only.
        Events

        %ARM Pointer to the IAgXSAnArm interface. Read Only.
        Arm

        %EVENTLOG Pointer to the IAgXSAnEventLog interface. Read Only.
        EventLog

        %TIME Pointer to the IAgXSAnTime interface. Read Only.
        Time

        %SA Pointer to the IAgXSAnSA nterface. Read Only.
        SA

        %CATALOG Pointer to the IAgXSAnCatalog interface. Read Only.
        Catalog

        %CALIBRATION Pointer to the IAgXSAnCalibration interface. Read Only.
        Calibration

        %HARDCOPY Pointer to the IAgXSAnHardCopy interface. Read Only.
        HardCopy

        %REFOSCILLATOR Pointer to the IAgXSAnRefOscillator interface. Read Only.
        RefOscillator

        %STATETRIGGERS Pointer to the IAgXSAnStateTriggers interface. Read Only.
        StateTriggers

        %STATUS Pointer to the IAgXSAnStatus interface. Read Only.
        Status

        %SYSTEM Pointer to the IAgXSAnSystem interface. Read Only.
        System

        %FREQUENCY Pointer to IAgXSAnFrequency interface. Read Only.
        Frequency

        %RADIO Pointer to IAgXSAnRadio interface. Read Only.
        Radio

        %ANALOGDEMODULATOR Pointer to IAgXSAnAnalogDemodulator. Read Only.
        AnalogDemodulator

        %INPUT Pointer to IAgXSAnInput interface. Read Only.
        Input

        %MEMORYOPERATION Pointer to the IAgXSAnMemoryOperation interface. Read Only.
        MemoryOperation

        %OUTPUT Pointer to the IAgXSAnOutput interface. Read Only.
        Output

        %DRIVEROPERATION Pointer to the IAgXSAnDriverOperation interface Read Only.
        DriverOperation

        %IDENTITY Pointer to the IAgXSAnIdentity interface Read Only.
        Identity

        %UTILITY Pointer to the IAgXSAnUtility interface Read Only.
        Utility

        %INITIALIZED Initialized is True between a successful call to the Initialize method and a successful call to the Close method, and False at all other times. Read Only.
        Initialized

    end

    %% Property access methods
    methods

        %% Display3 property access methods
        function value = get.Display3(obj)
            obj.checkValidObj();
            if isempty(obj.Display3)
                try
                    obj.Display3 = instrument.driver.AgXSAn.DeviceSpecific.Display3(obj.interface.Display3);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Display3;
        end

        %% SA4 property access methods
        function value = get.SA4(obj)
            obj.checkValidObj();
            if isempty(obj.SA4)
                try
                    obj.SA4 = instrument.driver.AgXSAn.DeviceSpecific.SA4(obj.interface.SA4);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.SA4;
        end

        %% Status2 property access methods
        function value = get.Status2(obj)
            obj.checkValidObj();
            if isempty(obj.Status2)
                try
                    obj.Status2 = instrument.driver.AgXSAn.DeviceSpecific.Status2(obj.interface.Status2);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Status2;
        end

        %% Calibration2 property access methods
        function value = get.Calibration2(obj)
            obj.checkValidObj();
            if isempty(obj.Calibration2)
                try
                    obj.Calibration2 = instrument.driver.AgXSAn.DeviceSpecific.Calibration2(obj.interface.Calibration2);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Calibration2;
        end

        %% Display2 property access methods
        function value = get.Display2(obj)
            obj.checkValidObj();
            if isempty(obj.Display2)
                try
                    obj.Display2 = instrument.driver.AgXSAn.DeviceSpecific.Display2(obj.interface.Display2);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Display2;
        end

        %% SA3 property access methods
        function value = get.SA3(obj)
            obj.checkValidObj();
            if isempty(obj.SA3)
                try
                    obj.SA3 = instrument.driver.AgXSAn.DeviceSpecific.SA3(obj.interface.SA3);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.SA3;
        end

        %% Trigger3 property access methods
        function value = get.Trigger3(obj)
            obj.checkValidObj();
            if isempty(obj.Trigger3)
                try
                    obj.Trigger3 = instrument.driver.AgXSAn.DeviceSpecific.Trigger3(obj.interface.Trigger3);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Trigger3;
        end

        %% Frequency3 property access methods
        function value = get.Frequency3(obj)
            obj.checkValidObj();
            if isempty(obj.Frequency3)
                try
                    obj.Frequency3 = instrument.driver.AgXSAn.DeviceSpecific.Frequency3(obj.interface.Frequency3);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Frequency3;
        end

        %% Input2 property access methods
        function value = get.Input2(obj)
            obj.checkValidObj();
            if isempty(obj.Input2)
                try
                    obj.Input2 = instrument.driver.AgXSAn.DeviceSpecific.Input2(obj.interface.Input2);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Input2;
        end

        %% Level2 property access methods
        function value = get.Level2(obj)
            obj.checkValidObj();
            if isempty(obj.Level2)
                try
                    obj.Level2 = instrument.driver.AgXSAn.DeviceSpecific.Level2(obj.interface.Level2);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Level2;
        end

        %% System5 property access methods
        function value = get.System5(obj)
            obj.checkValidObj();
            if isempty(obj.System5)
                try
                    obj.System5 = instrument.driver.AgXSAn.DeviceSpecific.System5(obj.interface.System5);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.System5;
        end

        %% SS property access methods
        function value = get.SS(obj)
            obj.checkValidObj();
            if isempty(obj.SS)
                try
                    obj.SS = instrument.driver.AgXSAn.DeviceSpecific.SS(obj.interface.SS);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.SS;
        end

        %% Output2 property access methods
        function value = get.Output2(obj)
            obj.checkValidObj();
            if isempty(obj.Output2)
                try
                    obj.Output2 = instrument.driver.AgXSAn.DeviceSpecific.Output2(obj.interface.Output2);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Output2;
        end

        %% System4 property access methods
        function value = get.System4(obj)
            obj.checkValidObj();
            if isempty(obj.System4)
                try
                    obj.System4 = instrument.driver.AgXSAn.DeviceSpecific.System4(obj.interface.System4);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.System4;
        end

        %% Trigger2 property access methods
        function value = get.Trigger2(obj)
            obj.checkValidObj();
            if isempty(obj.Trigger2)
                try
                    obj.Trigger2 = instrument.driver.AgXSAn.DeviceSpecific.Trigger2(obj.interface.Trigger2);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Trigger2;
        end

        %% Frequency2 property access methods
        function value = get.Frequency2(obj)
            obj.checkValidObj();
            if isempty(obj.Frequency2)
                try
                    obj.Frequency2 = instrument.driver.AgXSAn.DeviceSpecific.Frequency2(obj.interface.Frequency2);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Frequency2;
        end

        %% System3 property access methods
        function value = get.System3(obj)
            obj.checkValidObj();
            if isempty(obj.System3)
                try
                    obj.System3 = instrument.driver.AgXSAn.DeviceSpecific.System3(obj.interface.System3);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.System3;
        end

        %% SA2 property access methods
        function value = get.SA2(obj)
            obj.checkValidObj();
            if isempty(obj.SA2)
                try
                    obj.SA2 = instrument.driver.AgXSAn.DeviceSpecific.SA2(obj.interface.SA2);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.SA2;
        end

        %% System2 property access methods
        function value = get.System2(obj)
            obj.checkValidObj();
            if isempty(obj.System2)
                try
                    obj.System2 = instrument.driver.AgXSAn.DeviceSpecific.System2(obj.interface.System2);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.System2;
        end

        %% Traces property access methods
        function value = get.Traces(obj)
            obj.checkValidObj();
            if isempty(obj.Traces)
                try
                    obj.Traces = instrument.driver.AgXSAn.DeviceSpecific.Traces(obj.interface.Traces);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Traces;
        end

        %% Level property access methods
        function value = get.Level(obj)
            obj.checkValidObj();
            if isempty(obj.Level)
                try
                    obj.Level = instrument.driver.AgXSAn.DeviceSpecific.Level(obj.interface.Level);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Level;
        end

        %% Acquisition property access methods
        function value = get.Acquisition(obj)
            obj.checkValidObj();
            if isempty(obj.Acquisition)
                try
                    obj.Acquisition = instrument.driver.AgXSAn.DeviceSpecific.Acquisition(obj.interface.Acquisition);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Acquisition;
        end

        %% Display property access methods
        function value = get.Display(obj)
            obj.checkValidObj();
            if isempty(obj.Display)
                try
                    obj.Display = instrument.driver.AgXSAn.DeviceSpecific.Display(obj.interface.Display);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Display;
        end

        %% Trigger property access methods
        function value = get.Trigger(obj)
            obj.checkValidObj();
            if isempty(obj.Trigger)
                try
                    obj.Trigger = instrument.driver.AgXSAn.DeviceSpecific.Trigger(obj.interface.Trigger);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Trigger;
        end

        %% Preselector property access methods
        function value = get.Preselector(obj)
            obj.checkValidObj();
            if isempty(obj.Preselector)
                try
                    obj.Preselector = instrument.driver.AgXSAn.DeviceSpecific.Preselector(obj.interface.Preselector);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Preselector;
        end

        %% Events property access methods
        function value = get.Events(obj)
            obj.checkValidObj();
            if isempty(obj.Events)
                try
                    obj.Events = instrument.driver.AgXSAn.DeviceSpecific.Events(obj.interface.Events);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Events;
        end

        %% Arm property access methods
        function value = get.Arm(obj)
            obj.checkValidObj();
            if isempty(obj.Arm)
                try
                    obj.Arm = instrument.driver.AgXSAn.DeviceSpecific.Arm(obj.interface.Arm);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Arm;
        end

        %% EventLog property access methods
        function value = get.EventLog(obj)
            obj.checkValidObj();
            if isempty(obj.EventLog)
                try
                    obj.EventLog = instrument.driver.AgXSAn.DeviceSpecific.EventLog(obj.interface.EventLog);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.EventLog;
        end

        %% Time property access methods
        function value = get.Time(obj)
            obj.checkValidObj();
            if isempty(obj.Time)
                try
                    obj.Time = instrument.driver.AgXSAn.DeviceSpecific.Time(obj.interface.Time);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Time;
        end

        %% SA property access methods
        function value = get.SA(obj)
            obj.checkValidObj();
            if isempty(obj.SA)
                try
                    obj.SA = instrument.driver.AgXSAn.DeviceSpecific.SA(obj.interface.SA);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.SA;
        end

        %% Catalog property access methods
        function value = get.Catalog(obj)
            obj.checkValidObj();
            if isempty(obj.Catalog)
                try
                    obj.Catalog = instrument.driver.AgXSAn.DeviceSpecific.Catalog(obj.interface.Catalog);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Catalog;
        end

        %% Calibration property access methods
        function value = get.Calibration(obj)
            obj.checkValidObj();
            if isempty(obj.Calibration)
                try
                    obj.Calibration = instrument.driver.AgXSAn.DeviceSpecific.Calibration(obj.interface.Calibration);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Calibration;
        end

        %% HardCopy property access methods
        function value = get.HardCopy(obj)
            obj.checkValidObj();
            if isempty(obj.HardCopy)
                try
                    obj.HardCopy = instrument.driver.AgXSAn.DeviceSpecific.HardCopy(obj.interface.HardCopy);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.HardCopy;
        end

        %% RefOscillator property access methods
        function value = get.RefOscillator(obj)
            obj.checkValidObj();
            if isempty(obj.RefOscillator)
                try
                    obj.RefOscillator = instrument.driver.AgXSAn.DeviceSpecific.RefOscillator(obj.interface.RefOscillator);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.RefOscillator;
        end

        %% StateTriggers property access methods
        function value = get.StateTriggers(obj)
            obj.checkValidObj();
            if isempty(obj.StateTriggers)
                try
                    obj.StateTriggers = instrument.driver.AgXSAn.DeviceSpecific.StateTriggers(obj.interface.StateTriggers);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.StateTriggers;
        end

        %% Status property access methods
        function value = get.Status(obj)
            obj.checkValidObj();
            if isempty(obj.Status)
                try
                    obj.Status = instrument.driver.AgXSAn.DeviceSpecific.Status(obj.interface.Status);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Status;
        end

        %% System property access methods
        function value = get.System(obj)
            obj.checkValidObj();
            if isempty(obj.System)
                try
                    obj.System = instrument.driver.AgXSAn.DeviceSpecific.System(obj.interface.System);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.System;
        end

        %% Frequency property access methods
        function value = get.Frequency(obj)
            obj.checkValidObj();
            if isempty(obj.Frequency)
                try
                    obj.Frequency = instrument.driver.AgXSAn.DeviceSpecific.Frequency(obj.interface.Frequency);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Frequency;
        end

        %% Radio property access methods
        function value = get.Radio(obj)
            obj.checkValidObj();
            if isempty(obj.Radio)
                try
                    obj.Radio = instrument.driver.AgXSAn.DeviceSpecific.Radio(obj.interface.Radio);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Radio;
        end

        %% AnalogDemodulator property access methods
        function value = get.AnalogDemodulator(obj)
            obj.checkValidObj();
            if isempty(obj.AnalogDemodulator)
                try
                    obj.AnalogDemodulator = instrument.driver.AgXSAn.DeviceSpecific.AnalogDemodulator(obj.interface.AnalogDemodulator);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.AnalogDemodulator;
        end

        %% Input property access methods
        function value = get.Input(obj)
            obj.checkValidObj();
            if isempty(obj.Input)
                try
                    obj.Input = instrument.driver.AgXSAn.DeviceSpecific.Input(obj.interface.Input);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Input;
        end

        %% MemoryOperation property access methods
        function value = get.MemoryOperation(obj)
            obj.checkValidObj();
            if isempty(obj.MemoryOperation)
                try
                    obj.MemoryOperation = instrument.driver.AgXSAn.DeviceSpecific.MemoryOperation(obj.interface.MemoryOperation);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.MemoryOperation;
        end

        %% Output property access methods
        function value = get.Output(obj)
            obj.checkValidObj();
            if isempty(obj.Output)
                try
                    obj.Output = instrument.driver.AgXSAn.DeviceSpecific.Output(obj.interface.Output);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Output;
        end

        %% DriverOperation property access methods
        function value = get.DriverOperation(obj)
            obj.checkValidObj();
            if isempty(obj.DriverOperation)
                try
                    obj.DriverOperation = instrument.driver.AgXSAn.DeviceSpecific.DriverOperation(obj.interface.DriverOperation);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.DriverOperation;
        end

        %% Identity property access methods
        function value = get.Identity(obj)
            obj.checkValidObj();
            if isempty(obj.Identity)
                try
                    obj.Identity = instrument.driver.AgXSAn.DeviceSpecific.Identity(obj.interface.Identity);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Identity;
        end

        %% Utility property access methods
        function value = get.Utility(obj)
            obj.checkValidObj();
            if isempty(obj.Utility)
                try
                    obj.Utility = instrument.driver.AgXSAn.DeviceSpecific.Utility(obj.interface.Utility);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Utility;
        end

        %% Initialized property access methods
        function value = get.Initialized(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Initialized;
            catch e
                obj.interpretError(e);
            end
        end

    end

    %% Public Methods
    methods

        function SelectInstrPersonality(obj,PersonalityName)
            %SELECTINSTRPERSONALITY This method can be used to select the different installed personalities in the instrument.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            PersonalityName = obj.checkScalarStringArg(PersonalityName,'PersonalityName');
            try
                obj.interface.SelectInstrPersonality(char(PersonalityName));
            catch e
                obj.interpretError(e);
            end
        end

        function Initialize(obj,ResourceName,IdQuery,Reset,OptionString)
            %INITIALIZE Opens the I/O session to the instrument.  Driver methods and properties that access the instrument are only accessible after Initialize is called.  Initialize optionally performs a Reset and queries the instrument to validate the instrument model.
            
            obj.checkValidObj();
			error(nargchk(5,5,nargin,'struct'))
            ResourceName = obj.checkScalarStringArg(ResourceName,'ResourceName');
            IdQuery = obj.checkScalarBoolArg(IdQuery,'IdQuery');
            Reset = obj.checkScalarBoolArg(Reset,'Reset');
            OptionString = obj.checkScalarStringArg(OptionString,'OptionString');
            try
                obj.interface.Initialize(char(ResourceName),logical(IdQuery),logical(Reset),char(OptionString));
            catch e
                obj.interpretError(e);
            end
        end

        function Close(obj)
            %CLOSE Closes the I/O session to the instrument.  Driver methods and properties that access the instrument are not accessible after Close is called.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.Close();
            catch e
                obj.interpretError(e);
            end
        end

    end

end
