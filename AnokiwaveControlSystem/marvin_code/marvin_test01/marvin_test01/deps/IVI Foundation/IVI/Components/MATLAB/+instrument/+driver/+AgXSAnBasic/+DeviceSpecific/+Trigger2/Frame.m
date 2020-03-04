classdef Frame < instrument.ivicom.Interface
    %FRAME AgXSAnBasic TriggerFrame interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Frame(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %PERIOD The period in second of the internal periodic timer clock.
        Period

        %SYNCSOURCE Selects a signal source for you to synchronize your periodic timer trigger to, otherwise you are triggering at some arbitrary location in the frame.
        SyncSource

    end

    %% Property access methods
    methods

        %% Period property access methods
        function value = get.Period(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Period;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Period(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'Period');
            try
                obj.interface.Period = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% SyncSource property access methods
        function value = get.SyncSource(obj)
            obj.checkValidObj();
            try
                value = obj.interface.SyncSource;
            catch e
                obj.interpretError(e);
            end
        end
		function set.SyncSource(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.SyncSource = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

    %% Public Methods
    methods

        function Adjust(obj,Time)
            %ADJUST Lets you advance the phase of the frame trigger by the specified amount.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            Time = obj.checkScalarDoubleArg(Time,'Time');
            try
                obj.interface.Adjust(double(Time));
            catch e
                obj.interpretError(e);
            end
        end

    end

end
