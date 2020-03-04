classdef Catalog < instrument.ivicom.Interface
    %CATALOG IAgXSAn Catalog interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Catalog(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Read Only Properties
    properties (SetAccess = private)

        %CURRENTPERSONALITYNAME Get Current Personality Name Read Only.
        CurrentPersonalityName

        %CURRENTMEASUREMENTNAME Get Current Measurement Name Read Only.
        CurrentMeasurementName

    end

    %% Property access methods
    methods

        %% CurrentPersonalityName property access methods
        function value = get.CurrentPersonalityName(obj)
            obj.checkValidObj();
            try
                value = obj.interface.CurrentPersonalityName;
            catch e
                obj.interpretError(e);
            end
        end

        %% CurrentMeasurementName property access methods
        function value = get.CurrentMeasurementName(obj)
            obj.checkValidObj();
            try
                value = obj.interface.CurrentMeasurementName;
            catch e
                obj.interpretError(e);
            end
        end

    end

    %% Public Methods
    methods

        function val = GetInstrPersonalityNames(obj)
            %GETINSTRPERSONALITYNAMES Get Instrument Personality Names
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.GetInstrPersonalityNames();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

    end

end
