classdef Waveform2 < instrument.ivicom.Interface
    %WAVEFORM2 IAgXSAnBasicWaveform2 interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Waveform2(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);

            %% Initialize properties
            try
                obj.Display = instrument.driver.AgXSAnBasic.DeviceSpecific.Waveform2.Display(obj.interface.Display);
            catch %#ok<CTCH>
            end

            try
                obj.Marker2 = instrument.driver.AgXSAnBasic.DeviceSpecific.Waveform2.Marker2(obj.interface.Marker2);
            catch %#ok<CTCH>
            end

            try
                obj.Filter2 = instrument.driver.AgXSAnBasic.DeviceSpecific.Waveform2.Filter2(obj.interface.Filter2);
            catch %#ok<CTCH>
            end

            try
                obj.Average2 = instrument.driver.AgXSAnBasic.DeviceSpecific.Waveform2.Average2(obj.interface.Average2);
            catch %#ok<CTCH>
            end

            try
                obj.Average = instrument.driver.AgXSAnBasic.DeviceSpecific.Waveform2.Average(obj.interface.Average);
            catch %#ok<CTCH>
            end

            try
                obj.Bandwidth = instrument.driver.AgXSAnBasic.DeviceSpecific.Waveform2.Bandwidth(obj.interface.Bandwidth);
            catch %#ok<CTCH>
            end

            try
                obj.Marker = instrument.driver.AgXSAnBasic.DeviceSpecific.Waveform2.Marker(obj.interface.Marker);
            catch %#ok<CTCH>
            end

            try
                obj.Traces = instrument.driver.AgXSAnBasic.DeviceSpecific.Waveform2.Traces(obj.interface.Traces);
            catch %#ok<CTCH>
            end

            try
                obj.Filter = instrument.driver.AgXSAnBasic.DeviceSpecific.Waveform2.Filter(obj.interface.Filter);
            catch %#ok<CTCH>
            end

            try
                obj.FastCapture = instrument.driver.AgXSAnBasic.DeviceSpecific.Waveform2.FastCapture(obj.interface.FastCapture);
            catch %#ok<CTCH>
            end

        end
        
        function delete(obj)
            obj.Display = [];
            obj.Marker2 = [];
            obj.Filter2 = [];
            obj.Average2 = [];
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

        %ADCDITHERAUTOENABLED Sets ADC dithering to automatically select whether dithering is needed.
        ADCDitherAutoEnabled

        %IFGAINOFFSET The IF Gain offset.
        IFGainOffset

        %FREQUENCYSYNTHESISSTATE Selects the LO (local oscillator) phase noise behavior for various desired operating conditions.
        FrequencySynthesisState

        %FREQUENCYSYNTHESISSTATEAUTOENABLED Selects the LO (local oscillator) phase noise behavior to optimize dynamic range and speed for various instrument operating conditions.
        FrequencySynthesisStateAutoEnabled

        %LOMIXINGTYPE Enables to alternate between mixing modes for the Local Oscillator (LO).
        LOMixingType

        %ADCDITHERENABLED Enable or disable the dither function.
        ADCDitherEnabled

        %IFGAINAUTOENABLED Enable or disable the IF Gain function.
        IFGainAutoEnabled

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

        %DISPLAY Pointer to the IAgXSAnBasicWaveform2Display interface. Read Only.
        Display

        %MARKER2 Pointer to the IAgXSAnBasicWaveformMarker interface. Read Only.
        Marker2

        %FILTER2 Pointer to the IAgXSAnBasicSpectrumFilter interface. Read Only.
        Filter2

        %AVERAGE2 Pointer to the IAgXSAnBasicWaveformAverage interface. Read Only.
        Average2

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

        %% Display property access methods
        function value = get.Display(obj)
            obj.checkValidObj();
            if isempty(obj.Display)
                try
                    obj.Display = instrument.driver.AgXSAnBasic.DeviceSpecific.Waveform2.Display(obj.interface.Display);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Display;
        end

        %% Marker2 property access methods
        function value = get.Marker2(obj)
            obj.checkValidObj();
            if isempty(obj.Marker2)
                try
                    obj.Marker2 = instrument.driver.AgXSAnBasic.DeviceSpecific.Waveform2.Marker2(obj.interface.Marker2);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Marker2;
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

        %% Filter2 property access methods
        function value = get.Filter2(obj)
            obj.checkValidObj();
            if isempty(obj.Filter2)
                try
                    obj.Filter2 = instrument.driver.AgXSAnBasic.DeviceSpecific.Waveform2.Filter2(obj.interface.Filter2);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Filter2;
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

        %% FrequencySynthesisStateAutoEnabled property access methods
        function value = get.FrequencySynthesisStateAutoEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.FrequencySynthesisStateAutoEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.FrequencySynthesisStateAutoEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'FrequencySynthesisStateAutoEnabled');
            try
                obj.interface.FrequencySynthesisStateAutoEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Average2 property access methods
        function value = get.Average2(obj)
            obj.checkValidObj();
            if isempty(obj.Average2)
                try
                    obj.Average2 = instrument.driver.AgXSAnBasic.DeviceSpecific.Waveform2.Average2(obj.interface.Average2);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Average2;
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
                    obj.Average = instrument.driver.AgXSAnBasic.DeviceSpecific.Waveform2.Average(obj.interface.Average);
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
                    obj.Bandwidth = instrument.driver.AgXSAnBasic.DeviceSpecific.Waveform2.Bandwidth(obj.interface.Bandwidth);
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
                    obj.Marker = instrument.driver.AgXSAnBasic.DeviceSpecific.Waveform2.Marker(obj.interface.Marker);
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
                    obj.Traces = instrument.driver.AgXSAnBasic.DeviceSpecific.Waveform2.Traces(obj.interface.Traces);
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
                    obj.Filter = instrument.driver.AgXSAnBasic.DeviceSpecific.Waveform2.Filter(obj.interface.Filter);
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
                    obj.FastCapture = instrument.driver.AgXSAnBasic.DeviceSpecific.Waveform2.FastCapture(obj.interface.FastCapture);
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
