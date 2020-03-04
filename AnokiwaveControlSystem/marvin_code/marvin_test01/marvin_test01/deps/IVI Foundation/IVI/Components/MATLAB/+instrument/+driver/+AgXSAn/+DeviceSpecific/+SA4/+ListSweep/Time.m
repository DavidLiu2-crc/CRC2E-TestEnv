classdef Time < instrument.ivicom.Interface
    %TIME IAgXSAnSAListSweepTime interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Time(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Read Only Properties
    properties (SetAccess = private)

        %POINTS This command defines a list of analyzer sweep times at which the measurements are made. In zero span measurements, this is the time required to measure a single point given the current setting for the number of points in the sweep.The time duration of the measurement specified by this command is not the time required to iterate from one point to another; rather, it is the equivalent of the ?bucket width? for a normal swept measurement. In the Average detector, it is the integration time; in the peak detector, it is the time during which the highest peak is captured. The time required to complete a point will be the sum of the SWEep time and the settling time. Read Only.
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

        function Configure(obj,Time)
            %CONFIGURE Defines a list of analyzer sweep times at which the measurements are made.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            Time = obj.checkVectorDoubleArg(Time,'Time');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                obj.interface.Configure(double(Time));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = Query(obj)
            %QUERY Queries a list of analyzer sweep times at which the measurements are made.
            
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
