classdef AnalogDemodulator < instrument.ivicom.Interface
    %ANALOGDEMODULATOR IAgXSAnAnalogDemodulator interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = AnalogDemodulator(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %TYPE Sets/Gets the type of demodulator to be used.
        Type

        %CHANNELBANDWIDTH Sets the RBW setting used by the hardware during the demodulation period in nonzero spans.
        ChannelBandwidth

        %ENABLED Enables/Disables the demodulator.
        Enabled

        %TIME Sets the amount of time the instrument demodulates the signal after each sweep.
        Time

        %FMDEEMPHASIS Sets/Gets the FM De-emphasis time constant.
        FMDeEmphasis

    end

    %% Property access methods
    methods

        %% Type property access methods
        function value = get.Type(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Type;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Type(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.Type = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% ChannelBandwidth property access methods
        function value = get.ChannelBandwidth(obj)
            obj.checkValidObj();
            try
                value = obj.interface.ChannelBandwidth;
            catch e
                obj.interpretError(e);
            end
        end
		function set.ChannelBandwidth(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'ChannelBandwidth');
            try
                obj.interface.ChannelBandwidth = newValue;
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

        %% Time property access methods
        function value = get.Time(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Time;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Time(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'Time');
            try
                obj.interface.Time = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% FMDeEmphasis property access methods
        function value = get.FMDeEmphasis(obj)
            obj.checkValidObj();
            try
                value = obj.interface.FMDeEmphasis;
            catch e
                obj.interpretError(e);
            end
        end
		function set.FMDeEmphasis(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.FMDeEmphasis = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

end
