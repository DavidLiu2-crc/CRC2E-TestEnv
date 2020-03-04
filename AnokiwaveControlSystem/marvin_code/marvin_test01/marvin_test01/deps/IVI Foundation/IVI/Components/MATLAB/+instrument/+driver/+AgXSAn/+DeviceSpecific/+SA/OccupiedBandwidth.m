classdef OccupiedBandwidth < instrument.ivicom.Interface
    %OCCUPIEDBANDWIDTH IAgXSAnSAOccupiedBandwidth interface
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = OccupiedBandwidth(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);

            %% Initialize properties
            try
                obj.Traces = instrument.driver.AgXSAn.DeviceSpecific.SA.OccupiedBandwidth.Traces(obj.interface.Traces);
            catch %#ok<CTCH>
            end

            try
                obj.Average = instrument.driver.AgXSAn.DeviceSpecific.SA.OccupiedBandwidth.Average(obj.interface.Average);
            catch %#ok<CTCH>
            end

            try
                obj.Frequency = instrument.driver.AgXSAn.DeviceSpecific.SA.OccupiedBandwidth.Frequency(obj.interface.Frequency);
            catch %#ok<CTCH>
            end

            try
                obj.Display = instrument.driver.AgXSAn.DeviceSpecific.SA.OccupiedBandwidth.Display(obj.interface.Display);
            catch %#ok<CTCH>
            end

            try
                obj.Marker = instrument.driver.AgXSAn.DeviceSpecific.SA.OccupiedBandwidth.Marker(obj.interface.Marker);
            catch %#ok<CTCH>
            end

            try
                obj.SweepCoupling = instrument.driver.AgXSAn.DeviceSpecific.SA.OccupiedBandwidth.SweepCoupling(obj.interface.SweepCoupling);
            catch %#ok<CTCH>
            end

        end
        
        function delete(obj)
            obj.Traces = [];
            obj.Average = [];
            obj.Frequency = [];
            obj.Display = [];
            obj.Marker = [];
            obj.SweepCoupling = [];
        end

    end
    
    %% Public Properties
    properties

        %DETECTORTYPE Sets/Gets a detector to be used by the analyzer for the Occupied Bandwidth measurement.
        DetectorType

        %DETECTORTYPEAUTOENABLED Sets/Gets the detector for the currently selected trace to auto.
        DetectorTypeAutoEnabled

        %PERCENTPOWER Assigns/Queries the percentage of the total power that is measured within the Occupied Bandwidth for the current measurement.
        PercentPower

        %LIMITTESTFREQUENCY Turns on or off limit checking at the specified frequency.
        LimitTestFrequency

        %LIMITTESTENABLED Turns limit checking for each offset On or Off. 
        LimitTestEnabled

        %TRIGGERSOURCE Sets/Gets the source of the trigger.
        TriggerSource

        %IFGAIN Selects the range of the IF Gain.
        IFGain

        %IFGAINAUTOENABLED Activates the auto rules for IF Gain. When Auto is active, the IF Gain is set to High Gain under any of the following conditions: The input attenuator is set to 0 dB The preamp is turned On and the frequency range is under 3.6 GHz For other settings, Auto sets the IF Gain to Low Gain.
        IFGainAutoEnabled

    end

    %% Public Read Only Properties
    properties (SetAccess = private)

        %TRACES Pointer to the IAgXSAnSAOccupiedBandwidthTraces interface. Read Only.
        Traces

        %AVERAGE Pointer to IAgXSAnSAOccupiedBandwidthAverage interface. Read Only.
        Average

        %FREQUENCY Pointer to IAgXSAnSAOccupiedBandwidthFrequency interface. Read Only.
        Frequency

        %DISPLAY Pointer to IAgXSAnSAOccupiedBandwidthDisplay interface. Read Only.
        Display

        %MARKER Pointer to IAgXSAnSAOccupiedBandwidthMarker interface. Read Only.
        Marker

        %SWEEPCOUPLING Pointer to IAgXSAnSAOccupiedBandwidthSweepCoupling interface. Read Only.
        SweepCoupling

    end

    %% Property access methods
    methods

        %% Traces property access methods
        function value = get.Traces(obj)
            obj.checkValidObj();
            if isempty(obj.Traces)
                try
                    obj.Traces = instrument.driver.AgXSAn.DeviceSpecific.SA.OccupiedBandwidth.Traces(obj.interface.Traces);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Traces;
        end

        %% DetectorType property access methods
        function value = get.DetectorType(obj)
            obj.checkValidObj();
            try
                value = obj.interface.DetectorType;
            catch e
                obj.interpretError(e);
            end
        end
		function set.DetectorType(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.DetectorType = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% DetectorTypeAutoEnabled property access methods
        function value = get.DetectorTypeAutoEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.DetectorTypeAutoEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.DetectorTypeAutoEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'DetectorTypeAutoEnabled');
            try
                obj.interface.DetectorTypeAutoEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Average property access methods
        function value = get.Average(obj)
            obj.checkValidObj();
            if isempty(obj.Average)
                try
                    obj.Average = instrument.driver.AgXSAn.DeviceSpecific.SA.OccupiedBandwidth.Average(obj.interface.Average);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Average;
        end

        %% Frequency property access methods
        function value = get.Frequency(obj)
            obj.checkValidObj();
            if isempty(obj.Frequency)
                try
                    obj.Frequency = instrument.driver.AgXSAn.DeviceSpecific.SA.OccupiedBandwidth.Frequency(obj.interface.Frequency);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Frequency;
        end

        %% Display property access methods
        function value = get.Display(obj)
            obj.checkValidObj();
            if isempty(obj.Display)
                try
                    obj.Display = instrument.driver.AgXSAn.DeviceSpecific.SA.OccupiedBandwidth.Display(obj.interface.Display);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Display;
        end

        %% PercentPower property access methods
        function value = get.PercentPower(obj)
            obj.checkValidObj();
            try
                value = obj.interface.PercentPower;
            catch e
                obj.interpretError(e);
            end
        end
		function set.PercentPower(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'PercentPower');
            try
                obj.interface.PercentPower = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Marker property access methods
        function value = get.Marker(obj)
            obj.checkValidObj();
            if isempty(obj.Marker)
                try
                    obj.Marker = instrument.driver.AgXSAn.DeviceSpecific.SA.OccupiedBandwidth.Marker(obj.interface.Marker);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Marker;
        end

        %% LimitTestFrequency property access methods
        function value = get.LimitTestFrequency(obj)
            obj.checkValidObj();
            try
                value = obj.interface.LimitTestFrequency;
            catch e
                obj.interpretError(e);
            end
        end
		function set.LimitTestFrequency(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'LimitTestFrequency');
            try
                obj.interface.LimitTestFrequency = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% LimitTestEnabled property access methods
        function value = get.LimitTestEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.LimitTestEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.LimitTestEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'LimitTestEnabled');
            try
                obj.interface.LimitTestEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% TriggerSource property access methods
        function value = get.TriggerSource(obj)
            obj.checkValidObj();
            try
                value = obj.interface.TriggerSource;
            catch e
                obj.interpretError(e);
            end
        end
		function set.TriggerSource(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.TriggerSource = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% SweepCoupling property access methods
        function value = get.SweepCoupling(obj)
            obj.checkValidObj();
            if isempty(obj.SweepCoupling)
                try
                    obj.SweepCoupling = instrument.driver.AgXSAn.DeviceSpecific.SA.OccupiedBandwidth.SweepCoupling(obj.interface.SweepCoupling);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.SweepCoupling;
        end

        %% IFGain property access methods
        function value = get.IFGain(obj)
            obj.checkValidObj();
            try
                value = obj.interface.IFGain;
            catch e
                obj.interpretError(e);
            end
        end
		function set.IFGain(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'IFGain');
            try
                obj.interface.IFGain = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% IFGainAutoEnabled property access methods
        function value = get.IFGainAutoEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.IFGainAutoEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.IFGainAutoEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'IFGainAutoEnabled');
            try
                obj.interface.IFGainAutoEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

    %% Public Methods
    methods

        function Configure(obj)
            %CONFIGURE Restores all the measurement parameters of Occupied Bandwidth measurement to their default values.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.Configure();
            catch e
                obj.interpretError(e);
            end
        end

        function ConfigureNoPreset(obj)
            %CONFIGURENOPRESET Selects occupied bandwidth measurement as current measurement but does not restore its parameters to their default values.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.ConfigureNoPreset();
            catch e
                obj.interpretError(e);
            end
        end

    end

end
