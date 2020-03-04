classdef Item < instrument.ivicom.Interface
    %ITEM AgXSAn event interface.
    
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

        %SOURCE Specifies the signal which causes an event to be transmitted.
        Source

        %DESTINATIONPATH Specifies a list of places to send the event.
        DestinationPath

        %SLOPE Specifies the slope of the inbound event that will cause the generation of an outbound event.
        Slope

        %DRIVEMODE Specifies how this event is transmitted.
        DriveMode

    end

    %% Property access methods
    methods

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
            newValue = obj.checkScalarStringArg(newValue,'Source');
            try
                obj.interface.Source = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% DestinationPath property access methods
        function value = get.DestinationPath(obj)
            obj.checkValidObj();
            try
                value = obj.interface.DestinationPath;
            catch e
                obj.interpretError(e);
            end
        end
		function set.DestinationPath(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarStringArg(newValue,'DestinationPath');
            try
                obj.interface.DestinationPath = newValue;
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

        %% DriveMode property access methods
        function value = get.DriveMode(obj)
            obj.checkValidObj();
            try
                value = obj.interface.DriveMode;
            catch e
                obj.interpretError(e);
            end
        end
		function set.DriveMode(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.DriveMode = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

    %% Public Methods
    methods

        function Configure(obj,DriveMode,Source,DestinationPath,Slope)
            %CONFIGURE This function configures the most commonly configured attributes of the event sub-system.
            
            obj.checkValidObj();
			error(nargchk(5,5,nargin,'struct'))
            Source = obj.checkScalarStringArg(Source,'Source');
            DestinationPath = obj.checkScalarStringArg(DestinationPath,'DestinationPath');
            try
                obj.interface.Configure(int32(DriveMode),char(Source),char(DestinationPath),int32(Slope));
            catch e
                obj.interpretError(e);
            end
        end

    end

end
