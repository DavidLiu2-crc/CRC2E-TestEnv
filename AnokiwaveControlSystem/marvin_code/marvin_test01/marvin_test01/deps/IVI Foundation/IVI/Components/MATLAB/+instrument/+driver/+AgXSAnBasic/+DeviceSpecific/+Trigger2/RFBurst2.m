classdef RFBurst2 < instrument.ivicom.Interface
    %RFBURST2 IAgXSAnBasicTriggerRFBurst2 interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = RFBurst2(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %LEVELABSOLUTE The absolute trigger level for the RF burst envelope.
        LevelAbsolute

        %LEVELTYPE The Level Type of RFBurst trigger.
        LevelType

        %DELAYENABLED Enable or disable the trigger delay state.
        DelayEnabled

        %DELAY The time delay during which the analyzer will wait to begin a sweep after meeting the trigger criteria.
        Delay

        %PEAKLEVEL The trigger level when using the RF Burst (wideband) Trigger. The value is relative to the peak of the signal. RF Burst is also known as RF Envelope.
        PeakLevel

        %SLOPE Set the trigger slope when using the RF Burst (wideband) Trigger.
        Slope

    end

    %% Property access methods
    methods

        %% LevelAbsolute property access methods
        function value = get.LevelAbsolute(obj)
            obj.checkValidObj();
            try
                value = obj.interface.LevelAbsolute;
            catch e
                obj.interpretError(e);
            end
        end
		function set.LevelAbsolute(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'LevelAbsolute');
            try
                obj.interface.LevelAbsolute = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% LevelType property access methods
        function value = get.LevelType(obj)
            obj.checkValidObj();
            try
                value = obj.interface.LevelType;
            catch e
                obj.interpretError(e);
            end
        end
		function set.LevelType(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.LevelType = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% DelayEnabled property access methods
        function value = get.DelayEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.DelayEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.DelayEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'DelayEnabled');
            try
                obj.interface.DelayEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Delay property access methods
        function value = get.Delay(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Delay;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Delay(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'Delay');
            try
                obj.interface.Delay = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% PeakLevel property access methods
        function value = get.PeakLevel(obj)
            obj.checkValidObj();
            try
                value = obj.interface.PeakLevel;
            catch e
                obj.interpretError(e);
            end
        end
		function set.PeakLevel(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'PeakLevel');
            try
                obj.interface.PeakLevel = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Slope property access methods
        function value = get.Slope(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Slope;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Slope(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.Slope = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

end
