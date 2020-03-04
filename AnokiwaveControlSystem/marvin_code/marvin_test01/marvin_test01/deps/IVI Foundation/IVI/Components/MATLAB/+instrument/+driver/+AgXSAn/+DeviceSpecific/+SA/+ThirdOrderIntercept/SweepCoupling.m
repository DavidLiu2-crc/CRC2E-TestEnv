classdef SweepCoupling < instrument.ivicom.Interface
    %SWEEPCOUPLING IAgXSAnSAThirdOrderInterceptSweepCoupling interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = SweepCoupling(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %RESOLUTIONBANDWIDTH Sets/Gets the Resolution Bandwidth (RBW) used when measuring the trace
        ResolutionBandwidth

        %RESOLUTIONBANDWIDTHAUTOENABLED Turns resolution bandwidth auto on or off.
        ResolutionBandwidthAutoEnabled

        %SWEEPPOINTS Sets/Gets the number of measured points in each sweep.
        SweepPoints

        %SWEEPTIME Sets/Gets the length of time in which the spectrum analyzer sweeps the displayed frequency span.
        SweepTime

        %SWEEPTIMEAUTOENABLED Turns sweep time auto on or off.
        SweepTimeAutoEnabled

        %VIDEOBANDWIDTH Changes/Queries the analyzer post-detection filter (VBW) used in measuring the trace
        VideoBandwidth

        %VIDEOBANDWIDTHAUTOENABLED Sets the automatic coupling of the Video BW filter to the resolution bandwidth filter.
        VideoBandwidthAutoEnabled

        %BANDWIDTHRATIO Selects/Queries the ratio between the video bandwidth and the equivalent 3 dB resolution bandwidth to be used for setting VBW when VBW is in Auto.
        BandwidthRatio

        %BANDWIDTHRATIOAUTOENABLED Turns On/Off the automatic setting up of the Bandwidth ratio.
        BandwidthRatioAutoEnabled

        %SPANTORESOLUTIONBANDWIDTHRATIO Selects the ratio between the span and the resolution bandwidth.
        SpanToResolutionBandwidthRatio

        %SPANTORESOLUTIONBANDWIDTHRATIOAUTOENABLED Enables/Disables the automatic setting up of the ratio between the span and the resolution bandwidth.
        SpanToResolutionBandwidthRatioAutoEnabled

    end

    %% Property access methods
    methods

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

end
