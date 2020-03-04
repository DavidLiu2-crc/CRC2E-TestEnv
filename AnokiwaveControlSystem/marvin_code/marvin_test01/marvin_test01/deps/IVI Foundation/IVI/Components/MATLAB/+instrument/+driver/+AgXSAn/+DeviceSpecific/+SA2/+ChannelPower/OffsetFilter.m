classdef OffsetFilter < instrument.ivicom.Interface
    %OFFSETFILTER IAgXSAnSAChannelPowerOffsetFilter interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = OffsetFilter(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %ALPHA Sets/Gets the alpha value for the RRC Filter.
        Alpha

        %ENABLED Allows user to turn RRC filtering of the carriers and all adjacent channels on or off. The alpha value (roll off) for the filter will be set to the value of the Filter Alpha parameter.
        Enabled

        %BANDWIDTH Inputs/Queries the Root Raised Cosine (RRC) filter bandwidth. Normally, the filter bandwidth is the same as the symbol rate of the signal.
        Bandwidth

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

        %% Enabled property access methods
        function value = get.Enabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Enabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Enabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'Enabled');
            try
                obj.interface.Enabled = newValue;
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

    end

end
