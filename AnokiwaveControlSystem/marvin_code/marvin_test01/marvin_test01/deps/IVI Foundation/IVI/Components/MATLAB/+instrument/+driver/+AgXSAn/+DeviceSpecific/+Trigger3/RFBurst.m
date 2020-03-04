classdef RFBurst < instrument.ivicom.Interface
    %RFBURST IAgXSAnTrigger3RFBurst interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = RFBurst(interface)
            
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

        %LEVELRELATIVE The relative trigger level for the RF burst envelope.
        LevelRelative

        %SLOPE Controls the trigger polarity.
        Slope

        %DELAY Controls a time delay during which the analyzer will wait to begin a sweep after meeting the trigger criteria.
        Delay

        %DELAYENABLED Enable or disable the trigger delay state.
        DelayEnabled

        %ZEROSPANDELAYCOMPENSATIONENABLED Enable or disable zero span delay compensation.
        ZeroSpanDelayCompensationEnabled

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

        %% LevelRelative property access methods
        function value = get.LevelRelative(obj)
            obj.checkValidObj();
            try
                value = obj.interface.LevelRelative;
            catch e
                obj.interpretError(e);
            end
        end
		function set.LevelRelative(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'LevelRelative');
            try
                obj.interface.LevelRelative = newValue;
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

        %% ZeroSpanDelayCompensationEnabled property access methods
        function value = get.ZeroSpanDelayCompensationEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.ZeroSpanDelayCompensationEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.ZeroSpanDelayCompensationEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'ZeroSpanDelayCompensationEnabled');
            try
                obj.interface.ZeroSpanDelayCompensationEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

end
