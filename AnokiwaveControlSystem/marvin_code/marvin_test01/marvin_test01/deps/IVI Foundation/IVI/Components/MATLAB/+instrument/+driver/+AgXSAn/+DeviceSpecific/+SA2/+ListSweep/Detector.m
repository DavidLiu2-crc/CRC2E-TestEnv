classdef Detector < instrument.ivicom.Interface
    %DETECTOR IAgXSAnSAListSweepDetector interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Detector(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Read Only Properties
    properties (SetAccess = private)

        %POINTS Queries the analyzer for the detector list length Read Only.
        Points

    end

    %% Property access methods
    methods

        %% Points property access methods
        function value = get.Points(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Points;
            catch e
                obj.interpretError(e);
            end
        end

    end

    %% Public Methods
    methods

        function Configure(obj,DetectorType)
            %CONFIGURE Defines a list of analyzer detector settings at which the measurements are made.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                obj.interface.Configure(int32(DetectorType));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = Query(obj)
            %QUERY Queries a list of analyzer detector settings at which the measurements are made.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.Query();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

    end

end
