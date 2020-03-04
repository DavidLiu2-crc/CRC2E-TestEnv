classdef Spectrum < instrument.ivicom.Interface
    %SPECTRUM AgXSAnBasic Spectrum interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Spectrum(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);

            %% Initialize properties
            try
                obj.Average = instrument.driver.AgXSAnBasic.DeviceSpecific.Spectrum.Average(obj.interface.Average);
            catch %#ok<CTCH>
            end

            try
                obj.Bandwidth = instrument.driver.AgXSAnBasic.DeviceSpecific.Spectrum.Bandwidth(obj.interface.Bandwidth);
            catch %#ok<CTCH>
            end

            try
                obj.FFT = instrument.driver.AgXSAnBasic.DeviceSpecific.Spectrum.FFT(obj.interface.FFT);
            catch %#ok<CTCH>
            end

            try
                obj.Marker = instrument.driver.AgXSAnBasic.DeviceSpecific.Spectrum.Marker(obj.interface.Marker);
            catch %#ok<CTCH>
            end

            try
                obj.Traces = instrument.driver.AgXSAnBasic.DeviceSpecific.Spectrum.Traces(obj.interface.Traces);
            catch %#ok<CTCH>
            end

            try
                obj.Filter = instrument.driver.AgXSAnBasic.DeviceSpecific.Spectrum.Filter(obj.interface.Filter);
            catch %#ok<CTCH>
            end

            try
                obj.FastCapture = instrument.driver.AgXSAnBasic.DeviceSpecific.Spectrum.FastCapture(obj.interface.FastCapture);
            catch %#ok<CTCH>
            end

        end
        
        function delete(obj)
            obj.Average = [];
            obj.Bandwidth = [];
            obj.FFT = [];
            obj.Marker = [];
            obj.Traces = [];
            obj.Filter = [];
            obj.FastCapture = [];
        end

    end
    
    %% Public Properties
    properties

        %FREQUENCYSPAN The frequency span.
        FrequencySpan

        %IFGAIN Optimize IF Gain for specific signals or signal levels.
        IFGain

        %TRIGGERSOURCE Select the trigger source used to control the data acquisitions.
        TriggerSource

        %IQDELTAENABLED Enable or disable the I/Q Magnitude and Phase Delta Results.
        IQDeltaEnabled

    end

    %% Public Read Only Properties
    properties (SetAccess = private)

        %AVERAGE Pointer to the IAgXSAnBasicSpectrumAverage interface. Read Only.
        Average

        %BANDWIDTH Pointer to the IAgXSAnBasicSpectrumBandwidth interface. Read Only.
        Bandwidth

        %FFT Pointer to the IAgXSAnBasicSpectrumFFT interface. Read Only.
        FFT

        %MARKER Pointer to the IAgXSAnBasicSpectrumMarker interface. Read Only.
        Marker

        %TRACES Pointer to the IAgXSAnBasicSpectrumTraces interface. Read Only.
        Traces

        %FILTER Pointer to the IAgXSAnBasicSpectrumFilter interface. Read Only.
        Filter

        %SAMPLERATE ReadOnly The sample rate of the acquired data. Read Only.
        SampleRate

        %FASTCAPTURE Pointer to the IAgXSAnBasicSpectrumTracesFastCapture interface. Read Only.
        FastCapture

    end

    %% Property access methods
    methods

        %% Average property access methods
        function value = get.Average(obj)
            obj.checkValidObj();
            if isempty(obj.Average)
                try
                    obj.Average = instrument.driver.AgXSAnBasic.DeviceSpecific.Spectrum.Average(obj.interface.Average);
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
                    obj.Bandwidth = instrument.driver.AgXSAnBasic.DeviceSpecific.Spectrum.Bandwidth(obj.interface.Bandwidth);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Bandwidth;
        end

        %% FFT property access methods
        function value = get.FFT(obj)
            obj.checkValidObj();
            if isempty(obj.FFT)
                try
                    obj.FFT = instrument.driver.AgXSAnBasic.DeviceSpecific.Spectrum.FFT(obj.interface.FFT);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.FFT;
        end

        %% FrequencySpan property access methods
        function value = get.FrequencySpan(obj)
            obj.checkValidObj();
            try
                value = obj.interface.FrequencySpan;
            catch e
                obj.interpretError(e);
            end
        end
		function set.FrequencySpan(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'FrequencySpan');
            try
                obj.interface.FrequencySpan = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Marker property access methods
        function value = get.Marker(obj)
            obj.checkValidObj();
            if isempty(obj.Marker)
                try
                    obj.Marker = instrument.driver.AgXSAnBasic.DeviceSpecific.Spectrum.Marker(obj.interface.Marker);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Marker;
        end

        %% Traces property access methods
        function value = get.Traces(obj)
            obj.checkValidObj();
            if isempty(obj.Traces)
                try
                    obj.Traces = instrument.driver.AgXSAnBasic.DeviceSpecific.Spectrum.Traces(obj.interface.Traces);
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
                    obj.Filter = instrument.driver.AgXSAnBasic.DeviceSpecific.Spectrum.Filter(obj.interface.Filter);
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

        %% FastCapture property access methods
        function value = get.FastCapture(obj)
            obj.checkValidObj();
            if isempty(obj.FastCapture)
                try
                    obj.FastCapture = instrument.driver.AgXSAnBasic.DeviceSpecific.Spectrum.FastCapture(obj.interface.FastCapture);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.FastCapture;
        end

        %% IQDeltaEnabled property access methods
        function value = get.IQDeltaEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.IQDeltaEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.IQDeltaEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'IQDeltaEnabled');
            try
                obj.interface.IQDeltaEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

    %% Public Methods
    methods

        function Configure(obj)
            %CONFIGURE Returns all measurement local parameters to the factory default values.
            
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
