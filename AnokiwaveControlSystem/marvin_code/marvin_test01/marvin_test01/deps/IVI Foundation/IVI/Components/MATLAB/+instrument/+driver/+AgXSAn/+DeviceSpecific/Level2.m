classdef Level2 < instrument.ivicom.Interface
    %LEVEL2 IAgXSAnLevel2 interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Level2(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %MIXEROFFSET Advanced setting to adjust target Range at the input mixer which in turn affects the signal level in the instrument’s IF.
        MixerOffset

        %AMPLITUDEUNITS Specifies the amplitude units for input, output and display amplitude.
        AmplitudeUnits

        %ATTENUATIONAUTOENABLED Turns attenuation aut on/off.
        AttenuationAutoEnabled

        %ATTENUATION Specifies the input attenuation (in positive dB).
        Attenuation

        %ATTENUATIONOPTIMIZE When on, it executes the adjustment algorithm each time a measurement restarts. (Therefore, in Continuous, it only executes before the first measurement.) The spectrum analyzer measurement, Swept SA, does not support this functionality. Sets the optional attenuation Off, Electrical or a combination of mechanical and electrical.
        AttenuationOptimize

        %ATTENUATIONSTEPINCREMENT Permits the selection of 2 dB or 10 dB step resolution for input attenuation.
        AttenuationStepIncrement

        %ELECTRONICATTENUATION Electronic attenuation range: 0-24 db. The electronic attenuator is unavailable above 3.6 GHz. Therefore, if the Elec Atten is enabled, then the Stop Freq of the analyzer is limited to 3.6 GHz, which is to say the start, stop, center frequency and span values are all limited to a maximum of 3.6 GHz + Frequency Offset.
        ElectronicAttenuation

        %ELECTRONICATTENUATIONENABLED When the Electrical Attenuator is enabled, the Mechanical Attenuator transitions to a state in which it has no Auto function.  Sets the mechanical attenuator to 10 db and the electronic attenuator to a value where the combinded mechanical and electronic attenuation equals the value of the mechanical attenuator (10db) before enabling electronic attenuation within the limits of the electronic attenuator (0-24db).
        ElectronicAttenuationEnabled

    end

    %% Public Read Only Properties
    properties (SetAccess = private)

        %INPUTIMPEDANCE Specifies the value of input impedance expected at the active input port. Read Only.
        InputImpedance

    end

    %% Property access methods
    methods

        %% MixerOffset property access methods
        function value = get.MixerOffset(obj)
            obj.checkValidObj();
            try
                value = obj.interface.MixerOffset;
            catch e
                obj.interpretError(e);
            end
        end
		function set.MixerOffset(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'MixerOffset');
            try
                obj.interface.MixerOffset = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% AmplitudeUnits property access methods
        function value = get.AmplitudeUnits(obj)
            obj.checkValidObj();
            try
                value = obj.interface.AmplitudeUnits;
            catch e
                obj.interpretError(e);
            end
        end
		function set.AmplitudeUnits(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.AmplitudeUnits = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% InputImpedance property access methods
        function value = get.InputImpedance(obj)
            obj.checkValidObj();
            try
                value = obj.interface.InputImpedance;
            catch e
                obj.interpretError(e);
            end
        end

        %% AttenuationAutoEnabled property access methods
        function value = get.AttenuationAutoEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.AttenuationAutoEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.AttenuationAutoEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'AttenuationAutoEnabled');
            try
                obj.interface.AttenuationAutoEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Attenuation property access methods
        function value = get.Attenuation(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Attenuation;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Attenuation(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'Attenuation');
            try
                obj.interface.Attenuation = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% AttenuationOptimize property access methods
        function value = get.AttenuationOptimize(obj)
            obj.checkValidObj();
            try
                value = obj.interface.AttenuationOptimize;
            catch e
                obj.interpretError(e);
            end
        end
		function set.AttenuationOptimize(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.AttenuationOptimize = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% AttenuationStepIncrement property access methods
        function value = get.AttenuationStepIncrement(obj)
            obj.checkValidObj();
            try
                value = obj.interface.AttenuationStepIncrement;
            catch e
                obj.interpretError(e);
            end
        end
		function set.AttenuationStepIncrement(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.AttenuationStepIncrement = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% ElectronicAttenuation property access methods
        function value = get.ElectronicAttenuation(obj)
            obj.checkValidObj();
            try
                value = obj.interface.ElectronicAttenuation;
            catch e
                obj.interpretError(e);
            end
        end
		function set.ElectronicAttenuation(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarInt32Arg(newValue,'ElectronicAttenuation');
            try
                obj.interface.ElectronicAttenuation = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% ElectronicAttenuationEnabled property access methods
        function value = get.ElectronicAttenuationEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.ElectronicAttenuationEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.ElectronicAttenuationEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'ElectronicAttenuationEnabled');
            try
                obj.interface.ElectronicAttenuationEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

    %% Public Methods
    methods

        function Configure(obj,AmplitudeUnits,InputImpedance,ReferenceLevel,ReferenceLevelOffset,AttenuationAuto,Attenuation)
            %CONFIGURE This function configures the vertical attributes of the IviSpecAn.
            
            obj.checkValidObj();
			error(nargchk(7,7,nargin,'struct'))
            InputImpedance = obj.checkScalarDoubleArg(InputImpedance,'InputImpedance');
            ReferenceLevel = obj.checkScalarDoubleArg(ReferenceLevel,'ReferenceLevel');
            ReferenceLevelOffset = obj.checkScalarDoubleArg(ReferenceLevelOffset,'ReferenceLevelOffset');
            AttenuationAuto = obj.checkScalarBoolArg(AttenuationAuto,'AttenuationAuto');
            Attenuation = obj.checkScalarDoubleArg(Attenuation,'Attenuation');
            try
                obj.interface.Configure(int32(AmplitudeUnits),double(InputImpedance),double(ReferenceLevel),double(ReferenceLevelOffset),logical(AttenuationAuto),double(Attenuation));
            catch e
                obj.interpretError(e);
            end
        end

    end

end
