classdef Marker < instrument.ivicom.Interface
    %MARKER IAgXSAnSAPowerStatisticsMarker interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Marker(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %ACTIVEMARKER Currently active marker.
        ActiveMarker

        %COUPLEENABLED Turns On or Off the marker coupling feature. When this function is On, moving any marker causes an equal X axis movement of every other marker which is not Off. By ?equal X axis movement? it is meant that the system preserves the difference between each marker?s X axis value (in the fundamental x-axis units of the trace that marker is on) and the X axis value of the marker being moved (in the same fundamental x-axis units).
        CoupleEnabled

        %DELTAREFERENCE Selects the marker that the active marker will be relative to (its reference marker).  The marker must be a Delta marker to make this property relevant.
        DeltaReference

        %ENABLED Turns the marker on or off.
        Enabled

        %POSITION Sets the marker X position to a specified point on the X axis in the current X-axis units (frequency or time).  
        Position

        %TRACE Sets/Gets which trace the selected marker will be placed on.
        Trace

        %TYPE Sets/Gets the control mode of the active marker.
        Type

        %TRACEPOINTSPOSITION Sets the marker X position to a specified point on the X axis in the current X-axis units (frequency or time).
        TracePointsPosition

    end

    %% Public Read Only Properties
    properties (SetAccess = private)

        %AMPLITUDE Returns the marker Y axis value in the current marker Y axis unit. Read Only.
        Amplitude

        %COUNT Number of markers. Read Only.
        Count

        %FUNCTIONRESULT Queries the result of the currently active marker function. Read Only.
        FunctionResult

    end

    %% Property access methods
    methods

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

        %% FunctionResult property access methods
        function value = get.FunctionResult(obj)
            obj.checkValidObj();
            try
                value = obj.interface.FunctionResult;
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

        %% TracePointsPosition property access methods
        function value = get.TracePointsPosition(obj)
            obj.checkValidObj();
            try
                value = obj.interface.TracePointsPosition;
            catch e
                obj.interpretError(e);
            end
        end
		function set.TracePointsPosition(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'TracePointsPosition');
            try
                obj.interface.TracePointsPosition = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

    %% Public Methods
    methods

        function ConfigureEnabled(obj,Enabled,Trace)
            %CONFIGUREENABLED Enables or disables the specified trace.
            
            obj.checkValidObj();
			error(nargchk(3,3,nargin,'struct'))
            Enabled = obj.checkScalarBoolArg(Enabled,'Enabled');
            try
                obj.interface.ConfigureEnabled(logical(Enabled),int32(Trace));
            catch e
                obj.interpretError(e);
            end
        end

        function DisableAll(obj)
            %DISABLEALL Turns all active markers off., including markers used for signal track.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.DisableAll();
            catch e
                obj.interpretError(e);
            end
        end

        function [returnpPosition,returnpAmplitude] = Query(obj)
            %QUERY Gets the marker position and amplitude.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                [returnpPosition,returnpAmplitude] = obj.interface.Query(double(0),double(0));
            catch e
                obj.interpretError(e);
            end
        end

    end

end
