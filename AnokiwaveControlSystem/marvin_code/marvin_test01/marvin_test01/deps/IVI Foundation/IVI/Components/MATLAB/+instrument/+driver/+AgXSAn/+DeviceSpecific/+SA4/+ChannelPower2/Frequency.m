classdef Frequency < instrument.ivicom.Interface
    %FREQUENCY IAgXSAnSAChannelPowerFrequency interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Frequency(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %SPAN Sets the frequency range symmetrically about the center frequency.
        Span

        %PHASENOISEOPTIONAUTOENABLED Selects the LO (local oscillator) phase noise behavior for various operating conditions.
        PhaseNoiseOptionAutoEnabled

        %PHASENOISEOPTIONSTATE Enables the LO (local oscillator) phase noise behavior for various operating conditions.
        PhaseNoiseOptionState

    end

    %% Property access methods
    methods

        %% Span property access methods
        function value = get.Span(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Span;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Span(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'Span');
            try
                obj.interface.Span = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% PhaseNoiseOptionAutoEnabled property access methods
        function value = get.PhaseNoiseOptionAutoEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.PhaseNoiseOptionAutoEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.PhaseNoiseOptionAutoEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'PhaseNoiseOptionAutoEnabled');
            try
                obj.interface.PhaseNoiseOptionAutoEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% PhaseNoiseOptionState property access methods
        function value = get.PhaseNoiseOptionState(obj)
            obj.checkValidObj();
            try
                value = obj.interface.PhaseNoiseOptionState;
            catch e
                obj.interpretError(e);
            end
        end
		function set.PhaseNoiseOptionState(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarInt32Arg(newValue,'PhaseNoiseOptionState');
            try
                obj.interface.PhaseNoiseOptionState = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

    %% Public Methods
    methods

        function FullSpan(obj)
            %FULLSPAN Changes the Span to show the full frequency range of the analyzer.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.FullSpan();
            catch e
                obj.interpretError(e);
            end
        end

        function LastSpan(obj)
            %LASTSPAN Changes the span to the previous span setting. If no previous span value exists, then the span will remain unchanged.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.LastSpan();
            catch e
                obj.interpretError(e);
            end
        end

    end

end
