classdef IQ < instrument.ivicom.Interface
    %IQ IAgXSAnBasicFrequencyIQ interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = IQ(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %CENTER The I/Q Center Frequency in Hz.
        Center

    end

    %% Property access methods
    methods

        %% Center property access methods
        function value = get.Center(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Center;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Center(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'Center');
            try
                obj.interface.Center = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

end
