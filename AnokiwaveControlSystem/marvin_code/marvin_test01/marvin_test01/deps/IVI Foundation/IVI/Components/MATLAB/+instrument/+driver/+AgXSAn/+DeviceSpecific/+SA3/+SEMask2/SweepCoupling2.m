classdef SweepCoupling2 < instrument.ivicom.Interface
    %SWEEPCOUPLING2 IAgXSAnSASEMaskSweepCoupling2 interface.
    
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

        %SWEEPTYPE Sets the sweep type used to calculate the power in the reference channel.
        SweepType

        %SWEEPTYPEAUTOENABLED Channel Sweep Type is automatically selected depending on Sweep Type Rules.
        SweepTypeAutoEnabled

        %SWEEPTYPEAUTORULES Selects which set of rules will be used for Sweep Type automatic selection when Sweep Type Mode is Auto.
        SweepTypeAutoRules

        %BANDWIDTHSHAPE Selects/Queries the type of bandwidth filter that is used.
        BandwidthShape

        %CHANNELINTEGRATIONBANDWIDTH Sets the range of integration used in calculating the power in the main channel.
        ChannelIntegrationBandwidth

        %RESOLUTIONBANDWIDTH Sets/Gets the 3.01 dB resolution bandwidth (RBW) of the analyzer.
        ResolutionBandwidth

        %RESOLUTIONBANDWIDTHAUTOENABLED Turns resolution bandwidth auto on and off.
        ResolutionBandwidthAutoEnabled

        %SWEEPTIME Sets/Gets the length of time in which the spectrum analyzer sweeps the displayed frequency span.
        SweepTime

        %SWEEPTIMEAUTOENABLED Turns sweep time auto on or off.
        SweepTimeAutoEnabled

        %VIDEOBANDWIDTH Changes/Queries the analyzer post-detection filter (VBW).
        VideoBandwidth

        %VIDEOBANDWIDTHAUTOENABLED Sets the automatic coupling of the Video BW filter to the resolution bandwidth filter.
        VideoBandwidthAutoEnabled

        %BANDWIDTHRATIO Sets/Gets the Video BW/Resolution BW Ratio to calculate the Channel Resolution BW and Channel Video BW.
        BandwidthRatio

        %BANDWIDTHRATIOAUTOENABLED Turns On/Off the automatic setting up of the Bandwidth ratio.
        BandwidthRatioAutoEnabled

    end

    %% Property access methods
    methods

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

        %% ChannelIntegrationBandwidth property access methods
        function value = get.ChannelIntegrationBandwidth(obj)
            obj.checkValidObj();
            try
                value = obj.interface.ChannelIntegrationBandwidth;
            catch e
                obj.interpretError(e);
            end
        end
		function set.ChannelIntegrationBandwidth(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'ChannelIntegrationBandwidth');
            try
                obj.interface.ChannelIntegrationBandwidth = newValue;
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

    end

end
