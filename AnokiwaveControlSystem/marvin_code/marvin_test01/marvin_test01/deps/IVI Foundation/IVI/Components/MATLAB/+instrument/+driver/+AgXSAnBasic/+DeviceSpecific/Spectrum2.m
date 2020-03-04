classdef Spectrum2 < instrument.ivicom.Interface
    %SPECTRUM2 IAgXSAnBasicSpectrum2 interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Spectrum2(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);

            %% Initialize properties
            try
                obj.Display = instrument.driver.AgXSAnBasic.DeviceSpecific.Spectrum2.Display(obj.interface.Display);
            catch %#ok<CTCH>
            end

            try
                obj.Average2 = instrument.driver.AgXSAnBasic.DeviceSpecific.Spectrum2.Average2(obj.interface.Average2);
            catch %#ok<CTCH>
            end

            try
                obj.Filter2 = instrument.driver.AgXSAnBasic.DeviceSpecific.Spectrum2.Filter2(obj.interface.Filter2);
            catch %#ok<CTCH>
            end

            try
                obj.Marker2 = instrument.driver.AgXSAnBasic.DeviceSpecific.Spectrum2.Marker2(obj.interface.Marker2);
            catch %#ok<CTCH>
            end

            try
                obj.Average = instrument.driver.AgXSAnBasic.DeviceSpecific.Spectrum2.Average(obj.interface.Average);
            catch %#ok<CTCH>
            end

            try
                obj.Bandwidth = instrument.driver.AgXSAnBasic.DeviceSpecific.Spectrum2.Bandwidth(obj.interface.Bandwidth);
            catch %#ok<CTCH>
            end

            try
                obj.FFT = instrument.driver.AgXSAnBasic.DeviceSpecific.Spectrum2.FFT(obj.interface.FFT);
            catch %#ok<CTCH>
            end

            try
                obj.Marker = instrument.driver.AgXSAnBasic.DeviceSpecific.Spectrum2.Marker(obj.interface.Marker);
            catch %#ok<CTCH>
            end

            try
                obj.Traces = instrument.driver.AgXSAnBasic.DeviceSpecific.Spectrum2.Traces(obj.interface.Traces);
            catch %#ok<CTCH>
            end

            try
                obj.Filter = instrument.driver.AgXSAnBasic.DeviceSpecific.Spectrum2.Filter(obj.interface.Filter);
            catch %#ok<CTCH>
            end

            try
                obj.FastCapture = instrument.driver.AgXSAnBasic.DeviceSpecific.Spectrum2.FastCapture(obj.interface.FastCapture);
            catch %#ok<CTCH>
            end

        end
        
        function delete(obj)
            obj.Display = [];
            obj.Average2 = [];
            obj.Filter2 = [];
            obj.Marker2 = [];
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

        %IFGAINAUTOENABLED Enable or disable the IF Gain function.
        IFGainAutoEnabled

        %LOMIXINGTYPE Enables to alternate between mixing modes for the Local Oscillator (LO).
        LOMixingType

        %FREQUENCYSYNTHESISSTATE Selects the LO (local oscillator) phase noise behavior for various desired operating conditions.
        FrequencySynthesisState

        %ADCDITHERAUTOENABLED Sets ADC dithering to automatically select whether dithering is needed.
        ADCDitherAutoEnabled

        %ADCDITHERENABLED Enable or disable the dither function.
        ADCDitherEnabled

        %IFGAINOFFSET The IF Gain offset.
        IFGainOffset

        %TRACEENABLED Toggles the instantaneous trace display between On and Off.
        TraceEnabled

        %FREQUENCYSYNTHESISAUTOENABLED Selects the LO (local oscillator) phase noise behavior for various desired operating conditions.
        FrequencySynthesisAutoEnabled

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

        %DISPLAY Pointer to the IAgXSAnBasicSpectrum2Display interface. Read Only.
        Display

        %AVERAGE2 Pointer to the IAgXSAnBasicSpectrumAverage interface. Read Only.
        Average2

        %FILTER2 Pointer to the IAgXSAnBasicSpectrumFilter interface. Read Only.
        Filter2

        %MARKER2 Pointer to the IAgXSAnBasicSpectrumMarker interface. Read Only.
        Marker2

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

        %% Display property access methods
        function value = get.Display(obj)
            obj.checkValidObj();
            if isempty(obj.Display)
                try
                    obj.Display = instrument.driver.AgXSAnBasic.DeviceSpecific.Spectrum2.Display(obj.interface.Display);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Display;
        end

        %% IFGainAutoEnabled property access methods
        function value = get.IFGainAutoEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.IFGainAutoEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.IFGainAutoEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'IFGainAutoEnabled');
            try
                obj.interface.IFGainAutoEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Average2 property access methods
        function value = get.Average2(obj)
            obj.checkValidObj();
            if isempty(obj.Average2)
                try
                    obj.Average2 = instrument.driver.AgXSAnBasic.DeviceSpecific.Spectrum2.Average2(obj.interface.Average2);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Average2;
        end

        %% Filter2 property access methods
        function value = get.Filter2(obj)
            obj.checkValidObj();
            if isempty(obj.Filter2)
                try
                    obj.Filter2 = instrument.driver.AgXSAnBasic.DeviceSpecific.Spectrum2.Filter2(obj.interface.Filter2);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Filter2;
        end

        %% Marker2 property access methods
        function value = get.Marker2(obj)
            obj.checkValidObj();
            if isempty(obj.Marker2)
                try
                    obj.Marker2 = instrument.driver.AgXSAnBasic.DeviceSpecific.Spectrum2.Marker2(obj.interface.Marker2);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Marker2;
        end

        %% LOMixingType property access methods
        function value = get.LOMixingType(obj)
            obj.checkValidObj();
            try
                value = obj.interface.LOMixingType;
            catch e
                obj.interpretError(e);
            end
        end
		function set.LOMixingType(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.LOMixingType = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% FrequencySynthesisState property access methods
        function value = get.FrequencySynthesisState(obj)
            obj.checkValidObj();
            try
                value = obj.interface.FrequencySynthesisState;
            catch e
                obj.interpretError(e);
            end
        end
		function set.FrequencySynthesisState(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.FrequencySynthesisState = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% ADCDitherAutoEnabled property access methods
        function value = get.ADCDitherAutoEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.ADCDitherAutoEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.ADCDitherAutoEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'ADCDitherAutoEnabled');
            try
                obj.interface.ADCDitherAutoEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% ADCDitherEnabled property access methods
        function value = get.ADCDitherEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.ADCDitherEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.ADCDitherEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'ADCDitherEnabled');
            try
                obj.interface.ADCDitherEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% IFGainOffset property access methods
        function value = get.IFGainOffset(obj)
            obj.checkValidObj();
            try
                value = obj.interface.IFGainOffset;
            catch e
                obj.interpretError(e);
            end
        end
		function set.IFGainOffset(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'IFGainOffset');
            try
                obj.interface.IFGainOffset = newValue;
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

        %% FrequencySynthesisAutoEnabled property access methods
        function value = get.FrequencySynthesisAutoEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.FrequencySynthesisAutoEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.FrequencySynthesisAutoEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'FrequencySynthesisAutoEnabled');
            try
                obj.interface.FrequencySynthesisAutoEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Average property access methods
        function value = get.Average(obj)
            obj.checkValidObj();
            if isempty(obj.Average)
                try
                    obj.Average = instrument.driver.AgXSAnBasic.DeviceSpecific.Spectrum2.Average(obj.interface.Average);
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
                    obj.Bandwidth = instrument.driver.AgXSAnBasic.DeviceSpecific.Spectrum2.Bandwidth(obj.interface.Bandwidth);
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
                    obj.FFT = instrument.driver.AgXSAnBasic.DeviceSpecific.Spectrum2.FFT(obj.interface.FFT);
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
                    obj.Marker = instrument.driver.AgXSAnBasic.DeviceSpecific.Spectrum2.Marker(obj.interface.Marker);
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
                    obj.Traces = instrument.driver.AgXSAnBasic.DeviceSpecific.Spectrum2.Traces(obj.interface.Traces);
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
                    obj.Filter = instrument.driver.AgXSAnBasic.DeviceSpecific.Spectrum2.Filter(obj.interface.Filter);
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
                    obj.FastCapture = instrument.driver.AgXSAnBasic.DeviceSpecific.Spectrum2.FastCapture(obj.interface.FastCapture);
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
