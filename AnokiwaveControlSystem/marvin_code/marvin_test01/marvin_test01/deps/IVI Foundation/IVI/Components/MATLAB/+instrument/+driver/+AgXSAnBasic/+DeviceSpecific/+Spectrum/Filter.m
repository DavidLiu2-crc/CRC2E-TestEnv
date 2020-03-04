classdef Filter < instrument.ivicom.Interface
    %FILTER IAgXSAnBasicSpectrumFilter interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Filter(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %ALPHA The filter alpha for the DIF filter.
        Alpha

        %BANDWIDTH Filter Bandwidth.
        Bandwidth

        %BANDWIDTHAUTOENABLED Auto Selection of Filter bandwidth.
        BandwidthAutoEnabled

    end

    %% Property access methods
    methods

        %% Alpha property access methods
        function value = get.Alpha(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Alpha;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Alpha(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'Alpha');
            try
                obj.interface.Alpha = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Bandwidth property access methods
        function value = get.Bandwidth(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Bandwidth;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Bandwidth(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'Bandwidth');
            try
                obj.interface.Bandwidth = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% BandwidthAutoEnabled property access methods
        function value = get.BandwidthAutoEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.BandwidthAutoEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.BandwidthAutoEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'BandwidthAutoEnabled');
            try
                obj.interface.BandwidthAutoEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

end
