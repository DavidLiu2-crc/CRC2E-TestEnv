classdef Global < instrument.ivicom.Interface
    %GLOBAL IAgXSAnFrequency2Global interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Global(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %CENTERENABLED Enable or disable the global center frequency.
        CenterEnabled

        %EXTENDLOWBANDENABLED Enable or disable the extend low band.
        ExtendLowBandEnabled

    end

    %% Property access methods
    methods

        %% CenterEnabled property access methods
        function value = get.CenterEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.CenterEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.CenterEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'CenterEnabled');
            try
                obj.interface.CenterEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% ExtendLowBandEnabled property access methods
        function value = get.ExtendLowBandEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.ExtendLowBandEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.ExtendLowBandEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'ExtendLowBandEnabled');
            try
                obj.interface.ExtendLowBandEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

end
