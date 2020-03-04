classdef Video2 < instrument.ivicom.Interface
    %VIDEO2 IAgXSAnTriggerVideo2 interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Video2(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %DELAYENABLED Enable or disable the trigger delay state.
        DelayEnabled

        %LEVEL Specifies  the video level for triggering in the units specified by the Amplitude Units attribute.
        Level

        %SLOPE Specifies the video trigger slope.
        Slope

        %DELAY Specifies the trigger source delay from when the trigger logic is satisfied until the device specific action (for instance a measurement) is triggered.
        Delay

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

        function Configure(obj,VideoTriggerLevel,VideoTriggerSlope)
            %CONFIGURE This function specifies the video level and slope for triggering.
            
            obj.checkValidObj();
			error(nargchk(3,3,nargin,'struct'))
            VideoTriggerLevel = obj.checkScalarDoubleArg(VideoTriggerLevel,'VideoTriggerLevel');
            try
                obj.interface.Configure(double(VideoTriggerLevel),int32(VideoTriggerSlope));
            catch e
                obj.interpretError(e);
            end
        end

    end

end
