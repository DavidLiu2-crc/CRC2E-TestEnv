classdef IQ2 < instrument.ivicom.Interface
    %IQ2 IAgXSAnBasicInputIQ2 interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = IQ2(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);

            %% Initialize properties
            try
                obj.Power = instrument.driver.AgXSAnBasic.DeviceSpecific.Input2.IQ2.Power(obj.interface.Power);
            catch %#ok<CTCH>
            end

            try
                obj.Voltage = instrument.driver.AgXSAnBasic.DeviceSpecific.Input2.IQ2.Voltage(obj.interface.Voltage);
            catch %#ok<CTCH>
            end

        end
        
        function delete(obj)
            obj.Power = [];
            obj.Voltage = [];
        end

    end
    
    %% Public Properties
    properties

        %IOFFSET Removes a DC offset value from the Q channel input.
        IOffset

        %QOFFSET Removes a DC offset value from the Q channel input.
        QOffset

        %IMPEDANCE The combined (Differential Input and Input Z selections) input impedance.
        Impedance

        %IIMPEDANCE The input impedance for the I channel.
        IImpedance

        %IDIFFERENTIALENABLED Enables or disables differential input for the I channel.
        IDifferentialEnabled

        %QDIFFERENTIALENABLED Enables or disables differential input for the Q channel.
        QDifferentialEnabled

        %QIMPEDANCE The input impedance for the Q channel.
        QImpedance

        %REFERENCEIMPEDANCE The reference input impedance.
        ReferenceImpedance

        %ICOUPLING Selects type of coupling to reject low frequencies.
        ICoupling

        %QCOUPLING Selects type of coupling to reject low frequencies.
        QCoupling

        %COUPLING Selects coupling at the analyzer RF input port.
        Coupling

        %MIRRORENABLED Enables or disables the I and Q channels which have an identical setup.
        MirrorEnabled

    end

    %% Public Read Only Properties
    properties (SetAccess = private)

        %POWER Pointer to the IAgXSAnBasicInputIQPower interface. Read Only.
        Power

        %VOLTAGE Pointer to the IAgXSAnBasicInputIQVoltage interface. Read Only.
        Voltage

    end

    %% Property access methods
    methods

        %% IOffset property access methods
        function value = get.IOffset(obj)
            obj.checkValidObj();
            try
                value = obj.interface.IOffset;
            catch e
                obj.interpretError(e);
            end
        end
		function set.IOffset(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'IOffset');
            try
                obj.interface.IOffset = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% QOffset property access methods
        function value = get.QOffset(obj)
            obj.checkValidObj();
            try
                value = obj.interface.QOffset;
            catch e
                obj.interpretError(e);
            end
        end
		function set.QOffset(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'QOffset');
            try
                obj.interface.QOffset = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Impedance property access methods
        function value = get.Impedance(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Impedance;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Impedance(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.Impedance = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% IImpedance property access methods
        function value = get.IImpedance(obj)
            obj.checkValidObj();
            try
                value = obj.interface.IImpedance;
            catch e
                obj.interpretError(e);
            end
        end
		function set.IImpedance(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.IImpedance = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% IDifferentialEnabled property access methods
        function value = get.IDifferentialEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.IDifferentialEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.IDifferentialEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'IDifferentialEnabled');
            try
                obj.interface.IDifferentialEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% QDifferentialEnabled property access methods
        function value = get.QDifferentialEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.QDifferentialEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.QDifferentialEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'QDifferentialEnabled');
            try
                obj.interface.QDifferentialEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% QImpedance property access methods
        function value = get.QImpedance(obj)
            obj.checkValidObj();
            try
                value = obj.interface.QImpedance;
            catch e
                obj.interpretError(e);
            end
        end
		function set.QImpedance(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.QImpedance = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% ReferenceImpedance property access methods
        function value = get.ReferenceImpedance(obj)
            obj.checkValidObj();
            try
                value = obj.interface.ReferenceImpedance;
            catch e
                obj.interpretError(e);
            end
        end
		function set.ReferenceImpedance(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'ReferenceImpedance');
            try
                obj.interface.ReferenceImpedance = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% ICoupling property access methods
        function value = get.ICoupling(obj)
            obj.checkValidObj();
            try
                value = obj.interface.ICoupling;
            catch e
                obj.interpretError(e);
            end
        end
		function set.ICoupling(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.ICoupling = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% QCoupling property access methods
        function value = get.QCoupling(obj)
            obj.checkValidObj();
            try
                value = obj.interface.QCoupling;
            catch e
                obj.interpretError(e);
            end
        end
		function set.QCoupling(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.QCoupling = newValue;
            catch e
                obj.interpretError(e);
            end
        end

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

        %% MirrorEnabled property access methods
        function value = get.MirrorEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.MirrorEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.MirrorEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'MirrorEnabled');
            try
                obj.interface.MirrorEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Power property access methods
        function value = get.Power(obj)
            obj.checkValidObj();
            if isempty(obj.Power)
                try
                    obj.Power = instrument.driver.AgXSAnBasic.DeviceSpecific.Input2.IQ2.Power(obj.interface.Power);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Power;
        end

        %% Voltage property access methods
        function value = get.Voltage(obj)
            obj.checkValidObj();
            if isempty(obj.Voltage)
                try
                    obj.Voltage = instrument.driver.AgXSAnBasic.DeviceSpecific.Input2.IQ2.Voltage(obj.interface.Voltage);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Voltage;
        end

    end

end
