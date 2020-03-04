classdef SweepCoupling2 < instrument.ivicom.Interface
    %SWEEPCOUPLING2 IAgXSAnSASweepCoupling2 interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = SweepCoupling2(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %RESOLUTIONBANDWIDTHAUTOENABLED Turns resolution bandwith auto coupling on/off.
        ResolutionBandwidthAutoEnabled

        %RESOLUTIONBANDWIDTH Specifies the width of the IF filter in Hertz.
        ResolutionBandwidth

        %VIDEOBANDWIDTHAUTOENABLED Turns video bandwith auto coupling on/off.
        VideoBandwidthAutoEnabled

        %VIDEOBANDWIDTH Specifies the video bandwidth of the post-detection filter in Hertz.
        VideoBandwidth

        %SWEEPTIMEAUTOENABLED Turns sweep time auto coupling on/off.
        SweepTimeAutoEnabled

        %SWEEPTIME Specifies the length of time (in seconds) to sweep from the beginning to the end of the current domain.
        SweepTime

        %BANDWIDTHRATIO Selects/Queries the ratio between the video bandwidth and the equivalent 3 dB resolution bandwidth to be used for setting VBW when VBW is in Auto.
        BandwidthRatio

        %BANDWIDTHRATIOAUTOENABLED Turns On/Off the automatic setting up of the Bandwidth ratio.
        BandwidthRatioAutoEnabled

        %SWEEPPOINTS Sets/Gets number of points taken per sweep, and displayed in the traces.
        SweepPoints

        %FFTWIDTH Controls the width of the FFT's performed while in FFT mode.
        FFTWidth

        %FFTWIDTHAUTOENABLED Turns FFT Width auto coupling on/off.
        FFTWidthAutoEnabled

        %FFTWIDTHTOSPANRATIO Computes the ?intended segment width? by dividing the Span by the FFTs/Span parameter.
        FFTWidthToSpanRatio

        %SWEEPTYPEAUTORULES Selects which set of rules will be used for automatically choosing the Sweep Type when Sweep Type is in Auto.
        SweepTypeAutoRules

        %SWEEPTYPEAUTORULESAUTOENABLED Turns sweep type auto rules auto coupling on/off.
        SweepTypeAutoRulesAutoEnabled

        %BANDWIDTHSHAPE Selects/Queries the type of bandwidth filter that is used.
        BandwidthShape

        %BANDWIDTHTYPE Selects a Gaussian filter based on its 3 dB (Normal) bandwidth or its 6 dB bandwidth.
        BandwidthType

        %SWEEPTIMEAUTORULES Sets/Gets sweep time rules. These are the rules that are used to set the sweep time when Sweep Time is in Auto mode.
        SweepTimeAutoRules

        %SWEEPTIMEAUTORULESAUTOENABLED Turns sweep time auto rules auto coupling on/off.
        SweepTimeAutoRulesAutoEnabled

        %SWEEPTYPE Sets/gets the types of sweep.
        SweepType

        %SWEEPTYPEAUTOENABLED Turns sweep type auto coupling on/off.
        SweepTypeAutoEnabled

    end

    %% Property access methods
    methods

        %% ResolutionBandwidthAutoEnabled property access methods
        function value = get.ResolutionBandwidthAutoEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.ResolutionBandwidthAutoEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.ResolutionBandwidthAutoEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'ResolutionBandwidthAutoEnabled');
            try
                obj.interface.ResolutionBandwidthAutoEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% ResolutionBandwidth property access methods
        function value = get.ResolutionBandwidth(obj)
            obj.checkValidObj();
            try
                value = obj.interface.ResolutionBandwidth;
            catch e
                obj.interpretError(e);
            end
        end
		function set.ResolutionBandwidth(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'ResolutionBandwidth');
            try
                obj.interface.ResolutionBandwidth = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% VideoBandwidthAutoEnabled property access methods
        function value = get.VideoBandwidthAutoEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.VideoBandwidthAutoEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.VideoBandwidthAutoEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'VideoBandwidthAutoEnabled');
            try
                obj.interface.VideoBandwidthAutoEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% VideoBandwidth property access methods
        function value = get.VideoBandwidth(obj)
            obj.checkValidObj();
            try
                value = obj.interface.VideoBandwidth;
            catch e
                obj.interpretError(e);
            end
        end
		function set.VideoBandwidth(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'VideoBandwidth');
            try
                obj.interface.VideoBandwidth = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% SweepTimeAutoEnabled property access methods
        function value = get.SweepTimeAutoEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.SweepTimeAutoEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.SweepTimeAutoEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'SweepTimeAutoEnabled');
            try
                obj.interface.SweepTimeAutoEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
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

        %% BandwidthRatio property access methods
        function value = get.BandwidthRatio(obj)
            obj.checkValidObj();
            try
                value = obj.interface.BandwidthRatio;
            catch e
                obj.interpretError(e);
            end
        end
		function set.BandwidthRatio(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'BandwidthRatio');
            try
                obj.interface.BandwidthRatio = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% BandwidthRatioAutoEnabled property access methods
        function value = get.BandwidthRatioAutoEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.BandwidthRatioAutoEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.BandwidthRatioAutoEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'BandwidthRatioAutoEnabled');
            try
                obj.interface.BandwidthRatioAutoEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% SweepPoints property access methods
        function value = get.SweepPoints(obj)
            obj.checkValidObj();
            try
                value = obj.interface.SweepPoints;
            catch e
                obj.interpretError(e);
            end
        end
		function set.SweepPoints(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarInt32Arg(newValue,'SweepPoints');
            try
                obj.interface.SweepPoints = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% FFTWidth property access methods
        function value = get.FFTWidth(obj)
            obj.checkValidObj();
            try
                value = obj.interface.FFTWidth;
            catch e
                obj.interpretError(e);
            end
        end
		function set.FFTWidth(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'FFTWidth');
            try
                obj.interface.FFTWidth = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% FFTWidthAutoEnabled property access methods
        function value = get.FFTWidthAutoEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.FFTWidthAutoEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.FFTWidthAutoEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'FFTWidthAutoEnabled');
            try
                obj.interface.FFTWidthAutoEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% FFTWidthToSpanRatio property access methods
        function value = get.FFTWidthToSpanRatio(obj)
            obj.checkValidObj();
            try
                value = obj.interface.FFTWidthToSpanRatio;
            catch e
                obj.interpretError(e);
            end
        end
		function set.FFTWidthToSpanRatio(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'FFTWidthToSpanRatio');
            try
                obj.interface.FFTWidthToSpanRatio = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% SweepTypeAutoRules property access methods
        function value = get.SweepTypeAutoRules(obj)
            obj.checkValidObj();
            try
                value = obj.interface.SweepTypeAutoRules;
            catch e
                obj.interpretError(e);
            end
        end
		function set.SweepTypeAutoRules(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.SweepTypeAutoRules = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% SweepTypeAutoRulesAutoEnabled property access methods
        function value = get.SweepTypeAutoRulesAutoEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.SweepTypeAutoRulesAutoEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.SweepTypeAutoRulesAutoEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'SweepTypeAutoRulesAutoEnabled');
            try
                obj.interface.SweepTypeAutoRulesAutoEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% BandwidthShape property access methods
        function value = get.BandwidthShape(obj)
            obj.checkValidObj();
            try
                value = obj.interface.BandwidthShape;
            catch e
                obj.interpretError(e);
            end
        end
		function set.BandwidthShape(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.BandwidthShape = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% BandwidthType property access methods
        function value = get.BandwidthType(obj)
            obj.checkValidObj();
            try
                value = obj.interface.BandwidthType;
            catch e
                obj.interpretError(e);
            end
        end
		function set.BandwidthType(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.BandwidthType = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% SweepTimeAutoRules property access methods
        function value = get.SweepTimeAutoRules(obj)
            obj.checkValidObj();
            try
                value = obj.interface.SweepTimeAutoRules;
            catch e
                obj.interpretError(e);
            end
        end
		function set.SweepTimeAutoRules(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.SweepTimeAutoRules = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% SweepTimeAutoRulesAutoEnabled property access methods
        function value = get.SweepTimeAutoRulesAutoEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.SweepTimeAutoRulesAutoEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.SweepTimeAutoRulesAutoEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'SweepTimeAutoRulesAutoEnabled');
            try
                obj.interface.SweepTimeAutoRulesAutoEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% SweepType property access methods
        function value = get.SweepType(obj)
            obj.checkValidObj();
            try
                value = obj.interface.SweepType;
            catch e
                obj.interpretError(e);
            end
        end
		function set.SweepType(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.SweepType = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% SweepTypeAutoEnabled property access methods
        function value = get.SweepTypeAutoEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.SweepTypeAutoEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.SweepTypeAutoEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'SweepTypeAutoEnabled');
            try
                obj.interface.SweepTypeAutoEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

    %% Public Methods
    methods

        function Configure(obj,ResolutionBandwidthAutoEnabled,ResolutionBandwidth,VideoBandwidthAutoEnabled,VideoBandwidth,SweepTimeAutoEnabled,SweepTime)
            %CONFIGURE This function configures the coupling and sweeping attributes of the IviSpecAn.
            
            obj.checkValidObj();
			error(nargchk(7,7,nargin,'struct'))
            ResolutionBandwidthAutoEnabled = obj.checkScalarBoolArg(ResolutionBandwidthAutoEnabled,'ResolutionBandwidthAutoEnabled');
            ResolutionBandwidth = obj.checkScalarDoubleArg(ResolutionBandwidth,'ResolutionBandwidth');
            VideoBandwidthAutoEnabled = obj.checkScalarBoolArg(VideoBandwidthAutoEnabled,'VideoBandwidthAutoEnabled');
            VideoBandwidth = obj.checkScalarDoubleArg(VideoBandwidth,'VideoBandwidth');
            SweepTimeAutoEnabled = obj.checkScalarBoolArg(SweepTimeAutoEnabled,'SweepTimeAutoEnabled');
            SweepTime = obj.checkScalarDoubleArg(SweepTime,'SweepTime');
            try
                obj.interface.Configure(logical(ResolutionBandwidthAutoEnabled),double(ResolutionBandwidth),logical(VideoBandwidthAutoEnabled),double(VideoBandwidth),logical(SweepTimeAutoEnabled),double(SweepTime));
            catch e
                obj.interpretError(e);
            end
        end

    end

end
