classdef Marker2 < instrument.ivicom.Interface
    %MARKER2 IAgXSAnBasicSpectrumMarker2 interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Marker2(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);

            %% Initialize properties
            try
                obj.Peak = instrument.driver.AgXSAnBasic.DeviceSpecific.Spectrum2.Marker2.Peak(obj.interface.Peak);
            catch %#ok<CTCH>
            end

        end
        
        function delete(obj)
            obj.Peak = [];
        end

    end
    
    %% Public Properties
    properties

        %DELTAREFERENCE Selects the desired marker. The selected marker will be relative to its reference marker.
        DeltaReference

        %FUNCTIONBANDLEFT Sets the left edge frequency for the band of the selected marker.
        FunctionBandLeft

        %FUNCTIONBANDRIGHT Sets the right edge frequency for the band of the selected marker.
        FunctionBandRight

        %FUNCTIONBANDSPAN Sets the width of the span for the selected marker.
        FunctionBandSpan

        %ACTIVEMARKER Currently active marker.
        ActiveMarker

        %ENABLED Enables or disables the Active marker.
        Enabled

        %FUNCTION Specifies the marker control mode.
        Function

        %POSITION Specifies the marker X Axis value in the current marker X Axis Scale unit.
        Position

        %TRACE Assigns the specified marker to the designated trace.
        Trace

        %TYPE Selects the type of markers that you want to activate.
        Type

    end

    %% Public Read Only Properties
    properties (SetAccess = private)

        %AMPLITUDE ReadOnly The current Y value for the designated marker on its assigned trace. The value is in the Y-axis units for the trace (which is often dBm). Read Only.
        Amplitude

        %COUNT ReadOnly Number of markers. Read Only.
        Count

        %PEAK Pointer to the IAgXSAnBasicSpectrumMarkerPeak interface. Read Only.
        Peak

    end

    %% Property access methods
    methods

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

        %% Count property access methods
        function value = get.Count(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Count;
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
            try
                obj.interface.Trace = newValue;
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

        %% Peak property access methods
        function value = get.Peak(obj)
            obj.checkValidObj();
            if isempty(obj.Peak)
                try
                    obj.Peak = instrument.driver.AgXSAnBasic.DeviceSpecific.Spectrum2.Marker2.Peak(obj.interface.Peak);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Peak;
        end

    end

    %% Public Methods
    methods

        function Search(obj,SearchType)
            %SEARCH Places the selected marker on the highest or lowest point on the trace that is assigned to that particular marker number.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            try
                obj.interface.Search(int32(SearchType));
            catch e
                obj.interpretError(e);
            end
        end

        function [returnpPosition,returnpAmplitude] = Query(obj,pPosition,pAmplitude)
            %QUERY Retrieves the position (X value) and amplitude (Y value) of the designated marker.
            
            obj.checkValidObj();
			error(nargchk(3,3,nargin,'struct'))
            pPosition = obj.checkScalarDoubleArg(pPosition,'pPosition');
            pAmplitude = obj.checkScalarDoubleArg(pAmplitude,'pAmplitude');
            try
                [returnpPosition,returnpAmplitude] = obj.interface.Query(double(pPosition),double(pAmplitude));
            catch e
                obj.interpretError(e);
            end
        end

        function DisableAll(obj)
            %DISABLEALL Turns off all markers on all the traces in the specified measurement.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.DisableAll();
            catch e
                obj.interpretError(e);
            end
        end

        function ConfigureEnabled(obj,Enabled,Trace)
            %CONFIGUREENABLED Turns the selected marker on or off and assigns it to the designated trace.
            
            obj.checkValidObj();
			error(nargchk(3,3,nargin,'struct'))
            Enabled = obj.checkScalarBoolArg(Enabled,'Enabled');
            try
                obj.interface.ConfigureEnabled(logical(Enabled),int32(Trace));
            catch e
                obj.interpretError(e);
            end
        end

    end

end
