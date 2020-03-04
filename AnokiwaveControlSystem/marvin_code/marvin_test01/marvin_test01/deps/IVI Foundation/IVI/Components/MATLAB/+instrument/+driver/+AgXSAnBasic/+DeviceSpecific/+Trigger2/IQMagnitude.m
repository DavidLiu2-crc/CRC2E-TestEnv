classdef IQMagnitude < instrument.ivicom.Interface
    %IQMAGNITUDE IAgXSAnBasicTrigger2IQMagnitude interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = IQMagnitude(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %DELAY Controls a time delay during which the analyzer will wait to begin a sweep after meeting the trigger criteria.
        Delay

        %DELAYENABLED Enable or disable the time delay.
        DelayEnabled

        %LEVEL Level for the I/Q magnitude trigger.
        Level

        %SLOPE Controls trigger polarity.
        Slope

    end

    %% Property access methods
    methods

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

        %% Level property access methods
        function value = get.Level(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Level;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Level(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'Level');
            try
                obj.interface.Level = newValue;
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
