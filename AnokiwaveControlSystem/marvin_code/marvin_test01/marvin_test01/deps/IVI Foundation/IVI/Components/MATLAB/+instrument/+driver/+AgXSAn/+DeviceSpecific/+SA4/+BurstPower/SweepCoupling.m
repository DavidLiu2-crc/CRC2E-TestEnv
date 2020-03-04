classdef SweepCoupling < instrument.ivicom.Interface
    %SWEEPCOUPLING IAgXSAnSABurstPowerSweepCoupling interface.
    
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

        %RESOLUTIONBANDWIDTH Sets/Gets the 3.01 dB resolution bandwidth (RBW) of the analyzer.
        ResolutionBandwidth

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

    end

end
