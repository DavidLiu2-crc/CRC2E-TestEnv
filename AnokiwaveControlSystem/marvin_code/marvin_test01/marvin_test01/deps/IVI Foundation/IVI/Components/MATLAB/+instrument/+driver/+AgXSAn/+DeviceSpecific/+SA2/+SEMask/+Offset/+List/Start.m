classdef Start < instrument.ivicom.Interface
    %START IAgXSAnSASEMaskOffsetListStart interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Start(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Methods
    methods

        function ConfigureAbsoluteAmplitudeLimit(obj,Limit)
            %CONFIGUREABSOLUTEAMPLITUDELIMIT Sets the absolute power level limit at the start frequency for the selected offset. The absolute power level limit ranges from ?200 to +50 dBm.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            Limit = obj.checkVectorDoubleArg(Limit,'Limit');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                obj.interface.ConfigureAbsoluteAmplitudeLimit(double(Limit));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function ConfigureRelativeAmplitudeLimit(obj,Limit)
            %CONFIGURERELATIVEAMPLITUDELIMIT Sets a relative power level limit at the start frequency for the selected offset. The relative power level limit ranges from ?200 to +50 dBc.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            Limit = obj.checkVectorDoubleArg(Limit,'Limit');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                obj.interface.ConfigureRelativeAmplitudeLimit(double(Limit));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = QueryAbsoluteAmplitudeLimit(obj)
            %QUERYABSOLUTEAMPLITUDELIMIT Gets the absolute power level limit at the start frequency for the selected offset. 
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.QueryAbsoluteAmplitudeLimit();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = QueryRelativeAmplitudeLimit(obj)
            %QUERYRELATIVEAMPLITUDELIMIT Gets a relative power level limit at the start frequency for the selected offset. 
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.QueryRelativeAmplitudeLimit();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function ConfigureFrequency(obj,Frequency)
            %CONFIGUREFREQUENCY Specifies the start frequency for the currently selected offset.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            Frequency = obj.checkVectorDoubleArg(Frequency,'Frequency');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                obj.interface.ConfigureFrequency(double(Frequency));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = QueryFrequency(obj)
            %QUERYFREQUENCY Queries the start frequency for the currently selected offset
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.QueryFrequency();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

    end

end
