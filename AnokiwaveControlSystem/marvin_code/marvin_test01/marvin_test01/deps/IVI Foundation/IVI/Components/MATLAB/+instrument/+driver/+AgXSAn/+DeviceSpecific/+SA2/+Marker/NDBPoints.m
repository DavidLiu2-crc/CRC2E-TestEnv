classdef NDBPoints < instrument.ivicom.Interface
    %NDBPOINTS IAgXSAnMarkerNDBPoints interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = NDBPoints(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %ENABLED Turns N dB points on and off.  N dB uses the selected marker.  If the selected marker is not on when N dB is turned on, the selected marker turns on, as a Normal marker, at center screen, and is used by N dB. A marker should be placed on the peak of interest before turning on N dB points. The N dB points function looks for the two points on the marker's trace closest to the marker's X Axis value that are N dB below the marker's amplitude, one above and the other below the marker's X Axis value.
        Enabled

        %VALUE The amplitude points to measure the bandwidth relative to the active marker.
        Value

    end

    %% Public Read Only Properties
    properties (SetAccess = private)

        %RESULTS The frequency difference between the N db bandwidth points. Read Only.
        Results

    end

    %% Property access methods
    methods

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

        %% Value property access methods
        function value = get.Value(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Value;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Value(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'Value');
            try
                obj.interface.Value = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Results property access methods
        function value = get.Results(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Results;
            catch e
                obj.interpretError(e);
            end
        end

    end

end
