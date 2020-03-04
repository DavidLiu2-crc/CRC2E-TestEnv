classdef ThirdOrderIntercept2 < instrument.ivicom.Interface
    %THIRDORDERINTERCEPT2 IAgXSAnSAThirdOrderIntercept2 interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = ThirdOrderIntercept2(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);

            %% Initialize properties
            try
                obj.Average = instrument.driver.AgXSAn.DeviceSpecific.SA4.ThirdOrderIntercept2.Average(obj.interface.Average);
            catch %#ok<CTCH>
            end

            try
                obj.SweepCoupling = instrument.driver.AgXSAn.DeviceSpecific.SA4.ThirdOrderIntercept2.SweepCoupling(obj.interface.SweepCoupling);
            catch %#ok<CTCH>
            end

            try
                obj.Traces = instrument.driver.AgXSAn.DeviceSpecific.SA4.ThirdOrderIntercept2.Traces(obj.interface.Traces);
            catch %#ok<CTCH>
            end

            try
                obj.ZeroSpanSweepCoupling = instrument.driver.AgXSAn.DeviceSpecific.SA4.ThirdOrderIntercept2.ZeroSpanSweepCoupling(obj.interface.ZeroSpanSweepCoupling);
            catch %#ok<CTCH>
            end

            try
                obj.DisplayWindowY = instrument.driver.AgXSAn.DeviceSpecific.SA4.ThirdOrderIntercept2.DisplayWindowY(obj.interface.DisplayWindowY);
            catch %#ok<CTCH>
            end

        end
        
        function delete(obj)
            obj.Average = [];
            obj.SweepCoupling = [];
            obj.Traces = [];
            obj.ZeroSpanSweepCoupling = [];
            obj.DisplayWindowY = [];
        end

    end
    
    %% Public Properties
    properties

        %TRIGGERSOURCE Sets/Gets the source of the trigger.
        TriggerSource

        %UPPERTONEFREQUENCY Sets/Gets the upper base frequency sets the upper of the two base frequencies for TOI measurement.
        UpperToneFrequency

        %LOWERTONEFREQUENCY Sets/Gets the lower of the two base frequencies for TOI  measurement.
        LowerToneFrequency

        %LOWERTONEFREQUENCYAUTOENABLED Enables/Disables the automatic setting up of the lower of the two base frequencies for TOI  measurement.
        LowerToneFrequencyAutoEnabled

        %UPPERTONEFREQUENCYAUTOENABLED Enables/Disables the automatic setting up of the upper of the two base frequencies for TOI  measurement.
        UpperToneFrequencyAutoEnabled

        %SPAN Changes the displayed frequency range symmetrically about the center frequency. While adjusting the Span the Center Frequency is held constant.
        Span

        %MAXMIXERLEVEL Sets/Gets the maximum input mixer level.
        MaxMixerLevel

        %ZEROSPANENABLED Enables/Disables Zero span measurements.
        ZeroSpanEnabled

    end

    %% Public Read Only Properties
    properties (SetAccess = private)

        %AVERAGE Pointer to IAgXSAnSAThirdOrderInterceptAverage interface. Read Only.
        Average

        %SWEEPCOUPLING Pointer to IAgXSAnSAThirdOrderInterceptSweepCoupling interface. Read Only.
        SweepCoupling

        %TRACES Pointer to the IAgXSAnSAThirdOrderInterceptTraces interface. Read Only.
        Traces

        %ZEROSPANSWEEPCOUPLING Pointer to IAgXSAnSAThirdOrderInterceptZeroSpanSweepCoupling interface. Read Only.
        ZeroSpanSweepCoupling

        %DISPLAYWINDOWY Pointer to IAgXSAnSAThirdOrderInterceptDisplayWindowY interface. Read Only.
        DisplayWindowY

    end

    %% Property access methods
    methods

        %% Average property access methods
        function value = get.Average(obj)
            obj.checkValidObj();
            if isempty(obj.Average)
                try
                    obj.Average = instrument.driver.AgXSAn.DeviceSpecific.SA4.ThirdOrderIntercept2.Average(obj.interface.Average);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Average;
        end

        %% SweepCoupling property access methods
        function value = get.SweepCoupling(obj)
            obj.checkValidObj();
            if isempty(obj.SweepCoupling)
                try
                    obj.SweepCoupling = instrument.driver.AgXSAn.DeviceSpecific.SA4.ThirdOrderIntercept2.SweepCoupling(obj.interface.SweepCoupling);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.SweepCoupling;
        end

        %% TriggerSource property access methods
        function value = get.TriggerSource(obj)
            obj.checkValidObj();
            try
                value = obj.interface.TriggerSource;
            catch e
                obj.interpretError(e);
            end
        end
		function set.TriggerSource(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.TriggerSource = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% UpperToneFrequency property access methods
        function value = get.UpperToneFrequency(obj)
            obj.checkValidObj();
            try
                value = obj.interface.UpperToneFrequency;
            catch e
                obj.interpretError(e);
            end
        end
		function set.UpperToneFrequency(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'UpperToneFrequency');
            try
                obj.interface.UpperToneFrequency = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% LowerToneFrequency property access methods
        function value = get.LowerToneFrequency(obj)
            obj.checkValidObj();
            try
                value = obj.interface.LowerToneFrequency;
            catch e
                obj.interpretError(e);
            end
        end
		function set.LowerToneFrequency(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'LowerToneFrequency');
            try
                obj.interface.LowerToneFrequency = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% LowerToneFrequencyAutoEnabled property access methods
        function value = get.LowerToneFrequencyAutoEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.LowerToneFrequencyAutoEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.LowerToneFrequencyAutoEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'LowerToneFrequencyAutoEnabled');
            try
                obj.interface.LowerToneFrequencyAutoEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% UpperToneFrequencyAutoEnabled property access methods
        function value = get.UpperToneFrequencyAutoEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.UpperToneFrequencyAutoEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.UpperToneFrequencyAutoEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'UpperToneFrequencyAutoEnabled');
            try
                obj.interface.UpperToneFrequencyAutoEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

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

        %% Traces property access methods
        function value = get.Traces(obj)
            obj.checkValidObj();
            if isempty(obj.Traces)
                try
                    obj.Traces = instrument.driver.AgXSAn.DeviceSpecific.SA4.ThirdOrderIntercept2.Traces(obj.interface.Traces);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Traces;
        end

        %% ZeroSpanEnabled property access methods
        function value = get.ZeroSpanEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.ZeroSpanEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.ZeroSpanEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'ZeroSpanEnabled');
            try
                obj.interface.ZeroSpanEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% ZeroSpanSweepCoupling property access methods
        function value = get.ZeroSpanSweepCoupling(obj)
            obj.checkValidObj();
            if isempty(obj.ZeroSpanSweepCoupling)
                try
                    obj.ZeroSpanSweepCoupling = instrument.driver.AgXSAn.DeviceSpecific.SA4.ThirdOrderIntercept2.ZeroSpanSweepCoupling(obj.interface.ZeroSpanSweepCoupling);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.ZeroSpanSweepCoupling;
        end

        %% DisplayWindowY property access methods
        function value = get.DisplayWindowY(obj)
            obj.checkValidObj();
            if isempty(obj.DisplayWindowY)
                try
                    obj.DisplayWindowY = instrument.driver.AgXSAn.DeviceSpecific.SA4.ThirdOrderIntercept2.DisplayWindowY(obj.interface.DisplayWindowY);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.DisplayWindowY;
        end

    end

    %% Public Methods
    methods

        function val = FetchInterceptPower(obj)
            %FETCHINTERCEPTPOWER Returns the worst-case Output Intercept Power value in dBm.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                [val] = obj.interface.FetchInterceptPower();
            catch e
                obj.interpretError(e);
            end
        end

        function val = ReadInterceptPower(obj)
            %READINTERCEPTPOWER Returns the worst-case Output Intercept Power value in dBm.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                [val] = obj.interface.ReadInterceptPower();
            catch e
                obj.interpretError(e);
            end
        end

        function Configure(obj)
            %CONFIGURE Restores all the measurement parameters of Third Order Intecept measurement to their default values.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.Configure();
            catch e
                obj.interpretError(e);
            end
        end

        function AutoTune(obj)
            %AUTOTUNE Causes the analyzer to change Center Frequency to the strongest signal pair in the tunable span of the analyzer, excluding the LO.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.AutoTune();
            catch e
                obj.interpretError(e);
            end
        end

        function ConfigureNoPreset(obj)
            %CONFIGURENOPRESET Selects Third Order Intercept measurement as current measurement but does not restore its parameters to their default values.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.ConfigureNoPreset();
            catch e
                obj.interpretError(e);
            end
        end

    end

end
