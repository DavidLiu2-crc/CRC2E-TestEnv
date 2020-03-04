classdef ADC < instrument.ivicom.Interface
    %ADC IAgXSAnAcquistionADC interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = ADC(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %DITHERAUTOENABLED Enable or disable the auto selection of ADC dither.
        DitherAutoEnabled

        %DITHERENABLED Enables or disables the ADC dither function.
        DitherEnabled

    end

    %% Property access methods
    methods

        %% DitherAutoEnabled property access methods
        function value = get.DitherAutoEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.DitherAutoEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.DitherAutoEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'DitherAutoEnabled');
            try
                obj.interface.DitherAutoEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% DitherEnabled property access methods
        function value = get.DitherEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.DitherEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.DitherEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'DitherEnabled');
            try
                obj.interface.DitherEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

end
