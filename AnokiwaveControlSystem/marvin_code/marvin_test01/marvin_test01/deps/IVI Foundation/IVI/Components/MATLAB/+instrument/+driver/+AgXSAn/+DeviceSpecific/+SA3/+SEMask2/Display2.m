classdef Display2 < instrument.ivicom.Interface
    %DISPLAY2 IAgXSAnSASEMaskDisplay2 interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Display2(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);

            %% Initialize properties
            try
                obj.WindowX = instrument.driver.AgXSAn.DeviceSpecific.SA3.SEMask2.Display2.WindowX(obj.interface.WindowX);
            catch %#ok<CTCH>
            end

            try
                obj.WindowY = instrument.driver.AgXSAn.DeviceSpecific.SA3.SEMask2.Display2.WindowY(obj.interface.WindowY);
            catch %#ok<CTCH>
            end

        end
        
        function delete(obj)
            obj.WindowX = [];
            obj.WindowY = [];
        end

    end
    
    %% Public Properties
    properties

        %TEXT Writes/Reads text across the top of the display.
        Text

        %VIEW Selects display view by number.
        View

        %VIEWSELECTION Selects display view by name.
        ViewSelection

        %LIMITLINEENABLED Toggles the limit lines display function for the spectrum emission mask measurements On and Off.
        LimitLineEnabled

    end

    %% Public Read Only Properties
    properties (SetAccess = private)

        %WINDOWX Pointer to the IAgXSAnSASEMaskDisplay2WindowX interface. Read Only.
        WindowX

        %WINDOWY Pointer to IAgXSAnSASEMaskDisplayWindowY interface. Read Only.
        WindowY

    end

    %% Property access methods
    methods

        %% WindowX property access methods
        function value = get.WindowX(obj)
            obj.checkValidObj();
            if isempty(obj.WindowX)
                try
                    obj.WindowX = instrument.driver.AgXSAn.DeviceSpecific.SA3.SEMask2.Display2.WindowX(obj.interface.WindowX);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.WindowX;
        end

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
                    obj.WindowY = instrument.driver.AgXSAn.DeviceSpecific.SA3.SEMask2.Display2.WindowY(obj.interface.WindowY);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.WindowY;
        end

        %% View property access methods
        function value = get.View(obj)
            obj.checkValidObj();
            try
                value = obj.interface.View;
            catch e
                obj.interpretError(e);
            end
        end
		function set.View(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarInt32Arg(newValue,'View');
            try
                obj.interface.View = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% ViewSelection property access methods
        function value = get.ViewSelection(obj)
            obj.checkValidObj();
            try
                value = obj.interface.ViewSelection;
            catch e
                obj.interpretError(e);
            end
        end
		function set.ViewSelection(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.ViewSelection = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% LimitLineEnabled property access methods
        function value = get.LimitLineEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.LimitLineEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.LimitLineEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'LimitLineEnabled');
            try
                obj.interface.LimitLineEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

end
