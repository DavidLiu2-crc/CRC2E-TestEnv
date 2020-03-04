classdef Frequency3 < instrument.ivicom.Interface
    %FREQUENCY3 IAgXSAnFrequency3 interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Frequency3(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);

            %% Initialize properties
            try
                obj.ZoneSpan = instrument.driver.AgXSAn.DeviceSpecific.Frequency3.ZoneSpan(obj.interface.ZoneSpan);
            catch %#ok<CTCH>
            end

            try
                obj.TraceZoom = instrument.driver.AgXSAn.DeviceSpecific.Frequency3.TraceZoom(obj.interface.TraceZoom);
            catch %#ok<CTCH>
            end

            try
                obj.Global = instrument.driver.AgXSAn.DeviceSpecific.Frequency3.Global(obj.interface.Global);
            catch %#ok<CTCH>
            end

        end
        
        function delete(obj)
            obj.ZoneSpan = [];
            obj.TraceZoom = [];
            obj.Global = [];
        end

    end
    
    %% Public Properties
    properties

        %START The left edge of frequency domain in Hertz.
        Start

        %STOP Specifies the right edge of frequency domain in Hertz.
        Stop

        %OFFSET The frequency offset value to account for frequency conversions outside of the analyzer.
        Offset

        %CENTER The center frequency.
        Center

        %CENTERSTEPINCREMENT The step size for the center frequency and start and stop frequency functions.
        CenterStepIncrement

        %SPAN The displayed frequency range about the center frequency.
        Span

        %SYNTHESIS The LO (local oscillator) phase noise behavior that is optimum for measurement accuracy.
        Synthesis

        %CENTERSTEPAUTOENABLED Enables or disable the center frequency step size automatic mode.
        CenterStepAutoEnabled

        %SYNTHESISAUTOENABLED Allows the analyzer to automatically select an LO phase noise behavior that is optimum for the selected span and RBW.
        SynthesisAutoEnabled

        %SPANTORESOLUTIONBANDWIDTHRATIO The ratio between the span and the resolution bandwidth.
        SpanToResolutionBandwidthRatio

        %SPANTORESOLUTIONBANDWIDTHRATIOAUTOENABLED Enables/Disables the automatic setting up of the ratio between the span and the resolution bandwidth.
        SpanToResolutionBandwidthRatioAutoEnabled

    end

    %% Public Read Only Properties
    properties (SetAccess = private)

        %ZONESPAN Pointer to the IAgXSAnFrequency3ZoneSpan interface. Read Only.
        ZoneSpan

        %TRACEZOOM Pointer to the IAgXSAnFrequency3TraceZoom interface. Read Only.
        TraceZoom

        %GLOBAL Pointer to the IAgXSAnFrequency2Global interface. Read Only.
        Global

    end

    %% Property access methods
    methods

        %% ZoneSpan property access methods
        function value = get.ZoneSpan(obj)
            obj.checkValidObj();
            if isempty(obj.ZoneSpan)
                try
                    obj.ZoneSpan = instrument.driver.AgXSAn.DeviceSpecific.Frequency3.ZoneSpan(obj.interface.ZoneSpan);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.ZoneSpan;
        end

        %% TraceZoom property access methods
        function value = get.TraceZoom(obj)
            obj.checkValidObj();
            if isempty(obj.TraceZoom)
                try
                    obj.TraceZoom = instrument.driver.AgXSAn.DeviceSpecific.Frequency3.TraceZoom(obj.interface.TraceZoom);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.TraceZoom;
        end

        %% Global property access methods
        function value = get.Global(obj)
            obj.checkValidObj();
            if isempty(obj.Global)
                try
                    obj.Global = instrument.driver.AgXSAn.DeviceSpecific.Frequency3.Global(obj.interface.Global);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Global;
        end

        %% Start property access methods
        function value = get.Start(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Start;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Start(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'Start');
            try
                obj.interface.Start = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Stop property access methods
        function value = get.Stop(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Stop;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Stop(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'Stop');
            try
                obj.interface.Stop = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Offset property access methods
        function value = get.Offset(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Offset;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Offset(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'Offset');
            try
                obj.interface.Offset = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Center property access methods
        function value = get.Center(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Center;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Center(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'Center');
            try
                obj.interface.Center = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% CenterStepIncrement property access methods
        function value = get.CenterStepIncrement(obj)
            obj.checkValidObj();
            try
                value = obj.interface.CenterStepIncrement;
            catch e
                obj.interpretError(e);
            end
        end
		function set.CenterStepIncrement(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'CenterStepIncrement');
            try
                obj.interface.CenterStepIncrement = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Span property access methods
        function value = get.Span(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Span;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Span(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'Span');
            try
                obj.interface.Span = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Synthesis property access methods
        function value = get.Synthesis(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Synthesis;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Synthesis(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.Synthesis = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% CenterStepAutoEnabled property access methods
        function value = get.CenterStepAutoEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.CenterStepAutoEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.CenterStepAutoEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'CenterStepAutoEnabled');
            try
                obj.interface.CenterStepAutoEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% SynthesisAutoEnabled property access methods
        function value = get.SynthesisAutoEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.SynthesisAutoEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.SynthesisAutoEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'SynthesisAutoEnabled');
            try
                obj.interface.SynthesisAutoEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% SpanToResolutionBandwidthRatio property access methods
        function value = get.SpanToResolutionBandwidthRatio(obj)
            obj.checkValidObj();
            try
                value = obj.interface.SpanToResolutionBandwidthRatio;
            catch e
                obj.interpretError(e);
            end
        end
		function set.SpanToResolutionBandwidthRatio(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'SpanToResolutionBandwidthRatio');
            try
                obj.interface.SpanToResolutionBandwidthRatio = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% SpanToResolutionBandwidthRatioAutoEnabled property access methods
        function value = get.SpanToResolutionBandwidthRatioAutoEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.SpanToResolutionBandwidthRatioAutoEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.SpanToResolutionBandwidthRatioAutoEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'SpanToResolutionBandwidthRatioAutoEnabled');
            try
                obj.interface.SpanToResolutionBandwidthRatioAutoEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

    %% Public Methods
    methods

        function ConfigureStartStop(obj,StartFrequency,StopFrequency)
            %CONFIGURESTARTSTOP This function configures the frequency range of the IviSpecAn using start frequency and stop frequency. If start frequency is equal to the stop frequency, then the spectrum analyzer is in time-domain mode. In auto-coupled mode, resolution bandwidth (RBW), video bandwidth (VBW), and sweep time may be affected by this function.
            
            obj.checkValidObj();
			error(nargchk(3,3,nargin,'struct'))
            StartFrequency = obj.checkScalarDoubleArg(StartFrequency,'StartFrequency');
            StopFrequency = obj.checkScalarDoubleArg(StopFrequency,'StopFrequency');
            try
                obj.interface.ConfigureStartStop(double(StartFrequency),double(StopFrequency));
            catch e
                obj.interpretError(e);
            end
        end

        function ConfigureCenterSpan(obj,CenterFrequency,Span)
            %CONFIGURECENTERSPAN This function configures the frequency range of the IviSpecAn using the center frequency and frequency span. If span corresponds to zero hertz, then the spectrum analyzer is in time-domain. This function modifies the Frequency Start and Frequency Stop attributes as follows:Frequency Start = center frequency - span/2 and Frequency Stop = center frequency + span/2.In auto-coupled mode, RBW, VBW and sweep time may be affected by this function.
            
            obj.checkValidObj();
			error(nargchk(3,3,nargin,'struct'))
            CenterFrequency = obj.checkScalarDoubleArg(CenterFrequency,'CenterFrequency');
            Span = obj.checkScalarDoubleArg(Span,'Span');
            try
                obj.interface.ConfigureCenterSpan(double(CenterFrequency),double(Span));
            catch e
                obj.interpretError(e);
            end
        end

        function FullSpan(obj)
            %FULLSPAN Sets the analyzer span to full span showing the full frequency range of the analyzer.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.FullSpan();
            catch e
                obj.interpretError(e);
            end
        end

        function PreviousSpan(obj)
            %PREVIOUSSPAN Sets the analyzer frequency span to the previous span setting.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.PreviousSpan();
            catch e
                obj.interpretError(e);
            end
        end

        function Tune(obj)
            %TUNE Tune causes the analyzer to change Center Frequency to the strongest signal in the tunable span of the analyzer, excluding the LO.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.Tune();
            catch e
                obj.interpretError(e);
            end
        end

    end

end
