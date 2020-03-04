classdef Item < instrument.ivicom.Interface
    %ITEM AgXSAn statetrigger interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Item(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %DETECTION - Selecting 'Rise' causes the instrument to trigger on the receipt of a signal low LAN Event followed by a signal high LAN Event. - Selecting 'Fall' causes the instrument to trigger on the receipt of a signal high LAN Event followed by a signal low LAN Event. - Selecting 'High' causes the instrument to trigger on every signal high LAN Event. - Selecting 'Low' causes the instrument to trigger on every signal low LAN Event.
        Detection

        %ENABLED When the Enabled parameter is set to ON, receiving the given LAN Event causes the instrument to transition to the state held in the Next State Slot. When the Enabled parameter is OFF, the Input LAN Event is ignored.
        Enabled

        %EVENTID Sets the string that is expected to arrive over the LAN for a given Input LAN Event to occur. The Identifier is variable to allow for easier system debugging.
        EventId

        %FILTER Only LXI Input LAN Events coming from hosts matching the filter string are processed. The syntax for specifying a filter is as follows: Filter == ([host[:port]] | [ALL[:port]]) [,Filter] Specifying an empty string means that LXI trigger packets are accepted as an Input from any port on any host on the network via either TCP or UDP. Specifying only the port means that any host communicating over that port can send events. Specifying ALL indicates that UDP multicast packets are accepted if they are directed to the IANA assigned multicast address on the IANA assigned default port, or the designated port if specified. Examples: - '192.168.0.1:23' - 'agilent.com, soco.agilent.com' - 'agilent.com:80, 192.168.0.1'
        Filter

        %STATELOCATION This property is used to store the file paths of the state files to be recalled when each Input LAN Event is received. Since each LAN Event has its own Location entry, a given state is capable of branching to at least 8 different states. If custom Input events are added, an even greater branching factor is possible. When setting up state transitions, it is important to set the location of the next state before saving. This way, when the saved state is recalled, the next state locations are also automatically recalled.
        StateLocation

    end

    %% Property access methods
    methods

        %% Detection property access methods
        function value = get.Detection(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Detection;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Detection(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.Detection = newValue;
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

        %% EventId property access methods
        function value = get.EventId(obj)
            obj.checkValidObj();
            try
                value = obj.interface.EventId;
            catch e
                obj.interpretError(e);
            end
        end
		function set.EventId(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarStringArg(newValue,'EventId');
            try
                obj.interface.EventId = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Filter property access methods
        function value = get.Filter(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Filter;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Filter(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarStringArg(newValue,'Filter');
            try
                obj.interface.Filter = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% StateLocation property access methods
        function value = get.StateLocation(obj)
            obj.checkValidObj();
            try
                value = obj.interface.StateLocation;
            catch e
                obj.interpretError(e);
            end
        end
		function set.StateLocation(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarStringArg(newValue,'StateLocation');
            try
                obj.interface.StateLocation = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

    %% Public Methods
    methods

        function Configure(obj,Enabled,Detection,Filter,Identifier)
            %CONFIGURE Allows the configuration of some of the parameters from a single command.
            
            obj.checkValidObj();
			error(nargchk(5,5,nargin,'struct'))
            Enabled = obj.checkScalarBoolArg(Enabled,'Enabled');
            Filter = obj.checkScalarStringArg(Filter,'Filter');
            Identifier = obj.checkScalarStringArg(Identifier,'Identifier');
            try
                obj.interface.Configure(logical(Enabled),int32(Detection),char(Filter),char(Identifier));
            catch e
                obj.interpretError(e);
            end
        end

        function Add(obj,SourceName)
            %ADD Adds the provided string to the list of possible LAN events to Input as a response to instrument events.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            SourceName = obj.checkScalarStringArg(SourceName,'SourceName');
            try
                obj.interface.Add(char(SourceName));
            catch e
                obj.interpretError(e);
            end
        end

        function DisableAllTriggerSources(obj)
            %DISABLEALLTRIGGERSOURCES Causes all LXI Input LAN Events to go into the disabled state (Enabled = false).
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.DisableAllTriggerSources();
            catch e
                obj.interpretError(e);
            end
        end

        function Remove(obj,SourceName)
            %REMOVE Removes the provided string from the list of LXI Input LAN Events.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            SourceName = obj.checkScalarStringArg(SourceName,'SourceName');
            try
                obj.interface.Remove(char(SourceName));
            catch e
                obj.interpretError(e);
            end
        end

        function RemoveAllCustomStateTriggerSources(obj)
            %REMOVEALLCUSTOMSTATETRIGGERSOURCES Clears the list of custom LAN events (those introduced using the Add command).
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.RemoveAllCustomStateTriggerSources();
            catch e
                obj.interpretError(e);
            end
        end

    end

end
