classdef Base < instrument.ivicom.Interface
    %BASE IAgXSAn5SSDigitalModulationBase interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Base(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %FREQUENCYOFFSET Adjust the value by which the baseband frequency is offset relative to the carrier.
        FrequencyOffset

    end

    %% Property access methods
    methods

        %% FrequencyOffset property access methods
        function value = get.FrequencyOffset(obj)
            obj.checkValidObj();
            try
                value = obj.interface.FrequencyOffset;
            catch e
                obj.interpretError(e);
            end
        end
		function set.FrequencyOffset(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'FrequencyOffset');
            try
                obj.interface.FrequencyOffset = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

end
