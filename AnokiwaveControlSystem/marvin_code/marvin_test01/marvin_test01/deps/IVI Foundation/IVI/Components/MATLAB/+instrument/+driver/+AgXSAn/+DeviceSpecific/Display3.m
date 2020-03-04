classdef Display3 < instrument.ivicom.Interface
    %DISPLAY3 IAgXSAnDisplay3 interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Display3(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);

            %% Initialize properties
            try
                obj.Annotation = instrument.driver.AgXSAn.DeviceSpecific.Display3.Annotation(obj.interface.Annotation);
            catch %#ok<CTCH>
            end

        end
        
        function delete(obj)
            obj.Annotation = [];
        end

    end
    
    %% Public Properties
    properties

        %SCALETYPE Selects either linear or logarithmic scaling for the frequency axis.
        ScaleType

        %FREQUENCYLINE Horizontal position.
        FrequencyLine

        %FREQUENCYLINEENABLED Enables/Disables vertical visual reference line on the selected window.
        FrequencyLineEnabled

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

        %% ScaleType property access methods
        function value = get.ScaleType(obj)
            obj.checkValidObj();
            try
                value = obj.interface.ScaleType;
            catch e
                obj.interpretError(e);
            end
        end
		function set.ScaleType(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.ScaleType = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% FrequencyLine property access methods
        function value = get.FrequencyLine(obj)
            obj.checkValidObj();
            try
                value = obj.interface.FrequencyLine;
            catch e
                obj.interpretError(e);
            end
        end
		function set.FrequencyLine(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'FrequencyLine');
            try
                obj.interface.FrequencyLine = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% FrequencyLineEnabled property access methods
        function value = get.FrequencyLineEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.FrequencyLineEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.FrequencyLineEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'FrequencyLineEnabled');
            try
                obj.interface.FrequencyLineEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

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
                    obj.Annotation = instrument.driver.AgXSAn.DeviceSpecific.Display3.Annotation(obj.interface.Annotation);
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

        function val = GetLine(obj,Index)
            %GETLINE Gets the display line's vertical position.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            Index = obj.checkScalarInt32Arg(Index,'Index');
            try
                [val] = obj.interface.GetLine(int32(Index));
            catch e
                obj.interpretError(e);
            end
        end

        function val = GetFrequencyLine(obj,Index)
            %GETFREQUENCYLINE Gets the selected Frequency Line control.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            Index = obj.checkScalarInt32Arg(Index,'Index');
            try
                [val] = obj.interface.GetFrequencyLine(int32(Index));
            catch e
                obj.interpretError(e);
            end
        end

        function SetLine(obj,Index,Position)
            %SETLINE Sets the display line's vertical position.
            
            obj.checkValidObj();
			error(nargchk(3,3,nargin,'struct'))
            Index = obj.checkScalarInt32Arg(Index,'Index');
            Position = obj.checkScalarDoubleArg(Position,'Position');
            try
                obj.interface.SetLine(int32(Index),double(Position));
            catch e
                obj.interpretError(e);
            end
        end

        function SetFrequencyLine(obj,Index,Position)
            %SETFREQUENCYLINE Selects the Frequency Line control.
            
            obj.checkValidObj();
			error(nargchk(3,3,nargin,'struct'))
            Index = obj.checkScalarInt32Arg(Index,'Index');
            Position = obj.checkScalarDoubleArg(Position,'Position');
            try
                obj.interface.SetFrequencyLine(int32(Index),double(Position));
            catch e
                obj.interpretError(e);
            end
        end

        function val = GetFrequencyLineEnabled(obj,Index)
            %GETFREQUENCYLINEENABLED Gets the status of frequency line.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            Index = obj.checkScalarInt32Arg(Index,'Index');
            try
                [val] = obj.interface.GetFrequencyLineEnabled(int32(Index));
            catch e
                obj.interpretError(e);
            end
        end

        function val = GetLineEnabled(obj,Index)
            %GETLINEENABLED Gets the status of display line.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            Index = obj.checkScalarInt32Arg(Index,'Index');
            try
                [val] = obj.interface.GetLineEnabled(int32(Index));
            catch e
                obj.interpretError(e);
            end
        end

        function SetFrequencyLineEnabled(obj,Index,Value)
            %SETFREQUENCYLINEENABLED Enable the Frequency Line control.
            
            obj.checkValidObj();
			error(nargchk(3,3,nargin,'struct'))
            Index = obj.checkScalarInt32Arg(Index,'Index');
            Value = obj.checkScalarBoolArg(Value,'Value');
            try
                obj.interface.SetFrequencyLineEnabled(int32(Index),logical(Value));
            catch e
                obj.interpretError(e);
            end
        end

        function SetLineEnabled(obj,Index,Value)
            %SETLINEENABLED Enable the display line's vertical position.
            
            obj.checkValidObj();
			error(nargchk(3,3,nargin,'struct'))
            Index = obj.checkScalarInt32Arg(Index,'Index');
            Value = obj.checkScalarBoolArg(Value,'Value');
            try
                obj.interface.SetLineEnabled(int32(Index),logical(Value));
            catch e
                obj.interpretError(e);
            end
        end

        function val = GetTimeLine(obj,Index)
            %GETTIMELINE Gets the time line position.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            Index = obj.checkScalarInt32Arg(Index,'Index');
            try
                [val] = obj.interface.GetTimeLine(int32(Index));
            catch e
                obj.interpretError(e);
            end
        end

        function val = GetTimeLineEnabled(obj,Index)
            %GETTIMELINEENABLED Gets the status of time line.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            Index = obj.checkScalarInt32Arg(Index,'Index');
            try
                [val] = obj.interface.GetTimeLineEnabled(int32(Index));
            catch e
                obj.interpretError(e);
            end
        end

        function SetTimeLine(obj,Index,Position)
            %SETTIMELINE Sets the time line's position.
            
            obj.checkValidObj();
			error(nargchk(3,3,nargin,'struct'))
            Index = obj.checkScalarInt32Arg(Index,'Index');
            Position = obj.checkScalarDoubleArg(Position,'Position');
            try
                obj.interface.SetTimeLine(int32(Index),double(Position));
            catch e
                obj.interpretError(e);
            end
        end

        function SetTimeLineEnabled(obj,Index,Value)
            %SETTIMELINEENABLED Enable the time line state.
            
            obj.checkValidObj();
			error(nargchk(3,3,nargin,'struct'))
            Index = obj.checkScalarInt32Arg(Index,'Index');
            Value = obj.checkScalarBoolArg(Value,'Value');
            try
                obj.interface.SetTimeLineEnabled(int32(Index),logical(Value));
            catch e
                obj.interpretError(e);
            end
        end

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
