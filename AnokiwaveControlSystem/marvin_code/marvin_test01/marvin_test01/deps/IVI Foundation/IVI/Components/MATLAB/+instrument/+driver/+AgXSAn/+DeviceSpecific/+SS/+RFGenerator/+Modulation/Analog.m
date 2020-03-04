classdef Analog < instrument.ivicom.Interface
    %ANALOG IKtXSAnRadioTestRFGeneratorModulationAnalog interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Analog(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %FORMAT Selects the analog modulation format.
        Format

        %WAVEFORMTYPE The waveform to be used for analog modulation
        WaveformType

        %DUTYCYCLE Selects the duty cycle, when waveform type is rectangular.
        DutyCycle

        %SINE2LEVEL The amplitude of a second sine wave component.
        Sine2Level

        %SINE2FREQUENCY The frequency of a second sine wave component.
        Sine2Frequency

    end

    %% Property access methods
    methods

        %% Format property access methods
        function value = get.Format(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Format;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Format(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.Format = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% WaveformType property access methods
        function value = get.WaveformType(obj)
            obj.checkValidObj();
            try
                value = obj.interface.WaveformType;
            catch e
                obj.interpretError(e);
            end
        end
		function set.WaveformType(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.WaveformType = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% DutyCycle property access methods
        function value = get.DutyCycle(obj)
            obj.checkValidObj();
            try
                value = obj.interface.DutyCycle;
            catch e
                obj.interpretError(e);
            end
        end
		function set.DutyCycle(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'DutyCycle');
            try
                obj.interface.DutyCycle = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Sine2Level property access methods
        function value = get.Sine2Level(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Sine2Level;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Sine2Level(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'Sine2Level');
            try
                obj.interface.Sine2Level = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Sine2Frequency property access methods
        function value = get.Sine2Frequency(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Sine2Frequency;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Sine2Frequency(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'Sine2Frequency');
            try
                obj.interface.Sine2Frequency = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

end
