classdef Frame < instrument.ivicom.Interface
    %FRAME IAgXSAnTrigger3Frame interface.
    
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

        %PERIOD The period of the internal periodic timer clock. For digital communications signals, this is usually set to the frame period of your current input signal.
        Period

        %OFFSET Adjusts the accumulated offset between the periodic timer events and the trigger event.
        Offset

        %SYNCSOURCE Selects a signal source to synchronize periodic timer trigger, otherwise triggering will be at some arbitrary location in the frame.
        SyncSource

        %DELAY Delays the measurement timing relative to the Periodic Timer.
        Delay

        %DELAYENABLED Enable or disable the trigger delay state of analyzer.
        DelayEnabled

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

        %% Offset property access methods
        function value = get.Offset(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Offset;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Offset(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'Offset');
            try
                obj.interface.Offset = newValue;
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

        %% Delay property access methods
        function value = get.Delay(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Delay;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Delay(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'Delay');
            try
                obj.interface.Delay = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% DelayEnabled property access methods
        function value = get.DelayEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.DelayEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.DelayEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'DelayEnabled');
            try
                obj.interface.DelayEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

    %% Public Methods
    methods

        function Reset(obj)
            %RESET Resets the value of the periodic trigger offset display setting to 0.0 seconds.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.Reset();
            catch e
                obj.interpretError(e);
            end
        end

    end

end
