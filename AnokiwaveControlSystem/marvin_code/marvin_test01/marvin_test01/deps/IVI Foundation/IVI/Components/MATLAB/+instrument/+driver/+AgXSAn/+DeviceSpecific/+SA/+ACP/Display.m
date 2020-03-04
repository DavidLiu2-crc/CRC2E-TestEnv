classdef Display < instrument.ivicom.Interface
    %DISPLAY IAgXSAn SAACPDisplay interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Display(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);

            %% Initialize properties
            try
                obj.WindowY = instrument.driver.AgXSAn.DeviceSpecific.SA.ACP.Display.WindowY(obj.interface.WindowY);
            catch %#ok<CTCH>
            end

        end
        
        function delete(obj)
            obj.WindowY = [];
        end

    end
    
    %% Public Properties
    properties

        %TEXT Writes/Reads text across the top of the display.
        Text

        %BARGRAPHENABLED Turns the Bar Graph On and Off.
        BarGraphEnabled

    end

    %% Public Read Only Properties
    properties (SetAccess = private)

        %WINDOWY Pointer to IAgXSAnSAACPDisplayWindowY interface. Read Only.
        WindowY

    end

    %% Property access methods
    methods

        %% Text property access methods
        function value = get.Text(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Text;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Text(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarStringArg(newValue,'Text');
            try
                obj.interface.Text = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% WindowY property access methods
        function value = get.WindowY(obj)
            obj.checkValidObj();
            if isempty(obj.WindowY)
                try
                    obj.WindowY = instrument.driver.AgXSAn.DeviceSpecific.SA.ACP.Display.WindowY(obj.interface.WindowY);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.WindowY;
        end

        %% BarGraphEnabled property access methods
        function value = get.BarGraphEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.BarGraphEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.BarGraphEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'BarGraphEnabled');
            try
                obj.interface.BarGraphEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

end
