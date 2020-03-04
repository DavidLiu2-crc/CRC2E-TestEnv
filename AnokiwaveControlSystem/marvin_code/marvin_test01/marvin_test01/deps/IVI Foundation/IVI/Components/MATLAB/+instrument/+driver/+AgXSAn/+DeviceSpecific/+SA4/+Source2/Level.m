classdef Level < instrument.ivicom.Interface
    %LEVEL IAgXSAn3SourceLevel interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Level(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %AMPLITUDE The power level in dBm of the selected source.
        Amplitude

        %POWERSWEEP The Power Sweep. It is useful for measuring saturation behavior in a test device, such as a power amplifier.
        PowerSweep

        %POWERSWEEPENABLED Enable or disable the power sweep.
        PowerSweepEnabled

        %AMPLITUDEOFFSET The Amplitude Offset. It Offsets the displayed power of the source in the Amplitude parameter.
        AmplitudeOffset

        %AMPLITUDESTEP The step size associated with the Source Amplitude.
        AmplitudeStep

        %AMPLITUDESTEPAUTOENABLED Enable or disable the auto selection of amplitude step.
        AmplitudeStepAutoEnabled

        %TRACKDELAY The delay in seconds of the tracking generator oscillator.
        TrackDelay

    end

    %% Property access methods
    methods

        %% Amplitude property access methods
        function value = get.Amplitude(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Amplitude;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Amplitude(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'Amplitude');
            try
                obj.interface.Amplitude = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% PowerSweep property access methods
        function value = get.PowerSweep(obj)
            obj.checkValidObj();
            try
                value = obj.interface.PowerSweep;
            catch e
                obj.interpretError(e);
            end
        end
		function set.PowerSweep(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'PowerSweep');
            try
                obj.interface.PowerSweep = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% PowerSweepEnabled property access methods
        function value = get.PowerSweepEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.PowerSweepEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.PowerSweepEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'PowerSweepEnabled');
            try
                obj.interface.PowerSweepEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% AmplitudeOffset property access methods
        function value = get.AmplitudeOffset(obj)
            obj.checkValidObj();
            try
                value = obj.interface.AmplitudeOffset;
            catch e
                obj.interpretError(e);
            end
        end
		function set.AmplitudeOffset(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'AmplitudeOffset');
            try
                obj.interface.AmplitudeOffset = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% AmplitudeStep property access methods
        function value = get.AmplitudeStep(obj)
            obj.checkValidObj();
            try
                value = obj.interface.AmplitudeStep;
            catch e
                obj.interpretError(e);
            end
        end
		function set.AmplitudeStep(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'AmplitudeStep');
            try
                obj.interface.AmplitudeStep = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% AmplitudeStepAutoEnabled property access methods
        function value = get.AmplitudeStepAutoEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.AmplitudeStepAutoEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.AmplitudeStepAutoEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'AmplitudeStepAutoEnabled');
            try
                obj.interface.AmplitudeStepAutoEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% TrackDelay property access methods
        function value = get.TrackDelay(obj)
            obj.checkValidObj();
            try
                value = obj.interface.TrackDelay;
            catch e
                obj.interpretError(e);
            end
        end
		function set.TrackDelay(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'TrackDelay');
            try
                obj.interface.TrackDelay = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

    %% Public Methods
    methods

        function SetTrackingPeak(obj)
            %SETTRACKINGPEAK Activates a routine that adjusts the delay of the analyzer's tuned frequency with respect to the tracking generator output in order to guarantee that the measurement is peaked in amplitude.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.SetTrackingPeak();
            catch e
                obj.interpretError(e);
            end
        end

    end

end
