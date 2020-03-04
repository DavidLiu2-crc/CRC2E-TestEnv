classdef ACP < instrument.ivicom.Interface
    %ACP IAgXSAn SAACP interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = ACP(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);

            %% Initialize properties
            try
                obj.Traces = instrument.driver.AgXSAn.DeviceSpecific.SA3.ACP.Traces(obj.interface.Traces);
            catch %#ok<CTCH>
            end

            try
                obj.Average = instrument.driver.AgXSAn.DeviceSpecific.SA3.ACP.Average(obj.interface.Average);
            catch %#ok<CTCH>
            end

            try
                obj.Carrier = instrument.driver.AgXSAn.DeviceSpecific.SA3.ACP.Carrier(obj.interface.Carrier);
            catch %#ok<CTCH>
            end

            try
                obj.Display = instrument.driver.AgXSAn.DeviceSpecific.SA3.ACP.Display(obj.interface.Display);
            catch %#ok<CTCH>
            end

            try
                obj.Frequency = instrument.driver.AgXSAn.DeviceSpecific.SA3.ACP.Frequency(obj.interface.Frequency);
            catch %#ok<CTCH>
            end

            try
                obj.Marker = instrument.driver.AgXSAn.DeviceSpecific.SA3.ACP.Marker(obj.interface.Marker);
            catch %#ok<CTCH>
            end

            try
                obj.SweepCoupling = instrument.driver.AgXSAn.DeviceSpecific.SA3.ACP.SweepCoupling(obj.interface.SweepCoupling);
            catch %#ok<CTCH>
            end

            try
                obj.Offset = instrument.driver.AgXSAn.DeviceSpecific.SA3.ACP.Offset(obj.interface.Offset);
            catch %#ok<CTCH>
            end

        end
        
        function delete(obj)
            obj.Traces = [];
            obj.Average = [];
            obj.Carrier = [];
            obj.Display = [];
            obj.Frequency = [];
            obj.Marker = [];
            obj.SweepCoupling = [];
            obj.Offset = [];
        end

    end
    
    %% Public Properties
    properties

        %LIMITTESTENABLED Enables or disables the limit checking for each offset.
        LimitTestEnabled

        %NOISECORRECTIONENABLED Enables or disables the measurement noise floor correction function.
        NoiseCorrectionEnabled

        %DETECTORTYPE The detector to be used by the analyzer for the ACP measurement.
        DetectorType

        %DETECTORTYPEAUTOENABLED Enable or disable the auto selection of the detector for the currently selected trace.
        DetectorTypeAutoEnabled

        %MEASUREMENTMETHOD The desired method to measure ACP.
        MeasurementMethod

        %MEASUREMENTTYPE The reference used for the measurement. This allows the user to make absolute and relative power measurements of either total power or the power normalized to the measurement bandwidth.
        MeasurementType

        %TRIGGERSOURCE The source of the trigger.
        TriggerSource

    end

    %% Public Read Only Properties
    properties (SetAccess = private)

        %TRACES Pointer to the IAgXSAnSAACPTraces interface. Read Only.
        Traces

        %AVERAGE Pointer to IAgXSAnSAACPAverage interface. Read Only.
        Average

        %CARRIER Pointer to IAgXSAnSAACPCarrier interface. Read Only.
        Carrier

        %DISPLAY Pointer to IAgXSAnSAACPDisplay interface. Read Only.
        Display

        %FREQUENCY Pointer to IAgXSAnSAACPFrequency interface. Read Only.
        Frequency

        %LIMITTESTFAILSTATE Returns the status of the current measurement limit testing. It returns a false if the measured results pass when compared with the current limits. It returns a true if the measured results fail any limit tests. Read Only.
        LimitTestFailState

        %MARKER Pointer to IAgXSAnSAACPMarker interface. Read Only.
        Marker

        %SWEEPCOUPLING Pointer to IAgXSAnSAACPSweepCoupling interface. Read Only.
        SweepCoupling

        %OFFSET Pointer to IAgXSAnSAACPOffset interface. Read Only.
        Offset

    end

    %% Property access methods
    methods

        %% Traces property access methods
        function value = get.Traces(obj)
            obj.checkValidObj();
            if isempty(obj.Traces)
                try
                    obj.Traces = instrument.driver.AgXSAn.DeviceSpecific.SA3.ACP.Traces(obj.interface.Traces);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Traces;
        end

        %% Average property access methods
        function value = get.Average(obj)
            obj.checkValidObj();
            if isempty(obj.Average)
                try
                    obj.Average = instrument.driver.AgXSAn.DeviceSpecific.SA3.ACP.Average(obj.interface.Average);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Average;
        end

        %% Carrier property access methods
        function value = get.Carrier(obj)
            obj.checkValidObj();
            if isempty(obj.Carrier)
                try
                    obj.Carrier = instrument.driver.AgXSAn.DeviceSpecific.SA3.ACP.Carrier(obj.interface.Carrier);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Carrier;
        end

        %% Display property access methods
        function value = get.Display(obj)
            obj.checkValidObj();
            if isempty(obj.Display)
                try
                    obj.Display = instrument.driver.AgXSAn.DeviceSpecific.SA3.ACP.Display(obj.interface.Display);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Display;
        end

        %% Frequency property access methods
        function value = get.Frequency(obj)
            obj.checkValidObj();
            if isempty(obj.Frequency)
                try
                    obj.Frequency = instrument.driver.AgXSAn.DeviceSpecific.SA3.ACP.Frequency(obj.interface.Frequency);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Frequency;
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

        %% LimitTestFailState property access methods
        function value = get.LimitTestFailState(obj)
            obj.checkValidObj();
            try
                value = obj.interface.LimitTestFailState;
            catch e
                obj.interpretError(e);
            end
        end

        %% NoiseCorrectionEnabled property access methods
        function value = get.NoiseCorrectionEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.NoiseCorrectionEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.NoiseCorrectionEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'NoiseCorrectionEnabled');
            try
                obj.interface.NoiseCorrectionEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
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

        %% MeasurementMethod property access methods
        function value = get.MeasurementMethod(obj)
            obj.checkValidObj();
            try
                value = obj.interface.MeasurementMethod;
            catch e
                obj.interpretError(e);
            end
        end
		function set.MeasurementMethod(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.MeasurementMethod = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% MeasurementType property access methods
        function value = get.MeasurementType(obj)
            obj.checkValidObj();
            try
                value = obj.interface.MeasurementType;
            catch e
                obj.interpretError(e);
            end
        end
		function set.MeasurementType(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.MeasurementType = newValue;
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

        %% Marker property access methods
        function value = get.Marker(obj)
            obj.checkValidObj();
            if isempty(obj.Marker)
                try
                    obj.Marker = instrument.driver.AgXSAn.DeviceSpecific.SA3.ACP.Marker(obj.interface.Marker);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Marker;
        end

        %% SweepCoupling property access methods
        function value = get.SweepCoupling(obj)
            obj.checkValidObj();
            if isempty(obj.SweepCoupling)
                try
                    obj.SweepCoupling = instrument.driver.AgXSAn.DeviceSpecific.SA3.ACP.SweepCoupling(obj.interface.SweepCoupling);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.SweepCoupling;
        end

        %% Offset property access methods
        function value = get.Offset(obj)
            obj.checkValidObj();
            if isempty(obj.Offset)
                try
                    obj.Offset = instrument.driver.AgXSAn.DeviceSpecific.SA3.ACP.Offset(obj.interface.Offset);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Offset;
        end

    end

    %% Public Methods
    methods

        function Configure(obj)
            %CONFIGURE Restores all the measurement parameters of ACP measurement to their default values.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.Configure();
            catch e
                obj.interpretError(e);
            end
        end

        function ConfigureNoPreset(obj)
            %CONFIGURENOPRESET Selects ACP measurement as current measurement but does not restore its parameters to their default values.
            
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
