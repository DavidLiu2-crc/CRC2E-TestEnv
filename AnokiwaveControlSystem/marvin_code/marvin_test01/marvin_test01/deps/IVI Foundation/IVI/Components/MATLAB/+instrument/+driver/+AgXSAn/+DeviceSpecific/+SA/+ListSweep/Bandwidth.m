classdef Bandwidth < instrument.ivicom.Interface
    %BANDWIDTH IAgXSAnSAListSweepBandwidth interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Bandwidth(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Read Only Properties
    properties (SetAccess = private)

        %RESOLUTIONPOINTS Number of Points Values in Resolution Bandwidth Read Only.
        ResolutionPoints

        %RESOLUTIONTYPEPOINTS Resolution bandwidth number of bandwidth type. Read Only.
        ResolutionTypePoints

        %VIDEOPOINTS Values of Points in Video Bandwidth. Read Only.
        VideoPoints

    end

    %% Property access methods
    methods

        %% ResolutionPoints property access methods
        function value = get.ResolutionPoints(obj)
            obj.checkValidObj();
            try
                value = obj.interface.ResolutionPoints;
            catch e
                obj.interpretError(e);
            end
        end

        %% ResolutionTypePoints property access methods
        function value = get.ResolutionTypePoints(obj)
            obj.checkValidObj();
            try
                value = obj.interface.ResolutionTypePoints;
            catch e
                obj.interpretError(e);
            end
        end

        %% VideoPoints property access methods
        function value = get.VideoPoints(obj)
            obj.checkValidObj();
            try
                value = obj.interface.VideoPoints;
            catch e
                obj.interpretError(e);
            end
        end

    end

    %% Public Methods
    methods

        function ConfigureResolution(obj,Bandwidth)
            %CONFIGURERESOLUTION Defines a list of analyzer RBW settings at which the measurements are made.
            
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

        function ConfigureVideo(obj,Bandwidth)
            %CONFIGUREVIDEO Defines a list of analyzer VBW settings at which the measurements are made.
            
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

        function val = QueryResolution(obj)
            %QUERYRESOLUTION Queries a list of analyzer RBW settings at which the measurements are made.
            
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

        function val = QueryVideo(obj)
            %QUERYVIDEO Queries a list of analyzer VBW settings at which the measurements are made.
            
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

        function ConfigureResolutionShape(obj,Shape)
            %CONFIGURERESOLUTIONSHAPE Defines a list of analyzer RBW Type settings used for the measurements.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                obj.interface.ConfigureResolutionShape(int32(Shape));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = QueryResolutionShape(obj)
            %QUERYRESOLUTIONSHAPE Queries a list of analyzer RBW Type settings used for the measurements.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.QueryResolutionShape();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

    end

end
