classdef SweepCoupling < instrument.ivicom.Interface
    %SWEEPCOUPLING IAgXSAnSAChannelPowerSweepCoupling interface.
    
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

        %BANDWIDTHSHAPE Selects/Queries the type of bandwidth filter that is used.
        BandwidthShape

        %CHANNELINTEGRATIONBANDWIDTH Sets the range of integration used in calculating the power in the main channel.
        ChannelIntegrationBandwidth

        %RESOLUTIONBANDWIDTH Sets/Gets the 3.01 dB resolution bandwidth (RBW) of the analyzer.
        ResolutionBandwidth

        %RESOLUTIONBANDWIDTHAUTOENABLED Turns resolution bandwidth auto on and off.
        ResolutionBandwidthAutoEnabled

        %VIDEOBANDWIDTH Changes/Queries the analyzer post-detection filter bandwidth(VBW).
        VideoBandwidth

        %VIDEOBANDWIDTHAUTOENABLED Sets the automatic coupling of the Video BW filter to the resolution bandwidth filter.
        VideoBandwidthAutoEnabled

        %SWEEPPOINTS The number of trace points.
        SweepPoints

        %SWEEPTIME The length of time in which the spectrum analyzer sweeps the displayed frequency span.
        SweepTime

        %SWEEPTIMEAUTOENABLED Turns sweep time auto on or off.
        SweepTimeAutoEnabled

        %SWEEPTIMEAUTORULES Switches the analyzer between normal and accuracy sweep states.
        SweepTimeAutoRules

    end

    %% Property access methods
    methods

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

    end

end
