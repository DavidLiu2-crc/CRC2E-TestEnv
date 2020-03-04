classdef Display < instrument.ivicom.Interface
    %DISPLAY IVI SpecAn class-compliant display interface
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Display(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);

            %% Initialize properties
            try
                obj.Annotation = instrument.driver.AgXSAn.DeviceSpecific.Display.Annotation(obj.interface.Annotation);
            catch %#ok<CTCH>
            end

        end
        
        function delete(obj)
            obj.Annotation = [];
        end

    end
    
    %% Public Properties
    properties

        %ENABLED If True, the insturment updates the display. If False, the instrument does not update the display. 
        Enabled

        %FULLSCREENENABLED Turns/ON/OFF the full screen display feature 
        FullScreenEnabled

        %TEXT This string appears in the instrument's display.
        Text

        %THEME This allows you to change the Display theme.
        Theme

        %WINDOW Selects the next window of the current view.
        Window

        %MENUENABLED Turns ON/OFF the screen menu.
        MenuEnabled

        %NORMALIZEDREFERENCE Sets/Gets the level (in dB) of the normalized reference.
        NormalizedReference

        %REFERENCE Sets/Gets the Reference Level that specifies the amplitude represented by the topmost graticule line.
        Reference

        %REFERENCEOFFSET Sets/Gets the offset value  that will be added to the displayed reference level.
        ReferenceOffset

        %YSCALE Sets/Gets the logarithmic units per vertical graticule division on the display.
        YScale

        %NORMALIZEDPOSITION Sets/Gets the normalized reference position.
        NormalizedPosition

        %LINEENABLED Activates an adjustable horizontal line that is used as a visual reference line. The line?s vertical position corresponds to its amplitude value.
        LineEnabled

        %LINE Sets/Gets the display line's vertical position
        Line

        %OPERATIONPRIORITY Sets/queries the priority of the application process.
        OperationPriority

        %VIEW Sets/Gets the display View.
        View

    end

    %% Public Read Only Properties
    properties (SetAccess = private)

        %ANNOTATION Pointer to the IAgXSAnDisplayAnnotation interface. Read Only.
        Annotation

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

        %% FullScreenEnabled property access methods
        function value = get.FullScreenEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.FullScreenEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.FullScreenEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'FullScreenEnabled');
            try
                obj.interface.FullScreenEnabled = newValue;
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

        %% Theme property access methods
        function value = get.Theme(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Theme;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Theme(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.Theme = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Annotation property access methods
        function value = get.Annotation(obj)
            obj.checkValidObj();
            if isempty(obj.Annotation)
                try
                    obj.Annotation = instrument.driver.AgXSAn.DeviceSpecific.Display.Annotation(obj.interface.Annotation);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Annotation;
        end

        %% Window property access methods
        function value = get.Window(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Window;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Window(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarInt32Arg(newValue,'Window');
            try
                obj.interface.Window = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% MenuEnabled property access methods
        function value = get.MenuEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.MenuEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.MenuEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'MenuEnabled');
            try
                obj.interface.MenuEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% NormalizedReference property access methods
        function value = get.NormalizedReference(obj)
            obj.checkValidObj();
            try
                value = obj.interface.NormalizedReference;
            catch e
                obj.interpretError(e);
            end
        end
		function set.NormalizedReference(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'NormalizedReference');
            try
                obj.interface.NormalizedReference = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Reference property access methods
        function value = get.Reference(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Reference;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Reference(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'Reference');
            try
                obj.interface.Reference = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% ReferenceOffset property access methods
        function value = get.ReferenceOffset(obj)
            obj.checkValidObj();
            try
                value = obj.interface.ReferenceOffset;
            catch e
                obj.interpretError(e);
            end
        end
		function set.ReferenceOffset(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'ReferenceOffset');
            try
                obj.interface.ReferenceOffset = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% YScale property access methods
        function value = get.YScale(obj)
            obj.checkValidObj();
            try
                value = obj.interface.YScale;
            catch e
                obj.interpretError(e);
            end
        end
		function set.YScale(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'YScale');
            try
                obj.interface.YScale = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% NormalizedPosition property access methods
        function value = get.NormalizedPosition(obj)
            obj.checkValidObj();
            try
                value = obj.interface.NormalizedPosition;
            catch e
                obj.interpretError(e);
            end
        end
		function set.NormalizedPosition(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarInt32Arg(newValue,'NormalizedPosition');
            try
                obj.interface.NormalizedPosition = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% LineEnabled property access methods
        function value = get.LineEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.LineEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.LineEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'LineEnabled');
            try
                obj.interface.LineEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Line property access methods
        function value = get.Line(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Line;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Line(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'Line');
            try
                obj.interface.Line = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% OperationPriority property access methods
        function value = get.OperationPriority(obj)
            obj.checkValidObj();
            try
                value = obj.interface.OperationPriority;
            catch e
                obj.interpretError(e);
            end
        end
		function set.OperationPriority(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarInt32Arg(newValue,'OperationPriority');
            try
                obj.interface.OperationPriority = newValue;
            catch e
                obj.interpretError(e);
            end
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
            try
                obj.interface.View = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

    %% Public Methods
    methods

        function ZoomIn(obj)
            %ZOOMIN Zooms or magnifies the current display window.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.ZoomIn();
            catch e
                obj.interpretError(e);
            end
        end

        function ZoomOut(obj)
            %ZOOMOUT Zoom out from the current display window.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.ZoomOut();
            catch e
                obj.interpretError(e);
            end
        end

    end

end
