classdef IQWaveformView < instrument.ivicom.Interface
    %IQWAVEFORMVIEW IAgXSAnBasicWaveform2DisplayIQWaveformView interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = IQWaveformView(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);

            %% Initialize properties
            try
                obj.WindowX = instrument.driver.AgXSAnBasic.DeviceSpecific.Waveform2.Display.IQWaveformView.WindowX(obj.interface.WindowX);
            catch %#ok<CTCH>
            end

            try
                obj.WindowY = instrument.driver.AgXSAnBasic.DeviceSpecific.Waveform2.Display.IQWaveformView.WindowY(obj.interface.WindowY);
            catch %#ok<CTCH>
            end

        end
        
        function delete(obj)
            obj.WindowX = [];
            obj.WindowY = [];
        end

    end
    
    %% Public Read Only Properties
    properties (SetAccess = private)

        %WINDOWX Pointer to the IAgXSAnBasicWaveform2DisplayIQWaveformViewWindowX interface. Read Only.
        WindowX

        %WINDOWY Pointer to the IAgXSAnBasicWaveform2DisplayIQWaveformViewWindowY interface. Read Only.
        WindowY

    end

    %% Property access methods
    methods

        %% WindowX property access methods
        function value = get.WindowX(obj)
            obj.checkValidObj();
            if isempty(obj.WindowX)
                try
                    obj.WindowX = instrument.driver.AgXSAnBasic.DeviceSpecific.Waveform2.Display.IQWaveformView.WindowX(obj.interface.WindowX);
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
                    obj.WindowY = instrument.driver.AgXSAnBasic.DeviceSpecific.Waveform2.Display.IQWaveformView.WindowY(obj.interface.WindowY);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.WindowY;
        end

    end

end
