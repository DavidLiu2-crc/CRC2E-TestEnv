classdef OccupiedBandwidth2 < instrument.ivicom.Interface
    %OCCUPIEDBANDWIDTH2 IAgXSAnSAOccupiedBandwidth2 interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = OccupiedBandwidth2(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);

            %% Initialize properties
            try
                obj.Traces2 = instrument.driver.AgXSAn.DeviceSpecific.SA4.OccupiedBandwidth2.Traces2(obj.interface.Traces2);
            catch %#ok<CTCH>
            end

            try
                obj.Display2 = instrument.driver.AgXSAn.DeviceSpecific.SA4.OccupiedBandwidth2.Display2(obj.interface.Display2);
            catch %#ok<CTCH>
            end

            try
                obj.Traces = instrument.driver.AgXSAn.DeviceSpecific.SA4.OccupiedBandwidth2.Traces(obj.interface.Traces);
            catch %#ok<CTCH>
            end

            try
                obj.Average = instrument.driver.AgXSAn.DeviceSpecific.SA4.OccupiedBandwidth2.Average(obj.interface.Average);
            catch %#ok<CTCH>
            end

            try
                obj.Frequency = instrument.driver.AgXSAn.DeviceSpecific.SA4.OccupiedBandwidth2.Frequency(obj.interface.Frequency);
            catch %#ok<CTCH>
            end

            try
                obj.Display = instrument.driver.AgXSAn.DeviceSpecific.SA4.OccupiedBandwidth2.Display(obj.interface.Display);
            catch %#ok<CTCH>
            end

            try
                obj.Marker = instrument.driver.AgXSAn.DeviceSpecific.SA4.OccupiedBandwidth2.Marker(obj.interface.Marker);
            catch %#ok<CTCH>
            end

            try
                obj.SweepCoupling = instrument.driver.AgXSAn.DeviceSpecific.SA4.OccupiedBandwidth2.SweepCoupling(obj.interface.SweepCoupling);
            catch %#ok<CTCH>
            end

        end
        
        function delete(obj)
            obj.Traces2 = [];
            obj.Display2 = [];
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

        %POWERREFERENCETYPE The Power Reference Type.
        PowerReferenceType

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

        %TRACES2 Pointer to the IAgXSAnSAOccupiedBandwidthTraces interface. Read Only.
        Traces2

        %DISPLAY2 Pointer to IAgXSAnSAOccupiedBandwidthDisplay interface. Read Only.
        Display2

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

        %% PowerReferenceType property access methods
        function value = get.PowerReferenceType(obj)
            obj.checkValidObj();
            try
                value = obj.interface.PowerReferenceType;
            catch e
                obj.interpretError(e);
            end
        end
		function set.PowerReferenceType(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.PowerReferenceType = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Traces2 property access methods
        function value = get.Traces2(obj)
            obj.checkValidObj();
            if isempty(obj.Traces2)
                try
                    obj.Traces2 = instrument.driver.AgXSAn.DeviceSpecific.SA4.OccupiedBandwidth2.Traces2(obj.interface.Traces2);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Traces2;
        end

        %% Display2 property access methods
        function value = get.Display2(obj)
            obj.checkValidObj();
            if isempty(obj.Display2)
                try
                    obj.Display2 = instrument.driver.AgXSAn.DeviceSpecific.SA4.OccupiedBandwidth2.Display2(obj.interface.Display2);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Display2;
        end

        %% Traces property access methods
        function value = get.Traces(obj)
            obj.checkValidObj();
            if isempty(obj.Traces)
                try
                    obj.Traces = instrument.driver.AgXSAn.DeviceSpecific.SA4.OccupiedBandwidth2.Traces(obj.interface.Traces);
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
                    obj.Average = instrument.driver.AgXSAn.DeviceSpecific.SA4.OccupiedBandwidth2.Average(obj.interface.Average);
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
                    obj.Frequency = instrument.driver.AgXSAn.DeviceSpecific.SA4.OccupiedBandwidth2.Frequency(obj.interface.Frequency);
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
                    obj.Display = instrument.driver.AgXSAn.DeviceSpecific.SA4.OccupiedBandwidth2.Display(obj.interface.Display);
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
                    obj.Marker = instrument.driver.AgXSAn.DeviceSpecific.SA4.OccupiedBandwidth2.Marker(obj.interface.Marker);
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
                    obj.SweepCoupling = instrument.driver.AgXSAn.DeviceSpecific.SA4.OccupiedBandwidth2.SweepCoupling(obj.interface.SweepCoupling);
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
