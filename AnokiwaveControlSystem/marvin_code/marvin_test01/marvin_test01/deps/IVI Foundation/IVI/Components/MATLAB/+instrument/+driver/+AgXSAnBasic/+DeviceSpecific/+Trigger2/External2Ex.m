classdef External2Ex < instrument.ivicom.Interface
    %EXTERNAL2EX IAgXSAnBasicTrigger2External2Ex interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = External2Ex(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %DELAYENABLED Enable or disable the trigger delay state of analyzer.
        DelayEnabled

        %ZEROSPANDELAYCOMPENSATIONENABLED Enable or disable the zero span delay compensation.
        ZeroSpanDelayCompensationEnabled

    end

    %% Property access methods
    methods

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
