classdef RF < instrument.ivicom.Interface
    %RF IAgXSAnInputRF interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = RF(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);

            %% Initialize properties
            try
                obj.Corrections = instrument.driver.AgXSAn.DeviceSpecific.Input2.RF.Corrections(obj.interface.Corrections);
            catch %#ok<CTCH>
            end

        end
        
        function delete(obj)
            obj.Corrections = [];
        end

    end
    
    %% Public Properties
    properties

        %COUPLING Specifies AC or DC coupling at the analyzer RF input port.
        Coupling

        %MAXMIXERLEVEL Sets the input mixer level so that the highest signal that can be displayed is set at the reference level.
        MaxMixerLevel

        %PREAMPENABLED Turns the internal preamp on and off.
        PreAmpEnabled

        %AUTORANGEENABLED Turns On/OFF the input auto ranging features.
        AutoRangeEnabled

        %CENTERFREQUENCY Sets/Gets the Center Frequency used when the RF input is selected.
        CenterFrequency

        %PRESELECTORENABLED Selects whether RF Preselector is On or Off.
        PreselectorEnabled

    end

    %% Public Read Only Properties
    properties (SetAccess = private)

        %CORRECTIONS Pointer to the IAgXSAnInputRFCorrections interface. Read Only.
        Corrections

    end

    %% Property access methods
    methods

        %% Coupling property access methods
        function value = get.Coupling(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Coupling;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Coupling(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.Coupling = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% MaxMixerLevel property access methods
        function value = get.MaxMixerLevel(obj)
            obj.checkValidObj();
            try
                value = obj.interface.MaxMixerLevel;
            catch e
                obj.interpretError(e);
            end
        end
		function set.MaxMixerLevel(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'MaxMixerLevel');
            try
                obj.interface.MaxMixerLevel = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% PreAmpEnabled property access methods
        function value = get.PreAmpEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.PreAmpEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.PreAmpEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'PreAmpEnabled');
            try
                obj.interface.PreAmpEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Corrections property access methods
        function value = get.Corrections(obj)
            obj.checkValidObj();
            if isempty(obj.Corrections)
                try
                    obj.Corrections = instrument.driver.AgXSAn.DeviceSpecific.Input2.RF.Corrections(obj.interface.Corrections);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Corrections;
        end

        %% AutoRangeEnabled property access methods
        function value = get.AutoRangeEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.AutoRangeEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.AutoRangeEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'AutoRangeEnabled');
            try
                obj.interface.AutoRangeEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% CenterFrequency property access methods
        function value = get.CenterFrequency(obj)
            obj.checkValidObj();
            try
                value = obj.interface.CenterFrequency;
            catch e
                obj.interpretError(e);
            end
        end
		function set.CenterFrequency(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'CenterFrequency');
            try
                obj.interface.CenterFrequency = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% PreselectorEnabled property access methods
        function value = get.PreselectorEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.PreselectorEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.PreselectorEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'PreselectorEnabled');
            try
                obj.interface.PreselectorEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

    %% Public Methods
    methods

        function RangeOptimize(obj)
            %RANGEOPTIMIZE Optimitize ranging function according to the sensed level of the input signal.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.RangeOptimize();
            catch e
                obj.interpretError(e);
            end
        end

    end

end
