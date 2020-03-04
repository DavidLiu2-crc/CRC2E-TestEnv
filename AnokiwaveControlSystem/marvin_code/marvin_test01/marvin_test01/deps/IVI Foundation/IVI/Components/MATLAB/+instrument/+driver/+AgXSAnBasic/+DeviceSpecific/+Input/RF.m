classdef RF < instrument.ivicom.Interface
    %RF AgXSAnBasic InputRF interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = RF(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %ATTENUATION The attenuation applied to the RF input signal path.
        Attenuation

        %ATTENUATIONAUTOENABLED Enables or disables the auto selection of RF input attenuation.
        AttenuationAutoEnabled

        %EXTERNALGAIN The external gain in dB. It affect the displayed signal level.
        ExternalGain

    end

    %% Property access methods
    methods

        %% Attenuation property access methods
        function value = get.Attenuation(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Attenuation;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Attenuation(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'Attenuation');
            try
                obj.interface.Attenuation = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% AttenuationAutoEnabled property access methods
        function value = get.AttenuationAutoEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.AttenuationAutoEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.AttenuationAutoEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'AttenuationAutoEnabled');
            try
                obj.interface.AttenuationAutoEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% ExternalGain property access methods
        function value = get.ExternalGain(obj)
            obj.checkValidObj();
            try
                value = obj.interface.ExternalGain;
            catch e
                obj.interpretError(e);
            end
        end
		function set.ExternalGain(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'ExternalGain');
            try
                obj.interface.ExternalGain = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

end
