classdef SA < instrument.ivicom.Interface
    %SA IAgXSAn SA interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = SA(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);

            %% Initialize properties
            try
                obj.ACP = instrument.driver.AgXSAn.DeviceSpecific.SA.ACP(obj.interface.ACP);
            catch %#ok<CTCH>
            end

            try
                obj.BurstPower = instrument.driver.AgXSAn.DeviceSpecific.SA.BurstPower(obj.interface.BurstPower);
            catch %#ok<CTCH>
            end

            try
                obj.ChannelPower = instrument.driver.AgXSAn.DeviceSpecific.SA.ChannelPower(obj.interface.ChannelPower);
            catch %#ok<CTCH>
            end

            try
                obj.OccupiedBandwidth = instrument.driver.AgXSAn.DeviceSpecific.SA.OccupiedBandwidth(obj.interface.OccupiedBandwidth);
            catch %#ok<CTCH>
            end

            try
                obj.PowerStatistics = instrument.driver.AgXSAn.DeviceSpecific.SA.PowerStatistics(obj.interface.PowerStatistics);
            catch %#ok<CTCH>
            end

            try
                obj.SEMask = instrument.driver.AgXSAn.DeviceSpecific.SA.SEMask(obj.interface.SEMask);
            catch %#ok<CTCH>
            end

            try
                obj.SpuriousEmissions = instrument.driver.AgXSAn.DeviceSpecific.SA.SpuriousEmissions(obj.interface.SpuriousEmissions);
            catch %#ok<CTCH>
            end

            try
                obj.HarmonicDistortion = instrument.driver.AgXSAn.DeviceSpecific.SA.HarmonicDistortion(obj.interface.HarmonicDistortion);
            catch %#ok<CTCH>
            end

            try
                obj.ThirdOrderIntercept = instrument.driver.AgXSAn.DeviceSpecific.SA.ThirdOrderIntercept(obj.interface.ThirdOrderIntercept);
            catch %#ok<CTCH>
            end

            try
                obj.Gating = instrument.driver.AgXSAn.DeviceSpecific.SA.Gating(obj.interface.Gating);
            catch %#ok<CTCH>
            end

            try
                obj.Limits = instrument.driver.AgXSAn.DeviceSpecific.SA.Limits(obj.interface.Limits);
            catch %#ok<CTCH>
            end

            try
                obj.ListSweep = instrument.driver.AgXSAn.DeviceSpecific.SA.ListSweep(obj.interface.ListSweep);
            catch %#ok<CTCH>
            end

            try
                obj.Marker = instrument.driver.AgXSAn.DeviceSpecific.SA.Marker(obj.interface.Marker);
            catch %#ok<CTCH>
            end

            try
                obj.SweepCoupling = instrument.driver.AgXSAn.DeviceSpecific.SA.SweepCoupling(obj.interface.SweepCoupling);
            catch %#ok<CTCH>
            end

            try
                obj.SweptSAs = instrument.driver.AgXSAn.DeviceSpecific.SA.SweptSAs(obj.interface.SweptSAs);
            catch %#ok<CTCH>
            end

        end
        
        function delete(obj)
            obj.ACP = [];
            obj.BurstPower = [];
            obj.ChannelPower = [];
            obj.OccupiedBandwidth = [];
            obj.PowerStatistics = [];
            obj.SEMask = [];
            obj.SpuriousEmissions = [];
            obj.HarmonicDistortion = [];
            obj.ThirdOrderIntercept = [];
            obj.Gating = [];
            obj.Limits = [];
            obj.ListSweep = [];
            obj.Marker = [];
            obj.SweepCoupling = [];
            obj.SweptSAs = [];
        end

    end
    
    %% Public Read Only Properties
    properties (SetAccess = private)

        %ACP Pointer to IAgXSAnSAACP interface. Read Only.
        ACP

        %BURSTPOWER Pointer to IAgXSAnSABurstPower interface. Read Only.
        BurstPower

        %CHANNELPOWER Pointer to IAgXSAnSAChannelPower interface. Read Only.
        ChannelPower

        %OCCUPIEDBANDWIDTH Pointer to IAgXSAnSAOccupiedBandwidth interface. Read Only.
        OccupiedBandwidth

        %POWERSTATISTICS Pointer to IAgXSAnSAPowerStatistics interface. Read Only.
        PowerStatistics

        %SEMASK Pointer to IAgXSAnSASEMask interface. Read Only.
        SEMask

        %SPURIOUSEMISSIONS Pointer to IAgXSAnSASpuriousEmissions interface. Read Only.
        SpuriousEmissions

        %HARMONICDISTORTION Pointer to IAgXSAnSAHarmonicDistortion interface. Read Only.
        HarmonicDistortion

        %THIRDORDERINTERCEPT Pointer to IAgXSAnSAThirdOrderIntercept interface Read Only.
        ThirdOrderIntercept

        %GATING Pointer to IAgXSAnSAGating interface. Read Only.
        Gating

        %LIMITS Pointer to the IAgXSAnSALimits interface. Read Only.
        Limits

        %LISTSWEEP Pointer to IAgXSAnSAListSweep interface. Read Only.
        ListSweep

        %MARKER Pointer to the class-compliant IIviSpecAnMarker interface Read Only.
        Marker

        %SWEEPCOUPLING Pointer to the class-compliant IIviSpecAnSweepCoupling interface Read Only.
        SweepCoupling

        %SWEPTSAS Pointer to the IAgXSAnSASweptSAs interface. Read Only.
        SweptSAs

    end

    %% Property access methods
    methods

        %% ACP property access methods
        function value = get.ACP(obj)
            obj.checkValidObj();
            if isempty(obj.ACP)
                try
                    obj.ACP = instrument.driver.AgXSAn.DeviceSpecific.SA.ACP(obj.interface.ACP);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.ACP;
        end

        %% BurstPower property access methods
        function value = get.BurstPower(obj)
            obj.checkValidObj();
            if isempty(obj.BurstPower)
                try
                    obj.BurstPower = instrument.driver.AgXSAn.DeviceSpecific.SA.BurstPower(obj.interface.BurstPower);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.BurstPower;
        end

        %% ChannelPower property access methods
        function value = get.ChannelPower(obj)
            obj.checkValidObj();
            if isempty(obj.ChannelPower)
                try
                    obj.ChannelPower = instrument.driver.AgXSAn.DeviceSpecific.SA.ChannelPower(obj.interface.ChannelPower);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.ChannelPower;
        end

        %% OccupiedBandwidth property access methods
        function value = get.OccupiedBandwidth(obj)
            obj.checkValidObj();
            if isempty(obj.OccupiedBandwidth)
                try
                    obj.OccupiedBandwidth = instrument.driver.AgXSAn.DeviceSpecific.SA.OccupiedBandwidth(obj.interface.OccupiedBandwidth);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.OccupiedBandwidth;
        end

        %% PowerStatistics property access methods
        function value = get.PowerStatistics(obj)
            obj.checkValidObj();
            if isempty(obj.PowerStatistics)
                try
                    obj.PowerStatistics = instrument.driver.AgXSAn.DeviceSpecific.SA.PowerStatistics(obj.interface.PowerStatistics);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.PowerStatistics;
        end

        %% SEMask property access methods
        function value = get.SEMask(obj)
            obj.checkValidObj();
            if isempty(obj.SEMask)
                try
                    obj.SEMask = instrument.driver.AgXSAn.DeviceSpecific.SA.SEMask(obj.interface.SEMask);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.SEMask;
        end

        %% SpuriousEmissions property access methods
        function value = get.SpuriousEmissions(obj)
            obj.checkValidObj();
            if isempty(obj.SpuriousEmissions)
                try
                    obj.SpuriousEmissions = instrument.driver.AgXSAn.DeviceSpecific.SA.SpuriousEmissions(obj.interface.SpuriousEmissions);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.SpuriousEmissions;
        end

        %% HarmonicDistortion property access methods
        function value = get.HarmonicDistortion(obj)
            obj.checkValidObj();
            if isempty(obj.HarmonicDistortion)
                try
                    obj.HarmonicDistortion = instrument.driver.AgXSAn.DeviceSpecific.SA.HarmonicDistortion(obj.interface.HarmonicDistortion);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.HarmonicDistortion;
        end

        %% ThirdOrderIntercept property access methods
        function value = get.ThirdOrderIntercept(obj)
            obj.checkValidObj();
            if isempty(obj.ThirdOrderIntercept)
                try
                    obj.ThirdOrderIntercept = instrument.driver.AgXSAn.DeviceSpecific.SA.ThirdOrderIntercept(obj.interface.ThirdOrderIntercept);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.ThirdOrderIntercept;
        end

        %% Gating property access methods
        function value = get.Gating(obj)
            obj.checkValidObj();
            if isempty(obj.Gating)
                try
                    obj.Gating = instrument.driver.AgXSAn.DeviceSpecific.SA.Gating(obj.interface.Gating);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Gating;
        end

        %% Limits property access methods
        function value = get.Limits(obj)
            obj.checkValidObj();
            if isempty(obj.Limits)
                try
                    obj.Limits = instrument.driver.AgXSAn.DeviceSpecific.SA.Limits(obj.interface.Limits);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Limits;
        end

        %% ListSweep property access methods
        function value = get.ListSweep(obj)
            obj.checkValidObj();
            if isempty(obj.ListSweep)
                try
                    obj.ListSweep = instrument.driver.AgXSAn.DeviceSpecific.SA.ListSweep(obj.interface.ListSweep);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.ListSweep;
        end

        %% Marker property access methods
        function value = get.Marker(obj)
            obj.checkValidObj();
            if isempty(obj.Marker)
                try
                    obj.Marker = instrument.driver.AgXSAn.DeviceSpecific.SA.Marker(obj.interface.Marker);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Marker;
        end

        %% SweepCoupling property access methods
        function value = get.SweepCoupling(obj)
            obj.checkValidObj();
            if isempty(obj.SweepCoupling)
                try
                    obj.SweepCoupling = instrument.driver.AgXSAn.DeviceSpecific.SA.SweepCoupling(obj.interface.SweepCoupling);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.SweepCoupling;
        end

        %% SweptSAs property access methods
        function value = get.SweptSAs(obj)
            obj.checkValidObj();
            if isempty(obj.SweptSAs)
                try
                    obj.SweptSAs = instrument.driver.AgXSAn.DeviceSpecific.SA.SweptSAs(obj.interface.SweptSAs);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.SweptSAs;
        end

    end

end
