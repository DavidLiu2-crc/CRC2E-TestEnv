classdef Bandwidth < instrument.ivicom.Interface
    %BANDWIDTH IAgXSAnSASEMaskOffsetListBandwidth interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Bandwidth(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Methods
    methods

        function ConfigureMeasurementMultiplier(obj,MultiplierValue)
            %CONFIGUREMEASUREMENTMULTIPLIER Specifies multiplier of Res BW for the measurement integration bandwidth. Measurement multiplier is an  integer number. It shows a ratio between Integration BW and Resolution BW of the measurement result.Integ BW = Meas Multiplier * Resolution BW
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            MultiplierValue = obj.checkVectorInt32Arg(MultiplierValue,'MultiplierValue');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                obj.interface.ConfigureMeasurementMultiplier(int32(MultiplierValue));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = QueryMeasurementMultiplier(obj)
            %QUERYMEASUREMENTMULTIPLIER  Reads the multiplier of Res BW for the measurement integration bandwidth. Measurement multiplier is an  integer number. It shows a ratio between Integration BW and Resolution BW of the measurement result.  Integ BW = Meas Multiplier * Resolution BW
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.QueryMeasurementMultiplier();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function ConfigureResolution(obj,Bandwidth)
            %CONFIGURERESOLUTION Sets the resolution bandwidth for each offset.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            Bandwidth = obj.checkVectorDoubleArg(Bandwidth,'Bandwidth');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                obj.interface.ConfigureResolution(double(Bandwidth));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = QueryResolution(obj)
            %QUERYRESOLUTION Gets the resolution bandwidth for each offset.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.QueryResolution();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function ConfigureResolutionAutoEnabled(obj,State)
            %CONFIGURERESOLUTIONAUTOENABLED Enables/Disables the auto setting of resolution bandwidth for each offset.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            State = obj.checkVectorBoolArg(State,'State');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                obj.interface.ConfigureResolutionAutoEnabled(logical(State));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function ConfigureVideo(obj,Bandwidth)
            %CONFIGUREVIDEO Sets the analyzer post-detection filter (VBW).
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            Bandwidth = obj.checkVectorDoubleArg(Bandwidth,'Bandwidth');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                obj.interface.ConfigureVideo(double(Bandwidth));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function ConfigureVideoAutoEnabled(obj,State)
            %CONFIGUREVIDEOAUTOENABLED Enables/Disables the auto setting of analyzer post-detection filter (VBW).
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            State = obj.checkVectorBoolArg(State,'State');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                obj.interface.ConfigureVideoAutoEnabled(logical(State));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = QueryResolutionAutoEnabled(obj)
            %QUERYRESOLUTIONAUTOENABLED Gets the state of auto setting of resolution bandwidth for each offset.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.QueryResolutionAutoEnabled();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = QueryVideo(obj)
            %QUERYVIDEO Gets the analyzer post-detection filter (VBW) bandwidth for each offset.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.QueryVideo();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = QueryVideoAutoEnabled(obj)
            %QUERYVIDEOAUTOENABLED Gets the state of auto setting of analyzer post-detection filter (VBW).
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.QueryVideoAutoEnabled();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function ConfigureRatio(obj,RatioValue)
            %CONFIGURERATIO Selects the ratio between the video and resolution bandwidths.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            RatioValue = obj.checkVectorDoubleArg(RatioValue,'RatioValue');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                obj.interface.ConfigureRatio(double(RatioValue));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = QueryRatio(obj)
            %QUERYRATIO Queries the ratio between the video and resolution bandwidths.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.QueryRatio();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function ConfigureRatioAutoEnabled(obj,State)
            %CONFIGURERATIOAUTOENABLED Selects the ratio between the video and resolution bandwidths.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            State = obj.checkVectorBoolArg(State,'State');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                obj.interface.ConfigureRatioAutoEnabled(logical(State));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = QueryRatioAutoEnabled(obj)
            %QUERYRATIOAUTOENABLED Query the ratio between the video and resolution bandwidths.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.QueryRatioAutoEnabled();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

    end

end
