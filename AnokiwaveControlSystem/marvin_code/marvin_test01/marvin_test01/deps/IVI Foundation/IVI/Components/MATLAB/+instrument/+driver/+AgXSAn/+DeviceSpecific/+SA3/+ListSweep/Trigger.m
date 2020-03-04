classdef Trigger < instrument.ivicom.Interface
    %TRIGGER IAgXSAnSAListSweepTrigger interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Trigger(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %SLOPE Controls the trigger polarity.
        Slope

        %SOURCE Sets/Gets the source of the trigger.
        Source

    end

    %% Public Read Only Properties
    properties (SetAccess = private)

        %DELAYPOINTS Number of points in the trigger delay list. Read Only.
        DelayPoints

        %HOLDOFFPOINTS Queries the analyzer for the trigger holdoff list length. Read Only.
        HoldoffPoints

        %LEVELPOINTS Queries the analyzer for the trigger level list length. Read Only.
        LevelPoints

        %SLOPEPOINTS Queries the analyzer for the trigger slope list length. Read Only.
        SlopePoints

        %SOURCEPOINTS Queries the analyzer for the trigger source list length. Read Only.
        SourcePoints

    end

    %% Property access methods
    methods

        %% DelayPoints property access methods
        function value = get.DelayPoints(obj)
            obj.checkValidObj();
            try
                value = obj.interface.DelayPoints;
            catch e
                obj.interpretError(e);
            end
        end

        %% HoldoffPoints property access methods
        function value = get.HoldoffPoints(obj)
            obj.checkValidObj();
            try
                value = obj.interface.HoldoffPoints;
            catch e
                obj.interpretError(e);
            end
        end

        %% LevelPoints property access methods
        function value = get.LevelPoints(obj)
            obj.checkValidObj();
            try
                value = obj.interface.LevelPoints;
            catch e
                obj.interpretError(e);
            end
        end

        %% SlopePoints property access methods
        function value = get.SlopePoints(obj)
            obj.checkValidObj();
            try
                value = obj.interface.SlopePoints;
            catch e
                obj.interpretError(e);
            end
        end

        %% SourcePoints property access methods
        function value = get.SourcePoints(obj)
            obj.checkValidObj();
            try
                value = obj.interface.SourcePoints;
            catch e
                obj.interpretError(e);
            end
        end

        %% Slope property access methods
        function value = get.Slope(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Slope;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Slope(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.Slope = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Source property access methods
        function value = get.Source(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Source;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Source(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.Source = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

    %% Public Methods
    methods

        function ConfigureDelay(obj,Time)
            %CONFIGUREDELAY Defines a list of analyzer trigger delay time used when making list measurements.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            Time = obj.checkVectorDoubleArg(Time,'Time');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                obj.interface.ConfigureDelay(double(Time));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function ConfigureHoldoff(obj,Time)
            %CONFIGUREHOLDOFF Sets the holdoff time between triggers.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            Time = obj.checkVectorDoubleArg(Time,'Time');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                obj.interface.ConfigureHoldoff(double(Time));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function ConfigureLevel(obj,Amplitude)
            %CONFIGURELEVEL Sets the value at which the selected trigger input will trigger a new sweep.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            Amplitude = obj.checkVectorDoubleArg(Amplitude,'Amplitude');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                obj.interface.ConfigureLevel(double(Amplitude));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = QueryDelay(obj)
            %QUERYDELAY Returns a list of analyzer trigger delay time used when making list measurements.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.QueryDelay();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = QueryHoldoff(obj)
            %QUERYHOLDOFF Gets the holdoff time between triggers.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.QueryHoldoff();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = QueryLevel(obj)
            %QUERYLEVEL Gets the value at which the selected trigger input will trigger a new sweep.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.QueryLevel();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

    end

end
