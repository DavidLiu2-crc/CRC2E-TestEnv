classdef Frequency < instrument.ivicom.Interface
    %FREQUENCY IAgXSAnSAListSweepFrequency interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Frequency(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %SYNTHESIS Defines a list of analyzer phase noise optimization settings at which the measurements aremade.
        Synthesis

        %SYNTHESISAUTOENABLED Enables/Disables the automatic defining of list phase noise optimization settings at which the measurements are made.
        SynthesisAutoEnabled

    end

    %% Public Read Only Properties
    properties (SetAccess = private)

        %POINTS Queries the analyzer for the number of points in the frequency list. Read Only.
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

        %% Synthesis property access methods
        function value = get.Synthesis(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Synthesis;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Synthesis(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.Synthesis = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% SynthesisAutoEnabled property access methods
        function value = get.SynthesisAutoEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.SynthesisAutoEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.SynthesisAutoEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'SynthesisAutoEnabled');
            try
                obj.interface.SynthesisAutoEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

    %% Public Methods
    methods

        function Configure(obj,Frequency)
            %CONFIGURE Defines a list of analyzer center frequencies at which the measurements are made.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            Frequency = obj.checkVectorDoubleArg(Frequency,'Frequency');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                obj.interface.Configure(double(Frequency));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = Query(obj)
            %QUERY Queries a list of analyzer center frequencies at which the measurements are made.
            
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
