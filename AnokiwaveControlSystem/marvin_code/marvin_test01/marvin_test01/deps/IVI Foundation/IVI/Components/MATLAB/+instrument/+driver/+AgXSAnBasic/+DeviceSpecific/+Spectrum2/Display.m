classdef Display < instrument.ivicom.Interface
    %DISPLAY IAgXSAnBasicSpectrum2Display interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Display(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);

            %% Initialize properties
            try
                obj.Windows = instrument.driver.AgXSAnBasic.DeviceSpecific.Spectrum2.Display.Windows(obj.interface.Windows);
            catch %#ok<CTCH>
            end

        end
        
        function delete(obj)
            obj.Windows = [];
        end

    end
    
    %% Public Properties
    properties

        %TEXT Allows to read or write Title on the display.
        Text

    end

    %% Public Read Only Properties
    properties (SetAccess = private)

        %WINDOWS Pointer to the IAgXSAnBasicSpectrumWindows interface. Read Only.
        Windows

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

        %% Windows property access methods
        function value = get.Windows(obj)
            obj.checkValidObj();
            if isempty(obj.Windows)
                try
                    obj.Windows = instrument.driver.AgXSAnBasic.DeviceSpecific.Spectrum2.Display.Windows(obj.interface.Windows);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Windows;
        end

    end

end
