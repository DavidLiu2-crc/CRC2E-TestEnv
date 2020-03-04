classdef BurstPower < instrument.ivicom.Interface
    %BURSTPOWER IAgXSAnSABurstPower interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = BurstPower(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);

            %% Initialize properties
            try
                obj.Traces = instrument.driver.AgXSAn.DeviceSpecific.SA4.BurstPower.Traces(obj.interface.Traces);
            catch %#ok<CTCH>
            end

            try
                obj.Average = instrument.driver.AgXSAn.DeviceSpecific.SA4.BurstPower.Average(obj.interface.Average);
            catch %#ok<CTCH>
            end

            try
                obj.Display = instrument.driver.AgXSAn.DeviceSpecific.SA4.BurstPower.Display(obj.interface.Display);
            catch %#ok<CTCH>
            end

            try
                obj.Marker = instrument.driver.AgXSAn.DeviceSpecific.SA4.BurstPower.Marker(obj.interface.Marker);
            catch %#ok<CTCH>
            end

            try
                obj.SweepCoupling = instrument.driver.AgXSAn.DeviceSpecific.SA4.BurstPower.SweepCoupling(obj.interface.SweepCoupling);
            catch %#ok<CTCH>
            end

        end
        
        function delete(obj)
            obj.Traces = [];
            obj.Average = [];
            obj.Display = [];
            obj.Marker = [];
            obj.SweepCoupling = [];
        end

    end
    
    %% Public Properties
    properties

        %BURSTWIDTH The burst width in seconds.
        BurstWidth

        %BURSTWIDTHAUTOENABLED Sets the burst width parameter to automatic mode.
        BurstWidthAutoEnabled

        %MEASUREMENTMETHOD Sets/Gets the desired method to measure BurstPower.
        MeasurementMethod

        %SWEEPTIME Sets/Gets the length of time in which the spectrum analyzer sweeps the displayed frequency span.
        SweepTime

        %THRESHOLD Sets/Gets the level above which the mean carrier power calculation is based.
        Threshold

        %THRESHOLDTYPE Sets/Gets the type of result averaging to be performed.
        ThresholdType

        %TRIGGERSOURCE Sets/Gets the source of the trigger.
        TriggerSource

    end

    %% Public Read Only Properties
    properties (SetAccess = private)

        %TRACES Pointer to the IAgXSAnSABurstPowerTraces interface. Read Only.
        Traces

        %AVERAGE Pointer to IAgXSAnSABurstPowerAverage interface. Read Only.
        Average

        %DISPLAY Pointer to IAgXSAnSABurstPowerDisplay interface. Read Only.
        Display

        %MARKER Pointer to IAgXSAnSABurstPowerMarker interface. Read Only.
        Marker

        %SWEEPCOUPLING Pointer to IAgXSAnSABurstPowerSweepCoupling interface. Read Only.
        SweepCoupling

    end

    %% Property access methods
    methods

        %% Traces property access methods
        function value = get.Traces(obj)
            obj.checkValidObj();
            if isempty(obj.Traces)
                try
                    obj.Traces = instrument.driver.AgXSAn.DeviceSpecific.SA4.BurstPower.Traces(obj.interface.Traces);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Traces;
        end

        %% BurstWidth property access methods
        function value = get.BurstWidth(obj)
            obj.checkValidObj();
            try
                value = obj.interface.BurstWidth;
            catch e
                obj.interpretError(e);
            end
        end
		function set.BurstWidth(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'BurstWidth');
            try
                obj.interface.BurstWidth = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% BurstWidthAutoEnabled property access methods
        function value = get.BurstWidthAutoEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.BurstWidthAutoEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.BurstWidthAutoEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'BurstWidthAutoEnabled');
            try
                obj.interface.BurstWidthAutoEnabled = newValue;
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

        %% SweepTime property access methods
        function value = get.SweepTime(obj)
            obj.checkValidObj();
            try
                value = obj.interface.SweepTime;
            catch e
                obj.interpretError(e);
            end
        end
		function set.SweepTime(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'SweepTime');
            try
                obj.interface.SweepTime = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Threshold property access methods
        function value = get.Threshold(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Threshold;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Threshold(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'Threshold');
            try
                obj.interface.Threshold = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% ThresholdType property access methods
        function value = get.ThresholdType(obj)
            obj.checkValidObj();
            try
                value = obj.interface.ThresholdType;
            catch e
                obj.interpretError(e);
            end
        end
		function set.ThresholdType(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.ThresholdType = newValue;
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

        %% Average property access methods
        function value = get.Average(obj)
            obj.checkValidObj();
            if isempty(obj.Average)
                try
                    obj.Average = instrument.driver.AgXSAn.DeviceSpecific.SA4.BurstPower.Average(obj.interface.Average);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Average;
        end

        %% Display property access methods
        function value = get.Display(obj)
            obj.checkValidObj();
            if isempty(obj.Display)
                try
                    obj.Display = instrument.driver.AgXSAn.DeviceSpecific.SA4.BurstPower.Display(obj.interface.Display);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Display;
        end

        %% Marker property access methods
        function value = get.Marker(obj)
            obj.checkValidObj();
            if isempty(obj.Marker)
                try
                    obj.Marker = instrument.driver.AgXSAn.DeviceSpecific.SA4.BurstPower.Marker(obj.interface.Marker);
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
                    obj.SweepCoupling = instrument.driver.AgXSAn.DeviceSpecific.SA4.BurstPower.SweepCoupling(obj.interface.SweepCoupling);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.SweepCoupling;
        end

    end

    %% Public Methods
    methods

        function Configure(obj)
            %CONFIGURE Restores all the measurement parameters of BurstPower measurement to their default values.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.Configure();
            catch e
                obj.interpretError(e);
            end
        end

        function ConfigureNoPreset(obj)
            %CONFIGURENOPRESET Selects Burst Power measurement as current measurement but does not restore its parameters to their default values.
            
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
