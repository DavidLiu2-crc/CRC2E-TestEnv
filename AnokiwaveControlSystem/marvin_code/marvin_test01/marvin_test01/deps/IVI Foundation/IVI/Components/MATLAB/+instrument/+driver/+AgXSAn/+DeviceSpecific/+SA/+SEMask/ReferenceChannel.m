classdef ReferenceChannel < instrument.ivicom.Interface
    %REFERENCECHANNEL IAgXSAnSASEMaskReferenceChannel interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = ReferenceChannel(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %CPSD Sets/Gets the power spectral density in the carrier that is used to compute the relative power spectral density values for the offsets when Meas Type is set to PSD Ref. When the state is set to auto, this will be set to the measured carrier power spectral density.
        CPSD

        %TOTALPOWER Sets/Gets the power in the carrier (ref channel) that will be used to compute the relative power values for the offsets. When the TotalPowerAutoEnabled is set to true, this value is set to the measured carrier reference power. When TotalPowerAutoEnabled is set to false, the result takes on the last measured value, or can be manually entered.
        TotalPower

        %TOTALPOWERAUTOENABLED Turns on/off carrier power auto mode.
        TotalPowerAutoEnabled

        %PEAKPOWER Sets the spectrum peak power in the carrier that is used to compute the relative power spectral density values for the offsets when Meas Type is set to Spectrum Peak. When the TotalPowerAutoEnabled is set to true, this value is set to the measured carrier reference power. When TotalPowerAutoEnabled is set to false, the result takes on the last measured value, or can be manually entered.
        PeakPower

        %DETECTORTYPEAUTOENABLED Sets the detector to the default detection mode for the reference channel. This mode is dependent upon the current reference channel conditions.
        DetectorTypeAutoEnabled

        %DETECTORTYPE Selects the detectors for reference channel
        DetectorType

        %FREQUENCYSPAN Specifies/Queries the span used to calculate the power in the reference channel.
        FrequencySpan

    end

    %% Property access methods
    methods

        %% CPSD property access methods
        function value = get.CPSD(obj)
            obj.checkValidObj();
            try
                value = obj.interface.CPSD;
            catch e
                obj.interpretError(e);
            end
        end
		function set.CPSD(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'CPSD');
            try
                obj.interface.CPSD = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% TotalPower property access methods
        function value = get.TotalPower(obj)
            obj.checkValidObj();
            try
                value = obj.interface.TotalPower;
            catch e
                obj.interpretError(e);
            end
        end
		function set.TotalPower(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'TotalPower');
            try
                obj.interface.TotalPower = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% TotalPowerAutoEnabled property access methods
        function value = get.TotalPowerAutoEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.TotalPowerAutoEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.TotalPowerAutoEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'TotalPowerAutoEnabled');
            try
                obj.interface.TotalPowerAutoEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% PeakPower property access methods
        function value = get.PeakPower(obj)
            obj.checkValidObj();
            try
                value = obj.interface.PeakPower;
            catch e
                obj.interpretError(e);
            end
        end
		function set.PeakPower(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'PeakPower');
            try
                obj.interface.PeakPower = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% DetectorTypeAutoEnabled property access methods
        function value = get.DetectorTypeAutoEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.DetectorTypeAutoEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.DetectorTypeAutoEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'DetectorTypeAutoEnabled');
            try
                obj.interface.DetectorTypeAutoEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% DetectorType property access methods
        function value = get.DetectorType(obj)
            obj.checkValidObj();
            try
                value = obj.interface.DetectorType;
            catch e
                obj.interpretError(e);
            end
        end
		function set.DetectorType(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.DetectorType = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% FrequencySpan property access methods
        function value = get.FrequencySpan(obj)
            obj.checkValidObj();
            try
                value = obj.interface.FrequencySpan;
            catch e
                obj.interpretError(e);
            end
        end
		function set.FrequencySpan(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'FrequencySpan');
            try
                obj.interface.FrequencySpan = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

end
