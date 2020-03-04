classdef Stop < instrument.ivicom.Interface
    %STOP IAgXSAnSASEMaskOffsetListStop interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Stop(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Methods
    methods

        function ConfigureAbsoluteAmplitudeLimit(obj,Limit)
            %CONFIGUREABSOLUTEAMPLITUDELIMIT Sets the absolute power level limit at the stop frequency for the selected offset. The absolute power level limit ranges from -200 to +50 dBm.
            
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

        function ConfigureFrequency(obj,Frequency)
            %CONFIGUREFREQUENCY Specifies the stop frequency for the currently selected offset.
            
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

        function ConfigureRelativeAmplitudeLimit(obj,Limit)
            %CONFIGURERELATIVEAMPLITUDELIMIT Sets a relative power level limit at the stop frequency for the selected offset. The relative power level limit ranges from ?200 to +50 dBc.
            
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
            %QUERYABSOLUTEAMPLITUDELIMIT Gets the absolute power level limit at the stop frequency for the selected offset.
            
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

        function val = QueryFrequency(obj)
            %QUERYFREQUENCY Queries the stop frequency for the currently selected offset
            
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

        function val = QueryRelativeAmplitudeLimit(obj)
            %QUERYRELATIVEAMPLITUDELIMIT Gets a relative power level limit at the stop frequency for the selected offset. 
            
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

        function ConfigureRelativeAmplitudeLimitAutoEnabled(obj,State)
            %CONFIGURERELATIVEAMPLITUDELIMITAUTOENABLED If set to ture, the Rel Stop power level limit is coupled to Rel Start to result in a flat limit line
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            State = obj.checkVectorBoolArg(State,'State');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                obj.interface.ConfigureRelativeAmplitudeLimitAutoEnabled(logical(State));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = QueryRelativeAmplitudeLimitAutoEnabled(obj)
            %QUERYRELATIVEAMPLITUDELIMITAUTOENABLED Queries the state (on or off) of the coupling of the Rel Stop power level limit to Rel Start power level limit.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.QueryRelativeAmplitudeLimitAutoEnabled();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function ConfigureAbsoluteAmplitudeLimitCoupleEnabled(obj,State)
            %CONFIGUREABSOLUTEAMPLITUDELIMITCOUPLEENABLED If set to ture, the Abs Stop power level limit is coupled to Abs Start to result in a flat limit line
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            State = obj.checkVectorBoolArg(State,'State');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                obj.interface.ConfigureAbsoluteAmplitudeLimitCoupleEnabled(logical(State));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = QueryAbsoluteAmplitudeLimitCoupleEnabled(obj)
            %QUERYABSOLUTEAMPLITUDELIMITCOUPLEENABLED Queries the state (on or off) of the coupling of the Abs Stop power level limit to Abs Start power level limit
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.QueryAbsoluteAmplitudeLimitCoupleEnabled();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

    end

end
