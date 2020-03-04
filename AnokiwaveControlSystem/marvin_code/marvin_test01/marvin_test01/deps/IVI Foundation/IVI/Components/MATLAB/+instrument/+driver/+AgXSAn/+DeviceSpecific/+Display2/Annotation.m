classdef Annotation < instrument.ivicom.Interface
    %ANNOTATION IAgXSAn DisplayAnnotation interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Annotation(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %ACTIVEFUNCTIONENABLED Turns On/Off the active function display in the Meas Bar, and all of the active function values displayed on the softkeys.
        ActiveFunctionEnabled

        %MEASBARENABLED This function turns the Measurement Bar on and off, including the settings panel. When off, the graticule area expands to fill the area formerly occupied by the Measurement Bar.
        MeasBarEnabled

        %SCREENENABLED This controls the display of the annunciation and annotation around the graticule, including any annotation on lines (such as the display line, the threshold line, etc) and the y-axis annotation. This does NOT include marker annotation (or the N dB result). When off, the graticule expands to fill the entire graticule area, leaving only the 1.5% gap above the graticule as described in the Trace/Detector chapter.
        ScreenEnabled

        %TRACEENABLED Turns on and off the labels on the traces, showing their detector (or their math mode) as described in the Trace/Detector section. If trace math is being performed with a trace, then the trace math annotation will replace the detector annotation.
        TraceEnabled

        %ENABLED Turns On/OFF all display annoation features for all measurements in all modes.
        Enabled

        %GRATICULEENABLED Turns the display graticule On or Off. It also turns the graticule y-axis annotation on and off
        GraticuleEnabled

    end

    %% Property access methods
    methods

        %% ActiveFunctionEnabled property access methods
        function value = get.ActiveFunctionEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.ActiveFunctionEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.ActiveFunctionEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'ActiveFunctionEnabled');
            try
                obj.interface.ActiveFunctionEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% MeasBarEnabled property access methods
        function value = get.MeasBarEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.MeasBarEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.MeasBarEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'MeasBarEnabled');
            try
                obj.interface.MeasBarEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% ScreenEnabled property access methods
        function value = get.ScreenEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.ScreenEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.ScreenEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'ScreenEnabled');
            try
                obj.interface.ScreenEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% TraceEnabled property access methods
        function value = get.TraceEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.TraceEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.TraceEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'TraceEnabled');
            try
                obj.interface.TraceEnabled = newValue;
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

        %% GraticuleEnabled property access methods
        function value = get.GraticuleEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.GraticuleEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.GraticuleEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'GraticuleEnabled');
            try
                obj.interface.GraticuleEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

end
