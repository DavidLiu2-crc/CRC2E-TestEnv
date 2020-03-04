classdef RFGenerator < instrument.ivicom.Interface
    %RFGENERATOR IAgXSAn5SSRFGenerator interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = RFGenerator(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);

            %% Initialize properties
            try
                obj.Modulation = instrument.driver.AgXSAn.DeviceSpecific.SS.RFGenerator.Modulation(obj.interface.Modulation);
            catch %#ok<CTCH>
            end

        end
        
        function delete(obj)
            obj.Modulation = [];
        end

    end
    
    %% Public Properties
    properties

        %FREQUENCY The RF Output Frequency.
        Frequency

        %OFFSETFREQUENCY The frequency offset value.
        OffsetFrequency

        %REFERENCEFREQUENCYENABLED The state of the frequency reference.
        ReferenceFrequencyEnabled

        %REFERENCEFREQUENCY The frequency reference.
        ReferenceFrequency

        %RADIOCHANNELNUMBER The channel number of a given frequency band.
        RadioChannelNumber

        %RADIOBAND The radio band standard.
        RadioBand

        %LEVEL The amplitude (power/level) of the RF output signal.
        Level

        %OFFSETPOWER The Offset Power.
        OffsetPower

        %REFERENCEPOWER The reference power.
        ReferencePower

        %REFERENCEPOWERENABLED Enable of disable the reference power.
        ReferencePowerEnabled

        %OUTPUTENABLED Enable or disable the RF output.
        OutputEnabled

    end

    %% Public Read Only Properties
    properties (SetAccess = private)

        %MODULATION Pointer to the IKtXSAnRadioTestRFGeneratorModulation interface. Read Only.
        Modulation

    end

    %% Property access methods
    methods

        %% Frequency property access methods
        function value = get.Frequency(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Frequency;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Frequency(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'Frequency');
            try
                obj.interface.Frequency = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% OffsetFrequency property access methods
        function value = get.OffsetFrequency(obj)
            obj.checkValidObj();
            try
                value = obj.interface.OffsetFrequency;
            catch e
                obj.interpretError(e);
            end
        end
		function set.OffsetFrequency(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'OffsetFrequency');
            try
                obj.interface.OffsetFrequency = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% ReferenceFrequencyEnabled property access methods
        function value = get.ReferenceFrequencyEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.ReferenceFrequencyEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.ReferenceFrequencyEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'ReferenceFrequencyEnabled');
            try
                obj.interface.ReferenceFrequencyEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% ReferenceFrequency property access methods
        function value = get.ReferenceFrequency(obj)
            obj.checkValidObj();
            try
                value = obj.interface.ReferenceFrequency;
            catch e
                obj.interpretError(e);
            end
        end
		function set.ReferenceFrequency(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'ReferenceFrequency');
            try
                obj.interface.ReferenceFrequency = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% RadioChannelNumber property access methods
        function value = get.RadioChannelNumber(obj)
            obj.checkValidObj();
            try
                value = obj.interface.RadioChannelNumber;
            catch e
                obj.interpretError(e);
            end
        end
		function set.RadioChannelNumber(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarInt32Arg(newValue,'RadioChannelNumber');
            try
                obj.interface.RadioChannelNumber = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% RadioBand property access methods
        function value = get.RadioBand(obj)
            obj.checkValidObj();
            try
                value = obj.interface.RadioBand;
            catch e
                obj.interpretError(e);
            end
        end
		function set.RadioBand(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.RadioBand = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Level property access methods
        function value = get.Level(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Level;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Level(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'Level');
            try
                obj.interface.Level = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% OffsetPower property access methods
        function value = get.OffsetPower(obj)
            obj.checkValidObj();
            try
                value = obj.interface.OffsetPower;
            catch e
                obj.interpretError(e);
            end
        end
		function set.OffsetPower(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'OffsetPower');
            try
                obj.interface.OffsetPower = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% ReferencePower property access methods
        function value = get.ReferencePower(obj)
            obj.checkValidObj();
            try
                value = obj.interface.ReferencePower;
            catch e
                obj.interpretError(e);
            end
        end
		function set.ReferencePower(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'ReferencePower');
            try
                obj.interface.ReferencePower = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% ReferencePowerEnabled property access methods
        function value = get.ReferencePowerEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.ReferencePowerEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.ReferencePowerEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'ReferencePowerEnabled');
            try
                obj.interface.ReferencePowerEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Modulation property access methods
        function value = get.Modulation(obj)
            obj.checkValidObj();
            if isempty(obj.Modulation)
                try
                    obj.Modulation = instrument.driver.AgXSAn.DeviceSpecific.SS.RFGenerator.Modulation(obj.interface.Modulation);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Modulation;
        end

        %% OutputEnabled property access methods
        function value = get.OutputEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.OutputEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.OutputEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'OutputEnabled');
            try
                obj.interface.OutputEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

    %% Public Methods
    methods

        function SetReferenceFrequency(obj)
            %SETREFERENCEFREQUENCY Set the frequency reference.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.SetReferenceFrequency();
            catch e
                obj.interpretError(e);
            end
        end

        function Configure(obj,Frequency,PowerLevel)
            %CONFIGURE This function configures the frequency and the power level of the RF output signal.
            
            obj.checkValidObj();
			error(nargchk(3,3,nargin,'struct'))
            Frequency = obj.checkScalarDoubleArg(Frequency,'Frequency');
            PowerLevel = obj.checkScalarDoubleArg(PowerLevel,'PowerLevel');
            try
                obj.interface.Configure(double(Frequency),double(PowerLevel));
            catch e
                obj.interpretError(e);
            end
        end

    end

end
