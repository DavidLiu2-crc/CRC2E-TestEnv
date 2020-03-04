classdef Events < instrument.ivicom.RepeatedCapability
    %EVENTS AgXSAn event collection interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Events(interface)
            
            %% construct superclass
            obj@instrument.ivicom.RepeatedCapability(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %WIREDORBIASMODE Specifies whether the LXI device will serve as the wired-OR bias for specific LXI trigger bus lines.
        WiredOrBiasMode

    end

    %% Public Read Only Properties
    properties (SetAccess = private)

        %COUNT The number of events. Read Only.
        Count

    end

    %% Property access methods
    methods

        %% Count property access methods
        function value = get.Count(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Count;
            catch e
                obj.interpretError(e);
            end
        end

        %% WiredOrBiasMode property access methods
        function value = get.WiredOrBiasMode(obj)
            obj.checkValidObj();
            try
                value = obj.interface.WiredOrBiasMode;
            catch e
                obj.interpretError(e);
            end
        end
		function set.WiredOrBiasMode(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarInt32Arg(newValue,'WiredOrBiasMode');
            try
                obj.interface.WiredOrBiasMode = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

    %% Public Methods
    methods

        function RemoveAllCustomEvents(obj)
            %REMOVEALLCUSTOMEVENTS This function removes all of the custom events that were added using the Add Event function.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.RemoveAllCustomEvents();
            catch e
                obj.interpretError(e);
            end
        end

        function Remove(obj,EventName)
            %REMOVE This function removes an event.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            EventName = obj.checkScalarStringArg(EventName,'EventName');
            try
                obj.interface.Remove(char(EventName));
            catch e
                obj.interpretError(e);
            end
        end

        function Add(obj,EventName)
            %ADD This function creates a new event.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            EventName = obj.checkScalarStringArg(EventName,'EventName');
            try
                obj.interface.Add(char(EventName));
            catch e
                obj.interpretError(e);
            end
        end

        function DisableAll(obj)
            %DISABLEALL This function disables all events.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.DisableAll();
            catch e
                obj.interpretError(e);
            end
        end

        function val = Item(obj,Name)
            %ITEM An interface reference pointer to the IAgXSAnEvent interface which is selected by the event name.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            Name = obj.checkScalarStringArg(Name,'Name');
            try
                [val] = instrument.driver.AgXSAn.DeviceSpecific.Events.Item(obj.interface.Item(char(Name)));
            catch e
                obj.interpretError(e);
            end
        end

        function val = Name(obj,Index)
            %NAME The event name for a given index.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            Index = obj.checkScalarInt32Arg(Index,'Index');
            try
                [val] = obj.interface.Name(int32(Index));
            catch e
                obj.interpretError(e);
            end
        end

    end

end
