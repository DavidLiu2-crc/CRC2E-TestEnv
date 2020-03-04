classdef IF < instrument.ivicom.Interface
    %IF IAgXSAnBasicInputIF interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = IF(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %PATH Enables you to select different IF Paths for the AIF/DIF boards.The selections are 10 MHz, 25 MHz, 40 MHz, and 140 MHz paths
        Path

        %PATHAUTOENABLED Automatically selects between the IF Paths based on the current measurements Digital IF Bandwidth setting.
        PathAutoEnabled

    end

    %% Property access methods
    methods

        %% Path property access methods
        function value = get.Path(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Path;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Path(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.Path = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% PathAutoEnabled property access methods
        function value = get.PathAutoEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.PathAutoEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.PathAutoEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'PathAutoEnabled');
            try
                obj.interface.PathAutoEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

end
