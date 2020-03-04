classdef SweepCoupling < instrument.ivicom.Interface
    %SWEEPCOUPLING IAgXSAnSAHarmonicDistortionSweepCoupling interface.
    
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

        %RESOLUTIONBANDWIDTH Sets/Gets the Resolution Bandwidth (RBW) used in measuring the fundamental signal
        ResolutionBandwidth

        %RESOLUTIONBANDWIDTHAUTOENABLED Turns resolution bandwidth auto on and off.
        ResolutionBandwidthAutoEnabled

        %SWEEPTIME Sets/Gets the length of time in which the spectrum analyzer sweeps when measuring the fundamental.
        SweepTime

        %SWEEPTIMEAUTOENABLED Turns sweep time auto on or off.
        SweepTimeAutoEnabled

        %VIDEOBANDWIDTH Changes/Queries the analyzer post-detection filter bandwidth(VBW).
        VideoBandwidth

        %VIDEOBANDWIDTHAUTOENABLED Sets the automatic coupling of the Video BW filter to the resolution bandwidth filter.
        VideoBandwidthAutoEnabled

        %SWEEPTIMEENABLED Selects the length of time in which the spectrum analyzer sweeps when measuring the fundamental. Additional overhead time is required by the analyzer that impacts the sweep rate, but is not calculated as part of the dwell time. Reducing the sweep time increases the rate of sweeps. The dwell time normally changes with the resolution bandwidth, so by default the dwell time varies with each harmonic. If Dwell Time Auto is off, the harmonics will have the same dwell time unless the Range Table is used
        SweepTimeEnabled

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

        %% SweepTimeEnabled property access methods
        function value = get.SweepTimeEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.SweepTimeEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.SweepTimeEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'SweepTimeEnabled');
            try
                obj.interface.SweepTimeEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

end
