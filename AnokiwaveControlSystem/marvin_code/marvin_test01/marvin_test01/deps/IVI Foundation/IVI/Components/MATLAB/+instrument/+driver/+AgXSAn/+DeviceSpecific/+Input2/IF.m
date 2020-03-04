classdef IF < instrument.ivicom.Interface
    %IF IAgXSAnInputIF interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = IF(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %FFTIFGAINSTATE Sets/Gets the ranging in the digital IF when doing FFT sweeps.
        FFTIFGainState

        %FFTIFGAINAUTOENABLED Activates/Disables the auto rules for FFT IF Gain
        FFTIFGainAutoEnabled

        %SWEPTIFGAINAUTOENABLED Activates/Disables the auto rules for Swept IF Gain
        SweptIFGainAutoEnabled

        %SWEPTIFGAINSTATE To take full advantage of the RF dynamic range of the analyzer, there is an added switched IF amplifier with approximately 10 dB of gain. When you can turn it on without overloading the analyzer, the dynamic range is always better with it on than off.
        SweptIFGainState

    end

    %% Property access methods
    methods

        %% FFTIFGainState property access methods
        function value = get.FFTIFGainState(obj)
            obj.checkValidObj();
            try
                value = obj.interface.FFTIFGainState;
            catch e
                obj.interpretError(e);
            end
        end
		function set.FFTIFGainState(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.FFTIFGainState = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% FFTIFGainAutoEnabled property access methods
        function value = get.FFTIFGainAutoEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.FFTIFGainAutoEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.FFTIFGainAutoEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'FFTIFGainAutoEnabled');
            try
                obj.interface.FFTIFGainAutoEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% SweptIFGainAutoEnabled property access methods
        function value = get.SweptIFGainAutoEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.SweptIFGainAutoEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.SweptIFGainAutoEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'SweptIFGainAutoEnabled');
            try
                obj.interface.SweptIFGainAutoEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% SweptIFGainState property access methods
        function value = get.SweptIFGainState(obj)
            obj.checkValidObj();
            try
                value = obj.interface.SweptIFGainState;
            catch e
                obj.interpretError(e);
            end
        end
		function set.SweptIFGainState(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.SweptIFGainState = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

end
