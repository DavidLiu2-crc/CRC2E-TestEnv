classdef Digital < instrument.ivicom.Interface
    %DIGITAL IKtXSAnRadioTestRFGeneratorModulationDigital interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Digital(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Methods
    methods

        function ConfigureModulationFormatTestPattern(obj,ModulationType,TestPattern)
            %CONFIGUREMODULATIONFORMATTESTPATTERN Configure modulation format test pattern.
            
            obj.checkValidObj();
			error(nargchk(3,3,nargin,'struct'))
            try
                obj.interface.ConfigureModulationFormatTestPattern(int32(ModulationType),int32(TestPattern));
            catch e
                obj.interpretError(e);
            end
        end

        function [returnModulationType,returnTestPattern] = QueryModulationFormatTestPattern(obj)
            %QUERYMODULATIONFORMATTESTPATTERN Query modulation format test pattern.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                [returnModulationType,returnTestPattern] = obj.interface.QueryModulationFormatTestPattern(int32(0),int32(0));
            catch e
                obj.interpretError(e);
            end
        end

    end

end
