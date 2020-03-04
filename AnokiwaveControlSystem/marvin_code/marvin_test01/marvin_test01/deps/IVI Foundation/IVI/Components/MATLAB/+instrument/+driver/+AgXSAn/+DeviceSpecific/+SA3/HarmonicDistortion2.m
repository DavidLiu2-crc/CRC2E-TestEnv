classdef HarmonicDistortion2 < instrument.ivicom.Interface
    %HARMONICDISTORTION2 IAgXSAnSAHarmonicDistortion2 interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = HarmonicDistortion2(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);

            %% Initialize properties
            try
                obj.Traces2 = instrument.driver.AgXSAn.DeviceSpecific.SA3.HarmonicDistortion2.Traces2(obj.interface.Traces2);
            catch %#ok<CTCH>
            end

            try
                obj.Traces = instrument.driver.AgXSAn.DeviceSpecific.SA3.HarmonicDistortion2.Traces(obj.interface.Traces);
            catch %#ok<CTCH>
            end

            try
                obj.Average = instrument.driver.AgXSAn.DeviceSpecific.SA3.HarmonicDistortion2.Average(obj.interface.Average);
            catch %#ok<CTCH>
            end

            try
                obj.SweepCoupling = instrument.driver.AgXSAn.DeviceSpecific.SA3.HarmonicDistortion2.SweepCoupling(obj.interface.SweepCoupling);
            catch %#ok<CTCH>
            end

            try
                obj.RangeTable = instrument.driver.AgXSAn.DeviceSpecific.SA3.HarmonicDistortion2.RangeTable(obj.interface.RangeTable);
            catch %#ok<CTCH>
            end

            try
                obj.Tone = instrument.driver.AgXSAn.DeviceSpecific.SA3.HarmonicDistortion2.Tone(obj.interface.Tone);
            catch %#ok<CTCH>
            end

            try
                obj.DisplayWindowY = instrument.driver.AgXSAn.DeviceSpecific.SA3.HarmonicDistortion2.DisplayWindowY(obj.interface.DisplayWindowY);
            catch %#ok<CTCH>
            end

        end
        
        function delete(obj)
            obj.Traces2 = [];
            obj.Traces = [];
            obj.Average = [];
            obj.SweepCoupling = [];
            obj.RangeTable = [];
            obj.Tone = [];
            obj.DisplayWindowY = [];
        end

    end
    
    %% Public Properties
    properties

        %NUMBEROFHARMONICS Sets/Gets the number of harmonics that are measured, including the fundamental ? thus, setting this to 3 measures up through the third harmonic. All measured harmonics enter into the calculation of Total Harmonic Distortion (THD).
        NumberOfHarmonics

        %FUNDAMENTALFREQUENCY Sets/Gets the frequency of the fundamental measured signal.
        FundamentalFrequency

        %FUNDAMENTALFREQUENCYAUTOENABLED When set to true, the fundamental is determined from the first sweep whenever the measurement is restarted. When set to false, the fundamental frequency value is to be entered manually by the user.
        FundamentalFrequencyAutoEnabled

        %FREQUENCYSTEP Sets/Gets the step size for the fundamental frequency.
        FrequencyStep

        %TRIGGERSOURCE Sets the source of the trigger.
        TriggerSource

    end

    %% Public Read Only Properties
    properties (SetAccess = private)

        %TRACES2 Pointer to the IAgXSAnSAHarmonicDistortionTraces interface. Read Only.
        Traces2

        %TRACES Pointer to the IAgXSAnSAHarmonicDistortionTraces interface. Read Only.
        Traces

        %AVERAGE Pointer to IAgXSAnSAHarmonicDistortionAverage interface. Read Only.
        Average

        %SWEEPCOUPLING Pointer to IAgXSAnSAHarmonicDistortionSweepCoupling interface. Read Only.
        SweepCoupling

        %RANGETABLE Pointer to IAgXSAnSAHarmonicDistortionRangeTable interface. Read Only.
        RangeTable

        %TONE Pointer to IAgXSAnSAHarmonicDistortionTone interface. Read Only.
        Tone

        %DISPLAYWINDOWY Pointer to IAgXSAnSAHarmonicDistortionDisplayWindowY interface. Read Only.
        DisplayWindowY

    end

    %% Property access methods
    methods

        %% Traces2 property access methods
        function value = get.Traces2(obj)
            obj.checkValidObj();
            if isempty(obj.Traces2)
                try
                    obj.Traces2 = instrument.driver.AgXSAn.DeviceSpecific.SA3.HarmonicDistortion2.Traces2(obj.interface.Traces2);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Traces2;
        end

        %% Traces property access methods
        function value = get.Traces(obj)
            obj.checkValidObj();
            if isempty(obj.Traces)
                try
                    obj.Traces = instrument.driver.AgXSAn.DeviceSpecific.SA3.HarmonicDistortion2.Traces(obj.interface.Traces);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Traces;
        end

        %% Average property access methods
        function value = get.Average(obj)
            obj.checkValidObj();
            if isempty(obj.Average)
                try
                    obj.Average = instrument.driver.AgXSAn.DeviceSpecific.SA3.HarmonicDistortion2.Average(obj.interface.Average);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Average;
        end

        %% NumberOfHarmonics property access methods
        function value = get.NumberOfHarmonics(obj)
            obj.checkValidObj();
            try
                value = obj.interface.NumberOfHarmonics;
            catch e
                obj.interpretError(e);
            end
        end
		function set.NumberOfHarmonics(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarInt32Arg(newValue,'NumberOfHarmonics');
            try
                obj.interface.NumberOfHarmonics = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% FundamentalFrequency property access methods
        function value = get.FundamentalFrequency(obj)
            obj.checkValidObj();
            try
                value = obj.interface.FundamentalFrequency;
            catch e
                obj.interpretError(e);
            end
        end
		function set.FundamentalFrequency(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'FundamentalFrequency');
            try
                obj.interface.FundamentalFrequency = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% FundamentalFrequencyAutoEnabled property access methods
        function value = get.FundamentalFrequencyAutoEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.FundamentalFrequencyAutoEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.FundamentalFrequencyAutoEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'FundamentalFrequencyAutoEnabled');
            try
                obj.interface.FundamentalFrequencyAutoEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% FrequencyStep property access methods
        function value = get.FrequencyStep(obj)
            obj.checkValidObj();
            try
                value = obj.interface.FrequencyStep;
            catch e
                obj.interpretError(e);
            end
        end
		function set.FrequencyStep(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarInt32Arg(newValue,'FrequencyStep');
            try
                obj.interface.FrequencyStep = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% SweepCoupling property access methods
        function value = get.SweepCoupling(obj)
            obj.checkValidObj();
            if isempty(obj.SweepCoupling)
                try
                    obj.SweepCoupling = instrument.driver.AgXSAn.DeviceSpecific.SA3.HarmonicDistortion2.SweepCoupling(obj.interface.SweepCoupling);
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

        %% RangeTable property access methods
        function value = get.RangeTable(obj)
            obj.checkValidObj();
            if isempty(obj.RangeTable)
                try
                    obj.RangeTable = instrument.driver.AgXSAn.DeviceSpecific.SA3.HarmonicDistortion2.RangeTable(obj.interface.RangeTable);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.RangeTable;
        end

        %% Tone property access methods
        function value = get.Tone(obj)
            obj.checkValidObj();
            if isempty(obj.Tone)
                try
                    obj.Tone = instrument.driver.AgXSAn.DeviceSpecific.SA3.HarmonicDistortion2.Tone(obj.interface.Tone);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Tone;
        end

        %% DisplayWindowY property access methods
        function value = get.DisplayWindowY(obj)
            obj.checkValidObj();
            if isempty(obj.DisplayWindowY)
                try
                    obj.DisplayWindowY = instrument.driver.AgXSAn.DeviceSpecific.SA3.HarmonicDistortion2.DisplayWindowY(obj.interface.DisplayWindowY);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.DisplayWindowY;
        end

    end

    %% Public Methods
    methods

        function Configure(obj)
            %CONFIGURE Restores all the measurement parameters of Harmonic Distortion measurement to their default values.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.Configure();
            catch e
                obj.interpretError(e);
            end
        end

        function ConfigureNoPreset(obj)
            %CONFIGURENOPRESET Selects harmonic distortion measurement as current measurement but does not restore its parameters to their default values.
            
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
