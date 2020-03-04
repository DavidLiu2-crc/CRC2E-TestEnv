classdef ListSweep < instrument.ivicom.Interface
    %LISTSWEEP IAgXSAnSAListSweep interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = ListSweep(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);

            %% Initialize properties
            try
                obj.Bandwidth = instrument.driver.AgXSAn.DeviceSpecific.SA.ListSweep.Bandwidth(obj.interface.Bandwidth);
            catch %#ok<CTCH>
            end

            try
                obj.Frequency = instrument.driver.AgXSAn.DeviceSpecific.SA.ListSweep.Frequency(obj.interface.Frequency);
            catch %#ok<CTCH>
            end

            try
                obj.Sequence = instrument.driver.AgXSAn.DeviceSpecific.SA.ListSweep.Sequence(obj.interface.Sequence);
            catch %#ok<CTCH>
            end

            try
                obj.Trigger = instrument.driver.AgXSAn.DeviceSpecific.SA.ListSweep.Trigger(obj.interface.Trigger);
            catch %#ok<CTCH>
            end

            try
                obj.Time = instrument.driver.AgXSAn.DeviceSpecific.SA.ListSweep.Time(obj.interface.Time);
            catch %#ok<CTCH>
            end

            try
                obj.Detector = instrument.driver.AgXSAn.DeviceSpecific.SA.ListSweep.Detector(obj.interface.Detector);
            catch %#ok<CTCH>
            end

            try
                obj.Attenuation = instrument.driver.AgXSAn.DeviceSpecific.SA.ListSweep.Attenuation(obj.interface.Attenuation);
            catch %#ok<CTCH>
            end

        end
        
        function delete(obj)
            obj.Bandwidth = [];
            obj.Frequency = [];
            obj.Sequence = [];
            obj.Trigger = [];
            obj.Time = [];
            obj.Detector = [];
            obj.Attenuation = [];
        end

    end
    
    %% Public Properties
    properties

        %ENABLED Turns on/off the list sweep measurement and switch back to the normal swept measurement.
        Enabled

    end

    %% Public Read Only Properties
    properties (SetAccess = private)

        %BANDWIDTH Pointer to IAgXSAnSAListSweepBandwidth interface. Read Only.
        Bandwidth

        %FREQUENCY pointer to IAgXSAnSAListSweepFrequency interface. Read Only.
        Frequency

        %SEQUENCE Pointer to IAgXSAnSAListSweepSequence interface. Read Only.
        Sequence

        %TRIGGER Pointer to IAgXSAnSAListSweepTrigger interface. Read Only.
        Trigger

        %TIME Pointer to IAgXSAnSAListSweepTime interface. Read Only.
        Time

        %DETECTOR Pointer to IAgXSAnSAListSweepDetector interface. Read Only.
        Detector

        %ATTENUATION Pointer to IAgXSAnSAListSweepAttenuation interface. Read Only.
        Attenuation

    end

    %% Property access methods
    methods

        %% Bandwidth property access methods
        function value = get.Bandwidth(obj)
            obj.checkValidObj();
            if isempty(obj.Bandwidth)
                try
                    obj.Bandwidth = instrument.driver.AgXSAn.DeviceSpecific.SA.ListSweep.Bandwidth(obj.interface.Bandwidth);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Bandwidth;
        end

        %% Frequency property access methods
        function value = get.Frequency(obj)
            obj.checkValidObj();
            if isempty(obj.Frequency)
                try
                    obj.Frequency = instrument.driver.AgXSAn.DeviceSpecific.SA.ListSweep.Frequency(obj.interface.Frequency);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Frequency;
        end

        %% Sequence property access methods
        function value = get.Sequence(obj)
            obj.checkValidObj();
            if isempty(obj.Sequence)
                try
                    obj.Sequence = instrument.driver.AgXSAn.DeviceSpecific.SA.ListSweep.Sequence(obj.interface.Sequence);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Sequence;
        end

        %% Trigger property access methods
        function value = get.Trigger(obj)
            obj.checkValidObj();
            if isempty(obj.Trigger)
                try
                    obj.Trigger = instrument.driver.AgXSAn.DeviceSpecific.SA.ListSweep.Trigger(obj.interface.Trigger);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Trigger;
        end

        %% Time property access methods
        function value = get.Time(obj)
            obj.checkValidObj();
            if isempty(obj.Time)
                try
                    obj.Time = instrument.driver.AgXSAn.DeviceSpecific.SA.ListSweep.Time(obj.interface.Time);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Time;
        end

        %% Detector property access methods
        function value = get.Detector(obj)
            obj.checkValidObj();
            if isempty(obj.Detector)
                try
                    obj.Detector = instrument.driver.AgXSAn.DeviceSpecific.SA.ListSweep.Detector(obj.interface.Detector);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Detector;
        end

        %% Attenuation property access methods
        function value = get.Attenuation(obj)
            obj.checkValidObj();
            if isempty(obj.Attenuation)
                try
                    obj.Attenuation = instrument.driver.AgXSAn.DeviceSpecific.SA.ListSweep.Attenuation(obj.interface.Attenuation);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Attenuation;
        end

        %% Enabled property access methods
        function value = get.Enabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Enabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Enabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'Enabled');
            try
                obj.interface.Enabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

    %% Public Methods
    methods

        function Abort(obj)
            %ABORT If a sweep is in process when this function executes it aborts, and restarts after the function is complete.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.Abort();
            catch e
                obj.interpretError(e);
            end
        end

        function Configure(obj)
            %CONFIGURE The List Sweep measurement is designed for fast measurement throughput. It lets you remotely extract amplitude values for multiple detectors at known frequencies. You can configure the analyzer to make a list of single-point measurements. This list can then be run multiple times saving analyzer setup time and reducing I/O overhead and traffic. The measurements are all performed in zero-span for the first release.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.Configure();
            catch e
                obj.interpretError(e);
            end
        end

        function ConfigureNoPreset(obj)
            %CONFIGURENOPRESET Selects list sweep measurement as current measurement but does not restore its parameters to their default values.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.ConfigureNoPreset();
            catch e
                obj.interpretError(e);
            end
        end

        function val = Fetch(obj)
            %FETCH Puts selected data from the most recent measurement into the output buffer.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.Fetch();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function Initiate(obj)
            %INITIATE Initiates a trigger cycle for the measurement specified.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.Initiate();
            catch e
                obj.interpretError(e);
            end
        end

        function val = Measure(obj,MaxTime)
            %MEASURE Start measure the data in array.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            MaxTime = obj.checkScalarInt32Arg(MaxTime,'MaxTime');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.Measure(int32(MaxTime));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = Read(obj,MaxTime)
            %READ Initiates a measurement and puts the data into the output buffer.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            MaxTime = obj.checkScalarInt32Arg(MaxTime,'MaxTime');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.Read(int32(MaxTime));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function ConfigureParameters(obj,PeakMeasurementEnabled,RMSMeasurementEnabled,AveragingMeasurementEnabled,TriggerSource,TriggerSlope,TriggerOffset,GateLength)
            %CONFIGUREPARAMETERS Sets parameters to the entire list.
            
            obj.checkValidObj();
			error(nargchk(8,8,nargin,'struct'))
            PeakMeasurementEnabled = obj.checkScalarBoolArg(PeakMeasurementEnabled,'PeakMeasurementEnabled');
            RMSMeasurementEnabled = obj.checkScalarBoolArg(RMSMeasurementEnabled,'RMSMeasurementEnabled');
            AveragingMeasurementEnabled = obj.checkScalarBoolArg(AveragingMeasurementEnabled,'AveragingMeasurementEnabled');
            TriggerOffset = obj.checkScalarDoubleArg(TriggerOffset,'TriggerOffset');
            GateLength = obj.checkScalarDoubleArg(GateLength,'GateLength');
            try
                obj.interface.ConfigureParameters(logical(PeakMeasurementEnabled),logical(RMSMeasurementEnabled),logical(AveragingMeasurementEnabled),int32(TriggerSource),int32(TriggerSlope),double(TriggerOffset),double(GateLength));
            catch e
                obj.interpretError(e);
            end
        end

    end

end
