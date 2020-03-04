classdef Display < instrument.ivicom.Interface
    %DISPLAY IAgXSAnSASpuriousEmissionsDisplay interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Display(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);

            %% Initialize properties
            try
                obj.WindowY = instrument.driver.AgXSAn.DeviceSpecific.SA4.SpuriousEmissions2.Display.WindowY(obj.interface.WindowY);
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

        %VIEW Displays any spurs found. It is only enabled when the measurement type is set to examine and will turn on upon completion of a measurement.
        View

    end

    %% Public Read Only Properties
    properties (SetAccess = private)

        %WINDOWY Pointer to IAgXSAnSASpuriousEmissionsDisplayWindowY interface. Read Only.
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
                    obj.WindowY = instrument.driver.AgXSAn.DeviceSpecific.SA4.SpuriousEmissions2.Display.WindowY(obj.interface.WindowY);
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

    end

end
