classdef Waveform < instrument.ivicom.Interface
    %WAVEFORM AgXSAnBasic Waveform interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Waveform(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);

            %% Initialize properties
            try
                obj.Average = instrument.driver.AgXSAnBasic.DeviceSpecific.Waveform.Average(obj.interface.Average);
            catch %#ok<CTCH>
            end

            try
                obj.Bandwidth = instrument.driver.AgXSAnBasic.DeviceSpecific.Waveform.Bandwidth(obj.interface.Bandwidth);
            catch %#ok<CTCH>
            end

            try
                obj.Marker = instrument.driver.AgXSAnBasic.DeviceSpecific.Waveform.Marker(obj.interface.Marker);
            catch %#ok<CTCH>
            end

            try
                obj.Traces = instrument.driver.AgXSAnBasic.DeviceSpecific.Waveform.Traces(obj.interface.Traces);
            catch %#ok<CTCH>
            end

            try
                obj.Filter = instrument.driver.AgXSAnBasic.DeviceSpecific.Waveform.Filter(obj.interface.Filter);
            catch %#ok<CTCH>
            end

            try
                obj.FastCapture = instrument.driver.AgXSAnBasic.DeviceSpecific.Waveform.FastCapture(obj.interface.FastCapture);
            catch %#ok<CTCH>
            end

        end
        
        function delete(obj)
            obj.Average = [];
            obj.Bandwidth = [];
            obj.Marker = [];
            obj.Traces = [];
            obj.Filter = [];
            obj.FastCapture = [];
        end

    end
    
    %% Public Properties
    properties

        %SWEEPTIME Specifies how long the measurement is performed. X Scale only changes the representation of the display.
        SweepTime

        %IFGAIN Optimize IF Gain for specific signals or signal levels.
        IFGain

        %TRIGGERSOURCE Select the trigger source used to control the data acquisitions.
        TriggerSource

        %SAMPLERATE The arbitrary sample rate for the acquired data to be processed.
        SampleRate

    end

    %% Public Read Only Properties
    properties (SetAccess = private)

        %APERTURE ReadOnly The waveform sample period (aperture) based on current resolution bandwidth, filter type, and decimation factor. Sample rate is the reciprocal of period. Read Only.
        Aperture

        %AVERAGE Pointer to the IAgXSAnBasicWaveformAverage interface. Read Only.
        Average

        %BANDWIDTH Pointer to the IAgXSAnBasicWaveformBandwidth interface. Read Only.
        Bandwidth

        %MARKER Pointer to the IAgXSAnBasicWaveformMarker interface. Read Only.
        Marker

        %TRACES Pointer to the IAgXSAnBasicWaveformTraces interface. Read Only.
        Traces

        %FILTER Pointer to the IAgXSAnBasicSpectrumFilter interface. Read Only.
        Filter

        %FASTCAPTURE Pointer to the IAgXSAnBasicSpectrumTracesFastCapture interface. Read Only.
        FastCapture

    end

    %% Property access methods
    methods

        %% Aperture property access methods
        function value = get.Aperture(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Aperture;
            catch e
                obj.interpretError(e);
            end
        end

        %% Average property access methods
        function value = get.Average(obj)
            obj.checkValidObj();
            if isempty(obj.Average)
                try
                    obj.Average = instrument.driver.AgXSAnBasic.DeviceSpecific.Waveform.Average(obj.interface.Average);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Average;
        end

        %% Bandwidth property access methods
        function value = get.Bandwidth(obj)
            obj.checkValidObj();
            if isempty(obj.Bandwidth)
                try
                    obj.Bandwidth = instrument.driver.AgXSAnBasic.DeviceSpecific.Waveform.Bandwidth(obj.interface.Bandwidth);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Bandwidth;
        end

        %% Marker property access methods
        function value = get.Marker(obj)
            obj.checkValidObj();
            if isempty(obj.Marker)
                try
                    obj.Marker = instrument.driver.AgXSAnBasic.DeviceSpecific.Waveform.Marker(obj.interface.Marker);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Marker;
        end

        %% SweepTime property access methods
        function value = get.SweepTime(obj)
            obj.checkValidObj();
            try
                value = obj.interface.SweepTime;
            catch e
                obj.interpretError(e);
            end
        end
		function set.SweepTime(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'SweepTime');
            try
                obj.interface.SweepTime = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Traces property access methods
        function value = get.Traces(obj)
            obj.checkValidObj();
            if isempty(obj.Traces)
                try
                    obj.Traces = instrument.driver.AgXSAnBasic.DeviceSpecific.Waveform.Traces(obj.interface.Traces);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Traces;
        end

        %% IFGain property access methods
        function value = get.IFGain(obj)
            obj.checkValidObj();
            try
                value = obj.interface.IFGain;
            catch e
                obj.interpretError(e);
            end
        end
		function set.IFGain(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.IFGain = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Filter property access methods
        function value = get.Filter(obj)
            obj.checkValidObj();
            if isempty(obj.Filter)
                try
                    obj.Filter = instrument.driver.AgXSAnBasic.DeviceSpecific.Waveform.Filter(obj.interface.Filter);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Filter;
        end

        %% TriggerSource property access methods
        function value = get.TriggerSource(obj)
            obj.checkValidObj();
            try
                value = obj.interface.TriggerSource;
            catch e
                obj.interpretError(e);
            end
        end
		function set.TriggerSource(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.TriggerSource = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% SampleRate property access methods
        function value = get.SampleRate(obj)
            obj.checkValidObj();
            try
                value = obj.interface.SampleRate;
            catch e
                obj.interpretError(e);
            end
        end
		function set.SampleRate(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'SampleRate');
            try
                obj.interface.SampleRate = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% FastCapture property access methods
        function value = get.FastCapture(obj)
            obj.checkValidObj();
            if isempty(obj.FastCapture)
                try
                    obj.FastCapture = instrument.driver.AgXSAnBasic.DeviceSpecific.Waveform.FastCapture(obj.interface.FastCapture);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.FastCapture;
        end

    end

    %% Public Methods
    methods

        function Configure(obj)
            %CONFIGURE Restores all the measurement parameters to their default values.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.Configure();
            catch e
                obj.interpretError(e);
            end
        end

    end

end
