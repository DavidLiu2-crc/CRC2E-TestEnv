classdef Sequence < instrument.ivicom.Interface
    %SEQUENCE IAgXSAnSAListSweepSequence interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Sequence(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %AUTOENABLED Enables/Disables automatic definiing of the sequence for stepping through the list.
        AutoEnabled

    end

    %% Public Read Only Properties
    properties (SetAccess = private)

        %POINTS Returns the number of points currently in the sequence list. Read Only.
        Points

    end

    %% Property access methods
    methods

        %% AutoEnabled property access methods
        function value = get.AutoEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.AutoEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.AutoEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'AutoEnabled');
            try
                obj.interface.AutoEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

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

        function Configure(obj,Sequence)
            %CONFIGURE Defines a sequence for stepping through the list.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            Sequence = obj.checkVectorDoubleArg(Sequence,'Sequence');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                obj.interface.Configure(double(Sequence));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = Query(obj)
            %QUERY Queries a sequence for stepping through the list
            
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
