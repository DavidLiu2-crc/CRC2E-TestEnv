classdef EventLog < instrument.ivicom.Interface
    %EVENTLOG LxiSync event log interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = EventLog(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %ENABLED Enables or disables the event logging feature.
        Enabled

    end

    %% Public Read Only Properties
    properties (SetAccess = private)

        %ENTRYCOUNT Returns the number of event log entries available. Read Only.
        EntryCount

    end

    %% Property access methods
    methods

        %% EntryCount property access methods
        function value = get.EntryCount(obj)
            obj.checkValidObj();
            try
                value = obj.interface.EntryCount;
            catch e
                obj.interpretError(e);
            end
        end

        %% Enabled property access methods
        function value = get.Enabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Enabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Enabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'Enabled');
            try
                obj.interface.Enabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

    %% Public Methods
    methods

        function val = GetNextEntry(obj)
            %GETNEXTENTRY This function retrieves and clears the oldest event log entry for the IVI session.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                [val] = obj.interface.GetNextEntry();
            catch e
                obj.interpretError(e);
            end
        end

        function Clear(obj)
            %CLEAR This function removes all existing entries from the event log.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.Clear();
            catch e
                obj.interpretError(e);
            end
        end

    end

end
