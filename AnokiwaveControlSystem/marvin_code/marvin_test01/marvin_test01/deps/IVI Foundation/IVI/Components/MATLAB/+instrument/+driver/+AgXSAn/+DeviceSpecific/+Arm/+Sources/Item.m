classdef Item < instrument.ivicom.Interface
    %ITEM AgXSAn armsource interface.
    
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

        %ENABLED Enables or disables the arm source.
        Enabled

        %DETECTION Specifies the style of arm source detection.
        Detection

        %FILTER Specifies a filter for restricting arm sources.
        Filter

        %EVENTID Specifies the LAN event identifier that is associated with this arm source.  LAN Events with this identifier are accepted from  the source described in the filter.
        EventId

    end

    %% Property access methods
    methods

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

    end

    %% Public Methods
    methods

        function Configure(obj,Enabled,Detection)
            %CONFIGURE This function configures the most commonly configured attributes of the arm source sub-system.
            
            obj.checkValidObj();
			error(nargchk(3,3,nargin,'struct'))
            Enabled = obj.checkScalarBoolArg(Enabled,'Enabled');
            try
                obj.interface.Configure(logical(Enabled),int32(Detection));
            catch e
                obj.interpretError(e);
            end
        end

    end

end
