classdef AIQMagnitude < instrument.ivicom.Interface
    %AIQMAGNITUDE IAgXSAnBasicTrigger2AIQMagnitude interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = AIQMagnitude(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %BANDWIDTH The information bandwidth used by the auxiliary receiver for the Auxiliary Channel I/Q Magnitude trigger.
        Bandwidth

        %CENTREFREQUENCY The center frequency to be used by the auxiliary receiver.
        CentreFrequency

        %DELAY Controls a time delay during that the analyzer will wait to begin a sweep after meeting the trigger criteria.
        Delay

        %LEVEL A level for the I/Q magnitude trigger. When the signal crosses this level, with the chosen slope, the trigger occurs.
        Level

        %SLOPE Controls the trigger polarity.
        Slope

    end

    %% Property access methods
    methods

        %% Bandwidth property access methods
        function value = get.Bandwidth(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Bandwidth;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Bandwidth(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'Bandwidth');
            try
                obj.interface.Bandwidth = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% CentreFrequency property access methods
        function value = get.CentreFrequency(obj)
            obj.checkValidObj();
            try
                value = obj.interface.CentreFrequency;
            catch e
                obj.interpretError(e);
            end
        end
		function set.CentreFrequency(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'CentreFrequency');
            try
                obj.interface.CentreFrequency = newValue;
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
