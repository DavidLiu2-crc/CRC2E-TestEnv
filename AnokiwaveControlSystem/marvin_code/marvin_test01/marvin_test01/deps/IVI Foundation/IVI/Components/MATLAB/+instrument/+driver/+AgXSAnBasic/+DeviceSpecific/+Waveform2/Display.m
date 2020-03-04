classdef Display < instrument.ivicom.Interface
    %DISPLAY IAgXSAnBasicWaveform2Display interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Display(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);

            %% Initialize properties
            try
                obj.WindowX = instrument.driver.AgXSAnBasic.DeviceSpecific.Waveform2.Display.WindowX(obj.interface.WindowX);
            catch %#ok<CTCH>
            end

            try
                obj.WindowY = instrument.driver.AgXSAnBasic.DeviceSpecific.Waveform2.Display.WindowY(obj.interface.WindowY);
            catch %#ok<CTCH>
            end

            try
                obj.IQWaveformView = instrument.driver.AgXSAnBasic.DeviceSpecific.Waveform2.Display.IQWaveformView(obj.interface.IQWaveformView);
            catch %#ok<CTCH>
            end

        end
        
        function delete(obj)
            obj.WindowX = [];
            obj.WindowY = [];
            obj.IQWaveformView = [];
        end

    end
    
    %% Public Properties
    properties

        %VIEW Select view by number.
        View

        %VIEWSELECTION Selects the results view
        ViewSelection

    end

    %% Public Read Only Properties
    properties (SetAccess = private)

        %WINDOWX Pointer to the IAgXSAnBasicWaveform2DisplayWindowX interface. Read Only.
        WindowX

        %WINDOWY Pointer to the IAgXSAnBasicWaveform2DisplayWindowY interface. Read Only.
        WindowY

        %IQWAVEFORMVIEW Pointer to the IAgXSAnBasicWaveform2DisplayIQWaveformView interface. Read Only.
        IQWaveformView

    end

    %% Property access methods
    methods

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

        %% WindowX property access methods
        function value = get.WindowX(obj)
            obj.checkValidObj();
            if isempty(obj.WindowX)
                try
                    obj.WindowX = instrument.driver.AgXSAnBasic.DeviceSpecific.Waveform2.Display.WindowX(obj.interface.WindowX);
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
                    obj.WindowY = instrument.driver.AgXSAnBasic.DeviceSpecific.Waveform2.Display.WindowY(obj.interface.WindowY);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.WindowY;
        end

        %% IQWaveformView property access methods
        function value = get.IQWaveformView(obj)
            obj.checkValidObj();
            if isempty(obj.IQWaveformView)
                try
                    obj.IQWaveformView = instrument.driver.AgXSAnBasic.DeviceSpecific.Waveform2.Display.IQWaveformView(obj.interface.IQWaveformView);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.IQWaveformView;
        end

    end

end
