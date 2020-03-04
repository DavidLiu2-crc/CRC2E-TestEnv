classdef ExternalEx < instrument.ivicom.Interface
    %EXTERNALEX IAgXSAnTriggerExternalEx interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = ExternalEx(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %ZEROSPANDELAYCOMPENSATIONENABLED Enable or disable the zero span delay compensation.
        ZeroSpanDelayCompensationEnabled

        %LEVEL Specifies the external level for triggering in volts.
        Level

        %SLOPE Specifies the external trigger slope.
        Slope

        %DELAY Controls a time delay during which the analyzer will wait to begin a sweep after meeting the trigger criteria.
        Delay

    end

    %% Property access methods
    methods

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

    end

    %% Public Methods
    methods

        function Configure(obj,ExternalTriggerLevel,ExternalTriggerSlope)
            %CONFIGURE This function specifies the external level and slope for triggering.
            
            obj.checkValidObj();
			error(nargchk(3,3,nargin,'struct'))
            ExternalTriggerLevel = obj.checkScalarDoubleArg(ExternalTriggerLevel,'ExternalTriggerLevel');
            try
                obj.interface.Configure(double(ExternalTriggerLevel),int32(ExternalTriggerSlope));
            catch e
                obj.interpretError(e);
            end
        end

    end

end
