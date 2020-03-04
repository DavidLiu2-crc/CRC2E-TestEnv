classdef Display < instrument.ivicom.Interface
    %DISPLAY IAgXSAnSABurstPowerDisplay interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Display(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);

            %% Initialize properties
            try
                obj.WindowX = instrument.driver.AgXSAn.DeviceSpecific.SA4.BurstPower2.Display.WindowX(obj.interface.WindowX);
            catch %#ok<CTCH>
            end

            try
                obj.WindowY = instrument.driver.AgXSAn.DeviceSpecific.SA4.BurstPower2.Display.WindowY(obj.interface.WindowY);
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

        %BARGRAPHENABLED Enables or disables the display of Bar graph.
        BarGraphEnabled

        %MAXHOLDENABLED Enables or Disables the maxhold feature.
        MaxHoldEnabled

        %MINHOLDENABLED Enables or Disables the minhold feature.
        MinHoldEnabled

    end

    %% Public Read Only Properties
    properties (SetAccess = private)

        %WINDOWX Pointer to IAgXSAnSABurstPowerDisplayWindowX interface. Read Only.
        WindowX

        %WINDOWY P)ointer to IAgXSAnSABurstPowerDisplayWindowY interface. Read Only.
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

        %% MaxHoldEnabled property access methods
        function value = get.MaxHoldEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.MaxHoldEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.MaxHoldEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'MaxHoldEnabled');
            try
                obj.interface.MaxHoldEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% MinHoldEnabled property access methods
        function value = get.MinHoldEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.MinHoldEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.MinHoldEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'MinHoldEnabled');
            try
                obj.interface.MinHoldEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% WindowX property access methods
        function value = get.WindowX(obj)
            obj.checkValidObj();
            if isempty(obj.WindowX)
                try
                    obj.WindowX = instrument.driver.AgXSAn.DeviceSpecific.SA4.BurstPower2.Display.WindowX(obj.interface.WindowX);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.WindowX;
        end

        %% WindowY property access methods
        function value = get.WindowY(obj)
            obj.checkValidObj();
            if isempty(obj.WindowY)
                try
                    obj.WindowY = instrument.driver.AgXSAn.DeviceSpecific.SA4.BurstPower2.Display.WindowY(obj.interface.WindowY);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.WindowY;
        end

    end

end
