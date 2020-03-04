classdef Marker < instrument.ivicom.Interface
    %MARKER IVI SpecAn class-compliant marker interface
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Marker(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);

            %% Initialize properties
            try
                obj.FrequencyCounter = instrument.driver.AgXSAn.DeviceSpecific.SA.Marker.FrequencyCounter(obj.interface.FrequencyCounter);
            catch %#ok<CTCH>
            end

            try
                obj.NDBPoints = instrument.driver.AgXSAn.DeviceSpecific.SA.Marker.NDBPoints(obj.interface.NDBPoints);
            catch %#ok<CTCH>
            end

            try
                obj.MeasureAtMarker = instrument.driver.AgXSAn.DeviceSpecific.SA.Marker.MeasureAtMarker(obj.interface.MeasureAtMarker);
            catch %#ok<CTCH>
            end

        end
        
        function delete(obj)
            obj.FrequencyCounter = [];
            obj.NDBPoints = [];
            obj.MeasureAtMarker = [];
        end

    end
    
    %% Public Properties
    properties

        %ACTIVEMARKER Establishes the active marker.
        ActiveMarker

        %TYPE Specifies the marker type of the active marker.
        Type

        %PEAKEXCURSION Specifies the minimum amplitude variation of the signal in dB that the marker can identify as a peak.
        PeakExcursion

        %POSITION Specifies the frequency or time position of the active marker.
        Position

        %SIGNALTRACKENABLED Enables/disables signal tracking.
        SignalTrackEnabled

        %THRESHOLD Specifies the lower limit for the marker search functions.
        Threshold

        %TRACE Specifies the trace for the active marker.
        Trace

        %COUPLEENABLED Turns On or Off the marker coupling feature.When this function is On, moving any marker causes an equal X axis movement of every other marker which is not Off. By equal X axis movement it is meant that the system preserves the difference between each marker's X axis value (in the fundamental x-axis units of the trace that marker is on) and the X axis value of the marker being moved (in the same fundamental x-axis units).
        CoupleEnabled

        %DELTAREFERENCE Selects the marker that the active marker will be relative to (its reference marker).  The marker must be a Delta marker to make this property relevant.
        DeltaReference

        %ENABLED Turns the marker on or off.
        Enabled

        %FUNCTION Sets the marker function.
        Function

        %FUNCTIONBANDLEFT Sets the left edge frequency or time value for the band of the selected marker.
        FunctionBandLeft

        %FUNCTIONBANDRIGHT Sets the right edge frequency or time value for the band of the selected marker.
        FunctionBandRight

        %FUNCTIONBANDSPAN Sets the width of the frequency span for the selected marker.
        FunctionBandSpan

        %LINESENABLED When on, displays a vertical line of graticule height and a horizontal line of graticule width, intersecting at the indicator point of the marker (that is, the center of the X or the bottom tip of the diamond. The lines are blue (0,0,255) in color. If the marker is offscreen the lines should be extended from the marker so that they go thru the screen area if possible. This is really useful for offscreen Fixed markers as it lets you see their amplitude even though they are off the X Axis.
        LinesEnabled

        %PEAKTABLEENABLED Turns Peak Table on/off. When turned on, the display is split into a measurement window and a peak table display window. Turning the Peak Table on turns the Marker Table off and vice versa.
        PeakTableEnabled

        %XAXISSCALE Controls how the x-axis information for the selected marker is displayed in the marker area (top-right of display) and the active function area of the display.
        XAxisScale

        %XAXISSCALEAUTOENABLED When in Auto, the X Axis Scale is Frequency if the Marker Trace is a frequency domain trace, Tim e if the Marker Trace is a time domain trace. When in Auto, if the marker changes traces, or the domain of the trace the marker is on changes, the Auto result is re-evaluated. If the X Axis Scale is chosen manually, that Scale is used regardless of the domain of the trace.
        XAxisScaleAutoEnabled

        %TABLEENABLED Splits display into a measurement window and a marker data display window.
        TableEnabled

        %TRACEAUTOENABLED Turns trace auto mode on and off.  In Auto mode, the analyzer places the marker on the lowest-numbered trace which is in ClearWrite mode.
        TraceAutoEnabled

        %Y The command selects the marker and sets the marker Y Axis value; the default unit is the current Y Axis unit. It has no effect (other than selecting the marker) unless the marker control mode is Fixed.
        Y

        %CONTINUOUSPEAKSEARCHENABLED Turns Continuous Peak Search on or off. When Continuous Peak Search is on, a peak search is automatically performed for the selected marker after each sweep. The rules for finding the peak are exactly the same as for Peak Search, including the use of the peak criteria rules. If no valid peak is found, a warning is generated after each sweep.
        ContinuousPeakSearchEnabled

        %FUNCTIONBANDSPANAUTOENABLED Sets/Get the width of the frequency auto span for the selected marker.
        FunctionBandSpanAutoEnabled

        %THRESHOLDENABLED Turns the peak threshold requirement on/off
        ThresholdEnabled

        %PEAKEXCURSIONENABLED Turns the peak excursion requirement on/off.
        PeakExcursionEnabled

        %PEAKTABLEREADOUTMODE Reads up to twenty signal peaks as defined by the setting:
        PeakTableReadoutMode

        %PEAKSORTMODE Sets the peak table sorting routine to list the peaks in order of descending amplitude or ascending frequency.
        PeakSortMode

        %PEAKSEARCHMODE Enables user to decide the mode of peak search to be performed.
        PeakSearchMode

        %XAXISTRACEPOINTS Sets the marker X position in trace points
        XAxisTracePoints

    end

    %% Public Read Only Properties
    properties (SetAccess = private)

        %FREQUENCYCOUNTER Pointer to the class-compliant IIviSpecAnMarkerFrequencyCounter interface Read Only.
        FrequencyCounter

        %AMPLITUDE Returns the amplitude of the active marker. Read Only.
        Amplitude

        %COUNT Specifies the number of markers available for a particular instrument. Read Only.
        Count

        %REFERENCEPOSITION Returns the reference marker position when the active marker is a delta marker. Read Only.
        ReferencePosition

        %REFERENCEAMPLITUDE Returns the reference marker amplitude when the active marker is a delta marker. Read Only.
        ReferenceAmplitude

        %NDBPOINTS Pointer to IAgXSAnMarkerNDBPoints interface. Read Only.
        NDBPoints

        %MEASUREATMARKER Pointer to the IAgXSAnSAMarkerMeasureAtMarker interface. Read Only.
        MeasureAtMarker

    end

    %% Property access methods
    methods

        %% FrequencyCounter property access methods
        function value = get.FrequencyCounter(obj)
            obj.checkValidObj();
            if isempty(obj.FrequencyCounter)
                try
                    obj.FrequencyCounter = instrument.driver.AgXSAn.DeviceSpecific.SA.Marker.FrequencyCounter(obj.interface.FrequencyCounter);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.FrequencyCounter;
        end

        %% ActiveMarker property access methods
        function value = get.ActiveMarker(obj)
            obj.checkValidObj();
            try
                value = obj.interface.ActiveMarker;
            catch e
                obj.interpretError(e);
            end
        end
		function set.ActiveMarker(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarInt32Arg(newValue,'ActiveMarker');
            try
                obj.interface.ActiveMarker = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Amplitude property access methods
        function value = get.Amplitude(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Amplitude;
            catch e
                obj.interpretError(e);
            end
        end

        %% Type property access methods
        function value = get.Type(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Type;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Type(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.Type = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Count property access methods
        function value = get.Count(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Count;
            catch e
                obj.interpretError(e);
            end
        end

        %% PeakExcursion property access methods
        function value = get.PeakExcursion(obj)
            obj.checkValidObj();
            try
                value = obj.interface.PeakExcursion;
            catch e
                obj.interpretError(e);
            end
        end
		function set.PeakExcursion(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'PeakExcursion');
            try
                obj.interface.PeakExcursion = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Position property access methods
        function value = get.Position(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Position;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Position(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'Position');
            try
                obj.interface.Position = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% ReferencePosition property access methods
        function value = get.ReferencePosition(obj)
            obj.checkValidObj();
            try
                value = obj.interface.ReferencePosition;
            catch e
                obj.interpretError(e);
            end
        end

        %% ReferenceAmplitude property access methods
        function value = get.ReferenceAmplitude(obj)
            obj.checkValidObj();
            try
                value = obj.interface.ReferenceAmplitude;
            catch e
                obj.interpretError(e);
            end
        end

        %% SignalTrackEnabled property access methods
        function value = get.SignalTrackEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.SignalTrackEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.SignalTrackEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'SignalTrackEnabled');
            try
                obj.interface.SignalTrackEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Threshold property access methods
        function value = get.Threshold(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Threshold;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Threshold(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'Threshold');
            try
                obj.interface.Threshold = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Trace property access methods
        function value = get.Trace(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Trace;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Trace(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarInt32Arg(newValue,'Trace');
            try
                obj.interface.Trace = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% CoupleEnabled property access methods
        function value = get.CoupleEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.CoupleEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.CoupleEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'CoupleEnabled');
            try
                obj.interface.CoupleEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% DeltaReference property access methods
        function value = get.DeltaReference(obj)
            obj.checkValidObj();
            try
                value = obj.interface.DeltaReference;
            catch e
                obj.interpretError(e);
            end
        end
		function set.DeltaReference(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarInt32Arg(newValue,'DeltaReference');
            try
                obj.interface.DeltaReference = newValue;
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

        %% Function property access methods
        function value = get.Function(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Function;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Function(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.Function = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% FunctionBandLeft property access methods
        function value = get.FunctionBandLeft(obj)
            obj.checkValidObj();
            try
                value = obj.interface.FunctionBandLeft;
            catch e
                obj.interpretError(e);
            end
        end
		function set.FunctionBandLeft(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'FunctionBandLeft');
            try
                obj.interface.FunctionBandLeft = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% FunctionBandRight property access methods
        function value = get.FunctionBandRight(obj)
            obj.checkValidObj();
            try
                value = obj.interface.FunctionBandRight;
            catch e
                obj.interpretError(e);
            end
        end
		function set.FunctionBandRight(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'FunctionBandRight');
            try
                obj.interface.FunctionBandRight = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% FunctionBandSpan property access methods
        function value = get.FunctionBandSpan(obj)
            obj.checkValidObj();
            try
                value = obj.interface.FunctionBandSpan;
            catch e
                obj.interpretError(e);
            end
        end
		function set.FunctionBandSpan(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'FunctionBandSpan');
            try
                obj.interface.FunctionBandSpan = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% LinesEnabled property access methods
        function value = get.LinesEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.LinesEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.LinesEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'LinesEnabled');
            try
                obj.interface.LinesEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% PeakTableEnabled property access methods
        function value = get.PeakTableEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.PeakTableEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.PeakTableEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'PeakTableEnabled');
            try
                obj.interface.PeakTableEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% XAxisScale property access methods
        function value = get.XAxisScale(obj)
            obj.checkValidObj();
            try
                value = obj.interface.XAxisScale;
            catch e
                obj.interpretError(e);
            end
        end
		function set.XAxisScale(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.XAxisScale = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% XAxisScaleAutoEnabled property access methods
        function value = get.XAxisScaleAutoEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.XAxisScaleAutoEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.XAxisScaleAutoEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'XAxisScaleAutoEnabled');
            try
                obj.interface.XAxisScaleAutoEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% TableEnabled property access methods
        function value = get.TableEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.TableEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.TableEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'TableEnabled');
            try
                obj.interface.TableEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% TraceAutoEnabled property access methods
        function value = get.TraceAutoEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.TraceAutoEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.TraceAutoEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'TraceAutoEnabled');
            try
                obj.interface.TraceAutoEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Y property access methods
        function value = get.Y(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Y;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Y(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'Y');
            try
                obj.interface.Y = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% NDBPoints property access methods
        function value = get.NDBPoints(obj)
            obj.checkValidObj();
            if isempty(obj.NDBPoints)
                try
                    obj.NDBPoints = instrument.driver.AgXSAn.DeviceSpecific.SA.Marker.NDBPoints(obj.interface.NDBPoints);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.NDBPoints;
        end

        %% ContinuousPeakSearchEnabled property access methods
        function value = get.ContinuousPeakSearchEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.ContinuousPeakSearchEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.ContinuousPeakSearchEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'ContinuousPeakSearchEnabled');
            try
                obj.interface.ContinuousPeakSearchEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% FunctionBandSpanAutoEnabled property access methods
        function value = get.FunctionBandSpanAutoEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.FunctionBandSpanAutoEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.FunctionBandSpanAutoEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'FunctionBandSpanAutoEnabled');
            try
                obj.interface.FunctionBandSpanAutoEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% ThresholdEnabled property access methods
        function value = get.ThresholdEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.ThresholdEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.ThresholdEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'ThresholdEnabled');
            try
                obj.interface.ThresholdEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% PeakExcursionEnabled property access methods
        function value = get.PeakExcursionEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.PeakExcursionEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.PeakExcursionEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'PeakExcursionEnabled');
            try
                obj.interface.PeakExcursionEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% PeakTableReadoutMode property access methods
        function value = get.PeakTableReadoutMode(obj)
            obj.checkValidObj();
            try
                value = obj.interface.PeakTableReadoutMode;
            catch e
                obj.interpretError(e);
            end
        end
		function set.PeakTableReadoutMode(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.PeakTableReadoutMode = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% PeakSortMode property access methods
        function value = get.PeakSortMode(obj)
            obj.checkValidObj();
            try
                value = obj.interface.PeakSortMode;
            catch e
                obj.interpretError(e);
            end
        end
		function set.PeakSortMode(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.PeakSortMode = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% PeakSearchMode property access methods
        function value = get.PeakSearchMode(obj)
            obj.checkValidObj();
            try
                value = obj.interface.PeakSearchMode;
            catch e
                obj.interpretError(e);
            end
        end
		function set.PeakSearchMode(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.PeakSearchMode = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% XAxisTracePoints property access methods
        function value = get.XAxisTracePoints(obj)
            obj.checkValidObj();
            try
                value = obj.interface.XAxisTracePoints;
            catch e
                obj.interpretError(e);
            end
        end
		function set.XAxisTracePoints(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'XAxisTracePoints');
            try
                obj.interface.XAxisTracePoints = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% MeasureAtMarker property access methods
        function value = get.MeasureAtMarker(obj)
            obj.checkValidObj();
            if isempty(obj.MeasureAtMarker)
                try
                    obj.MeasureAtMarker = instrument.driver.AgXSAn.DeviceSpecific.SA.Marker.MeasureAtMarker(obj.interface.MeasureAtMarker);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.MeasureAtMarker;
        end

    end

    %% Public Methods
    methods

        function SetInstrumentFromMarker(obj,InstrumentSetting)
            %SETINSTRUMENTFROMMARKER This function makes the Active Marker frequency to be the start, stop, or center frequency. It can also make the active marker amplitude to be the reference level.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            try
                obj.interface.SetInstrumentFromMarker(int32(InstrumentSetting));
            catch e
                obj.interpretError(e);
            end
        end

        function [returnReferencePosition,returnReferenceAmplitude] = QueryReference(obj)
            %QUERYREFERENCE This function returns the horizontal position and the marker amplitude level of the reference marker when the active marker is a delta marker.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                [returnReferencePosition,returnReferenceAmplitude] = obj.interface.QueryReference(double(0),double(0));
            catch e
                obj.interpretError(e);
            end
        end

        function [returnMarkerPosition,returnMarkerAmplitude] = Query(obj)
            %QUERY This function returns the horizontal position and the marker amplitude level of the Active Marker.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                [returnMarkerPosition,returnMarkerAmplitude] = obj.interface.Query(double(0),double(0));
            catch e
                obj.interpretError(e);
            end
        end

        function Search(obj,SearchType)
            %SEARCH This function specifies the type of marker search and performs the search.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            try
                obj.interface.Search(int32(SearchType));
            catch e
                obj.interpretError(e);
            end
        end

        function MakeDelta(obj,DeltaMarker)
            %MAKEDELTA This function specifies whether the active marker is a delta marker.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            DeltaMarker = obj.checkScalarBoolArg(DeltaMarker,'DeltaMarker');
            try
                obj.interface.MakeDelta(logical(DeltaMarker));
            catch e
                obj.interpretError(e);
            end
        end

        function DisableAll(obj)
            %DISABLEALL This function turns off all the markers.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.DisableAll();
            catch e
                obj.interpretError(e);
            end
        end

        function ConfigureSearch(obj,PeakExcursion,MarkerThreshold)
            %CONFIGURESEARCH This function configures the marker peak excursion and marker threshold attribute values.
            
            obj.checkValidObj();
			error(nargchk(3,3,nargin,'struct'))
            PeakExcursion = obj.checkScalarDoubleArg(PeakExcursion,'PeakExcursion');
            MarkerThreshold = obj.checkScalarDoubleArg(MarkerThreshold,'MarkerThreshold');
            try
                obj.interface.ConfigureSearch(double(PeakExcursion),double(MarkerThreshold));
            catch e
                obj.interpretError(e);
            end
        end

        function ConfigureEnabled(obj,Enabled,Trace)
            %CONFIGUREENABLED This function enables/disables the active marker on the specified trace.
            
            obj.checkValidObj();
			error(nargchk(3,3,nargin,'struct'))
            Enabled = obj.checkScalarBoolArg(Enabled,'Enabled');
            Trace = obj.checkScalarInt32Arg(Trace,'Trace');
            try
                obj.interface.ConfigureEnabled(logical(Enabled),int32(Trace));
            catch e
                obj.interpretError(e);
            end
        end

    end

end
