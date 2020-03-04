classdef Display2 < instrument.ivicom.Interface
    %DISPLAY2 IAgXSAnSAOccupiedBandwidthDisplay2 interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Display2(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);

            %% Initialize properties
            try
                obj.WindowY = instrument.driver.AgXSAn.DeviceSpecific.SA3.OccupiedBandwidth2.Display2.WindowY(obj.interface.WindowY);
            catch %#ok<CTCH>
            end

        end
        
        function delete(obj)
            obj.WindowY = [];
        end

    end
    
    %% Public Properties
    properties

        %VIEWSELECTION Selects the results view.
        ViewSelection

        %XDBBOUNDARIESENABLED Enable or disable the bandwidth between two points on the signal which is x dB down from the highest signal point.
        XDBBoundariesEnabled

        %BOUNDARYFREQUENCYDISPLAYTYPE The boundary frequency display type.
        BoundaryFrequencyDisplayType

        %TEXT Writes/Reads text across the top of the display.
        Text

    end

    %% Public Read Only Properties
    properties (SetAccess = private)

        %WINDOWY Pointer to IAgXSAnSAOccupiedBandwidthDisplayWindowY interface. Read Only.
        WindowY

    end

    %% Property access methods
    methods

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

        %% XDBBoundariesEnabled property access methods
        function value = get.XDBBoundariesEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.XDBBoundariesEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.XDBBoundariesEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'XDBBoundariesEnabled');
            try
                obj.interface.XDBBoundariesEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% BoundaryFrequencyDisplayType property access methods
        function value = get.BoundaryFrequencyDisplayType(obj)
            obj.checkValidObj();
            try
                value = obj.interface.BoundaryFrequencyDisplayType;
            catch e
                obj.interpretError(e);
            end
        end
		function set.BoundaryFrequencyDisplayType(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.BoundaryFrequencyDisplayType = newValue;
            catch e
                obj.interpretError(e);
            end
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
                    obj.WindowY = instrument.driver.AgXSAn.DeviceSpecific.SA3.OccupiedBandwidth2.Display2.WindowY(obj.interface.WindowY);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.WindowY;
        end

    end

end
