classdef Peak < instrument.ivicom.Interface
    %PEAK IAgXSAnBasicSpectrumMarkerPeak interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Peak(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %THRESHOLD The peak threshold value in dBm defines the minimum signal level (or min threshold) that the peak identification algorithm uses to recognize a peak.
        Threshold

        %THRESHOLDENABLED Enable or disable the peak threshold.
        ThresholdEnabled

        %EXCURSION The value in dB defines the minimum amplitude variation (rise and fall) required for a signal to be identified as peak.
        Excursion

        %EXCURSIONENABLED Enable or disable the peak excursion.
        ExcursionEnabled

        %SEARCHMODE The peak search type. There are two types of peak search functions. One type is the \"Peak Search\" type, the other type is the \"Next Peak\" type.
        SearchMode

    end

    %% Property access methods
    methods

        %% Threshold property access methods
        function value = get.Threshold(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Threshold;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Threshold(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'Threshold');
            try
                obj.interface.Threshold = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% ThresholdEnabled property access methods
        function value = get.ThresholdEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.ThresholdEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.ThresholdEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'ThresholdEnabled');
            try
                obj.interface.ThresholdEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Excursion property access methods
        function value = get.Excursion(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Excursion;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Excursion(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'Excursion');
            try
                obj.interface.Excursion = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% ExcursionEnabled property access methods
        function value = get.ExcursionEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.ExcursionEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.ExcursionEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'ExcursionEnabled');
            try
                obj.interface.ExcursionEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% SearchMode property access methods
        function value = get.SearchMode(obj)
            obj.checkValidObj();
            try
                value = obj.interface.SearchMode;
            catch e
                obj.interpretError(e);
            end
        end
		function set.SearchMode(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.SearchMode = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

end
