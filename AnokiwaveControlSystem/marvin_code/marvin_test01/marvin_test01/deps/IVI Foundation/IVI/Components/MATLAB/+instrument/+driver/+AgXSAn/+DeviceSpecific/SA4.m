classdef SA4 < instrument.ivicom.Interface
    %SA4 IAgXSAnSA4 interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = SA4(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);

            %% Initialize properties
            try
                obj.ACP3 = instrument.driver.AgXSAn.DeviceSpecific.SA4.ACP3(obj.interface.ACP3);
            catch %#ok<CTCH>
            end

            try
                obj.Source2 = instrument.driver.AgXSAn.DeviceSpecific.SA4.Source2(obj.interface.Source2);
            catch %#ok<CTCH>
            end

            try
                obj.SEMask2 = instrument.driver.AgXSAn.DeviceSpecific.SA4.SEMask2(obj.interface.SEMask2);
            catch %#ok<CTCH>
            end

            try
                obj.SpuriousEmissions2 = instrument.driver.AgXSAn.DeviceSpecific.SA4.SpuriousEmissions2(obj.interface.SpuriousEmissions2);
            catch %#ok<CTCH>
            end

            try
                obj.SweepCoupling2 = instrument.driver.AgXSAn.DeviceSpecific.SA4.SweepCoupling2(obj.interface.SweepCoupling2);
            catch %#ok<CTCH>
            end

            try
                obj.OccupiedBandwidth2 = instrument.driver.AgXSAn.DeviceSpecific.SA4.OccupiedBandwidth2(obj.interface.OccupiedBandwidth2);
            catch %#ok<CTCH>
            end

            try
                obj.ACP2 = instrument.driver.AgXSAn.DeviceSpecific.SA4.ACP2(obj.interface.ACP2);
            catch %#ok<CTCH>
            end

            try
                obj.ChannelPower2 = instrument.driver.AgXSAn.DeviceSpecific.SA4.ChannelPower2(obj.interface.ChannelPower2);
            catch %#ok<CTCH>
            end

            try
                obj.BurstPower2 = instrument.driver.AgXSAn.DeviceSpecific.SA4.BurstPower2(obj.interface.BurstPower2);
            catch %#ok<CTCH>
            end

            try
                obj.HarmonicDistortion2 = instrument.driver.AgXSAn.DeviceSpecific.SA4.HarmonicDistortion2(obj.interface.HarmonicDistortion2);
            catch %#ok<CTCH>
            end

            try
                obj.ThirdOrderIntercept2 = instrument.driver.AgXSAn.DeviceSpecific.SA4.ThirdOrderIntercept2(obj.interface.ThirdOrderIntercept2);
            catch %#ok<CTCH>
            end

            try
                obj.Gating2 = instrument.driver.AgXSAn.DeviceSpecific.SA4.Gating2(obj.interface.Gating2);
            catch %#ok<CTCH>
            end

            try
                obj.Source = instrument.driver.AgXSAn.DeviceSpecific.SA4.Source(obj.interface.Source);
            catch %#ok<CTCH>
            end

            try
                obj.ACP = instrument.driver.AgXSAn.DeviceSpecific.SA4.ACP(obj.interface.ACP);
            catch %#ok<CTCH>
            end

            try
                obj.BurstPower = instrument.driver.AgXSAn.DeviceSpecific.SA4.BurstPower(obj.interface.BurstPower);
            catch %#ok<CTCH>
            end

            try
                obj.ChannelPower = instrument.driver.AgXSAn.DeviceSpecific.SA4.ChannelPower(obj.interface.ChannelPower);
            catch %#ok<CTCH>
            end

            try
                obj.OccupiedBandwidth = instrument.driver.AgXSAn.DeviceSpecific.SA4.OccupiedBandwidth(obj.interface.OccupiedBandwidth);
            catch %#ok<CTCH>
            end

            try
                obj.PowerStatistics = instrument.driver.AgXSAn.DeviceSpecific.SA4.PowerStatistics(obj.interface.PowerStatistics);
            catch %#ok<CTCH>
            end

            try
                obj.SEMask = instrument.driver.AgXSAn.DeviceSpecific.SA4.SEMask(obj.interface.SEMask);
            catch %#ok<CTCH>
            end

            try
                obj.SpuriousEmissions = instrument.driver.AgXSAn.DeviceSpecific.SA4.SpuriousEmissions(obj.interface.SpuriousEmissions);
            catch %#ok<CTCH>
            end

            try
                obj.HarmonicDistortion = instrument.driver.AgXSAn.DeviceSpecific.SA4.HarmonicDistortion(obj.interface.HarmonicDistortion);
            catch %#ok<CTCH>
            end

            try
                obj.ThirdOrderIntercept = instrument.driver.AgXSAn.DeviceSpecific.SA4.ThirdOrderIntercept(obj.interface.ThirdOrderIntercept);
            catch %#ok<CTCH>
            end

            try
                obj.Gating = instrument.driver.AgXSAn.DeviceSpecific.SA4.Gating(obj.interface.Gating);
            catch %#ok<CTCH>
            end

            try
                obj.Limits = instrument.driver.AgXSAn.DeviceSpecific.SA4.Limits(obj.interface.Limits);
            catch %#ok<CTCH>
            end

            try
                obj.ListSweep = instrument.driver.AgXSAn.DeviceSpecific.SA4.ListSweep(obj.interface.ListSweep);
            catch %#ok<CTCH>
            end

            try
                obj.Marker = instrument.driver.AgXSAn.DeviceSpecific.SA4.Marker(obj.interface.Marker);
            catch %#ok<CTCH>
            end

            try
                obj.SweepCoupling = instrument.driver.AgXSAn.DeviceSpecific.SA4.SweepCoupling(obj.interface.SweepCoupling);
            catch %#ok<CTCH>
            end

            try
                obj.SweptSAs = instrument.driver.AgXSAn.DeviceSpecific.SA4.SweptSAs(obj.interface.SweptSAs);
            catch %#ok<CTCH>
            end

        end
        
        function delete(obj)
            obj.ACP3 = [];
            obj.Source2 = [];
            obj.SEMask2 = [];
            obj.SpuriousEmissions2 = [];
            obj.SweepCoupling2 = [];
            obj.OccupiedBandwidth2 = [];
            obj.ACP2 = [];
            obj.ChannelPower2 = [];
            obj.BurstPower2 = [];
            obj.HarmonicDistortion2 = [];
            obj.ThirdOrderIntercept2 = [];
            obj.Gating2 = [];
            obj.Source = [];
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

        %ACP3 Pointer to IAgXSAnSAACP interface. Read Only.
        ACP3

        %SOURCE2 Pointer to the IAgXSAn3Source interface. Read Only.
        Source2

        %SEMASK2 Pointer to IAgXSAnSASEMask interface. Read Only.
        SEMask2

        %SPURIOUSEMISSIONS2 Pointer to IAgXSAnSASpuriousEmissions interface. Read Only.
        SpuriousEmissions2

        %SWEEPCOUPLING2 Pointer to the class-compliant IIviSpecAnSweepCoupling interface Read Only.
        SweepCoupling2

        %OCCUPIEDBANDWIDTH2 Pointer to IAgXSAnSAOccupiedBandwidth interface. Read Only.
        OccupiedBandwidth2

        %ACP2 Pointer to IAgXSAnSAACP interface. Read Only.
        ACP2

        %CHANNELPOWER2 Pointer to IAgXSAnSAChannelPower interface. Read Only.
        ChannelPower2

        %BURSTPOWER2 Pointer to IAgXSAnSABurstPower interface. Read Only.
        BurstPower2

        %HARMONICDISTORTION2 Pointer to IAgXSAnSAHarmonicDistortion interface. Read Only.
        HarmonicDistortion2

        %THIRDORDERINTERCEPT2 Pointer to IAgXSAnSAThirdOrderIntercept interface Read Only.
        ThirdOrderIntercept2

        %GATING2 Pointer to IAgXSAnSAGating interface. Read Only.
        Gating2

        %SOURCE Pointer to the IAgXSAn3Source interface. Read Only.
        Source

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

        %% ACP3 property access methods
        function value = get.ACP3(obj)
            obj.checkValidObj();
            if isempty(obj.ACP3)
                try
                    obj.ACP3 = instrument.driver.AgXSAn.DeviceSpecific.SA4.ACP3(obj.interface.ACP3);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.ACP3;
        end

        %% Source2 property access methods
        function value = get.Source2(obj)
            obj.checkValidObj();
            if isempty(obj.Source2)
                try
                    obj.Source2 = instrument.driver.AgXSAn.DeviceSpecific.SA4.Source2(obj.interface.Source2);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Source2;
        end

        %% SEMask2 property access methods
        function value = get.SEMask2(obj)
            obj.checkValidObj();
            if isempty(obj.SEMask2)
                try
                    obj.SEMask2 = instrument.driver.AgXSAn.DeviceSpecific.SA4.SEMask2(obj.interface.SEMask2);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.SEMask2;
        end

        %% SpuriousEmissions2 property access methods
        function value = get.SpuriousEmissions2(obj)
            obj.checkValidObj();
            if isempty(obj.SpuriousEmissions2)
                try
                    obj.SpuriousEmissions2 = instrument.driver.AgXSAn.DeviceSpecific.SA4.SpuriousEmissions2(obj.interface.SpuriousEmissions2);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.SpuriousEmissions2;
        end

        %% SweepCoupling2 property access methods
        function value = get.SweepCoupling2(obj)
            obj.checkValidObj();
            if isempty(obj.SweepCoupling2)
                try
                    obj.SweepCoupling2 = instrument.driver.AgXSAn.DeviceSpecific.SA4.SweepCoupling2(obj.interface.SweepCoupling2);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.SweepCoupling2;
        end

        %% OccupiedBandwidth2 property access methods
        function value = get.OccupiedBandwidth2(obj)
            obj.checkValidObj();
            if isempty(obj.OccupiedBandwidth2)
                try
                    obj.OccupiedBandwidth2 = instrument.driver.AgXSAn.DeviceSpecific.SA4.OccupiedBandwidth2(obj.interface.OccupiedBandwidth2);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.OccupiedBandwidth2;
        end

        %% ACP2 property access methods
        function value = get.ACP2(obj)
            obj.checkValidObj();
            if isempty(obj.ACP2)
                try
                    obj.ACP2 = instrument.driver.AgXSAn.DeviceSpecific.SA4.ACP2(obj.interface.ACP2);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.ACP2;
        end

        %% ChannelPower2 property access methods
        function value = get.ChannelPower2(obj)
            obj.checkValidObj();
            if isempty(obj.ChannelPower2)
                try
                    obj.ChannelPower2 = instrument.driver.AgXSAn.DeviceSpecific.SA4.ChannelPower2(obj.interface.ChannelPower2);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.ChannelPower2;
        end

        %% BurstPower2 property access methods
        function value = get.BurstPower2(obj)
            obj.checkValidObj();
            if isempty(obj.BurstPower2)
                try
                    obj.BurstPower2 = instrument.driver.AgXSAn.DeviceSpecific.SA4.BurstPower2(obj.interface.BurstPower2);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.BurstPower2;
        end

        %% HarmonicDistortion2 property access methods
        function value = get.HarmonicDistortion2(obj)
            obj.checkValidObj();
            if isempty(obj.HarmonicDistortion2)
                try
                    obj.HarmonicDistortion2 = instrument.driver.AgXSAn.DeviceSpecific.SA4.HarmonicDistortion2(obj.interface.HarmonicDistortion2);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.HarmonicDistortion2;
        end

        %% ThirdOrderIntercept2 property access methods
        function value = get.ThirdOrderIntercept2(obj)
            obj.checkValidObj();
            if isempty(obj.ThirdOrderIntercept2)
                try
                    obj.ThirdOrderIntercept2 = instrument.driver.AgXSAn.DeviceSpecific.SA4.ThirdOrderIntercept2(obj.interface.ThirdOrderIntercept2);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.ThirdOrderIntercept2;
        end

        %% Gating2 property access methods
        function value = get.Gating2(obj)
            obj.checkValidObj();
            if isempty(obj.Gating2)
                try
                    obj.Gating2 = instrument.driver.AgXSAn.DeviceSpecific.SA4.Gating2(obj.interface.Gating2);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Gating2;
        end

        %% Source property access methods
        function value = get.Source(obj)
            obj.checkValidObj();
            if isempty(obj.Source)
                try
                    obj.Source = instrument.driver.AgXSAn.DeviceSpecific.SA4.Source(obj.interface.Source);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Source;
        end

        %% ACP property access methods
        function value = get.ACP(obj)
            obj.checkValidObj();
            if isempty(obj.ACP)
                try
                    obj.ACP = instrument.driver.AgXSAn.DeviceSpecific.SA4.ACP(obj.interface.ACP);
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
                    obj.BurstPower = instrument.driver.AgXSAn.DeviceSpecific.SA4.BurstPower(obj.interface.BurstPower);
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
                    obj.ChannelPower = instrument.driver.AgXSAn.DeviceSpecific.SA4.ChannelPower(obj.interface.ChannelPower);
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
                    obj.OccupiedBandwidth = instrument.driver.AgXSAn.DeviceSpecific.SA4.OccupiedBandwidth(obj.interface.OccupiedBandwidth);
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
                    obj.PowerStatistics = instrument.driver.AgXSAn.DeviceSpecific.SA4.PowerStatistics(obj.interface.PowerStatistics);
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
                    obj.SEMask = instrument.driver.AgXSAn.DeviceSpecific.SA4.SEMask(obj.interface.SEMask);
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
                    obj.SpuriousEmissions = instrument.driver.AgXSAn.DeviceSpecific.SA4.SpuriousEmissions(obj.interface.SpuriousEmissions);
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
                    obj.HarmonicDistortion = instrument.driver.AgXSAn.DeviceSpecific.SA4.HarmonicDistortion(obj.interface.HarmonicDistortion);
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
                    obj.ThirdOrderIntercept = instrument.driver.AgXSAn.DeviceSpecific.SA4.ThirdOrderIntercept(obj.interface.ThirdOrderIntercept);
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
                    obj.Gating = instrument.driver.AgXSAn.DeviceSpecific.SA4.Gating(obj.interface.Gating);
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
                    obj.Limits = instrument.driver.AgXSAn.DeviceSpecific.SA4.Limits(obj.interface.Limits);
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
                    obj.ListSweep = instrument.driver.AgXSAn.DeviceSpecific.SA4.ListSweep(obj.interface.ListSweep);
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
                    obj.Marker = instrument.driver.AgXSAn.DeviceSpecific.SA4.Marker(obj.interface.Marker);
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
                    obj.SweepCoupling = instrument.driver.AgXSAn.DeviceSpecific.SA4.SweepCoupling(obj.interface.SweepCoupling);
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
                    obj.SweptSAs = instrument.driver.AgXSAn.DeviceSpecific.SA4.SweptSAs(obj.interface.SweptSAs);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.SweptSAs;
        end

    end

end
