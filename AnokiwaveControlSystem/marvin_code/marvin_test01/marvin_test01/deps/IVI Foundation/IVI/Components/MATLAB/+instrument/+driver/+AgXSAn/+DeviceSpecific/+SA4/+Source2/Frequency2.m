classdef Frequency2 < instrument.ivicom.Interface
    %FREQUENCY2 IAgXSAnSA2SourceFrequency2 interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Frequency2(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %STEP The step size associated with the Source frequency.
        Step

        %MULTIPLIERNUMERATOR The multiplier numerator parameter offsets the source frequency from the analyzer frequency.
        MultiplierNumerator

        %MULTIPLIERDENOMINATOR The multiplier denominator parameter offsets the source frequency from the analyzer frequency.
        MultiplierDenominator

        %SWEEPREVERSEENABLED Enableor disable to reverse the source sweep direction.
        SweepReverseEnabled

        %OFFSET The frequency offset in Hz. It offsets the source frequency from the analyzer frequency.
        Offset

        %OFFSETENABLED Enable or disable the frequency offset.
        OffsetEnabled

    end

    %% Property access methods
    methods

        %% Step property access methods
        function value = get.Step(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Step;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Step(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'Step');
            try
                obj.interface.Step = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% MultiplierNumerator property access methods
        function value = get.MultiplierNumerator(obj)
            obj.checkValidObj();
            try
                value = obj.interface.MultiplierNumerator;
            catch e
                obj.interpretError(e);
            end
        end
		function set.MultiplierNumerator(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarInt32Arg(newValue,'MultiplierNumerator');
            try
                obj.interface.MultiplierNumerator = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% MultiplierDenominator property access methods
        function value = get.MultiplierDenominator(obj)
            obj.checkValidObj();
            try
                value = obj.interface.MultiplierDenominator;
            catch e
                obj.interpretError(e);
            end
        end
		function set.MultiplierDenominator(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarInt32Arg(newValue,'MultiplierDenominator');
            try
                obj.interface.MultiplierDenominator = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% SweepReverseEnabled property access methods
        function value = get.SweepReverseEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.SweepReverseEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.SweepReverseEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'SweepReverseEnabled');
            try
                obj.interface.SweepReverseEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Offset property access methods
        function value = get.Offset(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Offset;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Offset(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'Offset');
            try
                obj.interface.Offset = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% OffsetEnabled property access methods
        function value = get.OffsetEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.OffsetEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.OffsetEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'OffsetEnabled');
            try
                obj.interface.OffsetEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

end
