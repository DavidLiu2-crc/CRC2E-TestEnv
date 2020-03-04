classdef Item < instrument.ivicom.Interface
    %ITEM AgXSAn triggersource interface.
    
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

        %DELAY Specifies the trigger source delay from when the trigger logic is satisfied until the device specific action (for instance a measurement) is triggered.
        Delay

        %DETECTION Specifies the slope of the trigger source.
        Detection

        %EVENTID Specifies the LAN event identifier that is associated with this trigger source.
        EventId

        %FILTER Specifies a filter for restricting trigger sources.
        Filter

    end

    %% Property access methods
    methods

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

    end

    %% Public Methods
    methods

        function Configure(obj,Delay,Detection)
            %CONFIGURE This function configures the most commonly configured attributes of the trigger source sub-system.
            
            obj.checkValidObj();
			error(nargchk(3,3,nargin,'struct'))
            Delay = obj.checkScalarDoubleArg(Delay,'Delay');
            try
                obj.interface.Configure(double(Delay),int32(Detection));
            catch e
                obj.interpretError(e);
            end
        end

    end

end
