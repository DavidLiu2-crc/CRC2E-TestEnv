classdef Modulation < instrument.ivicom.Interface
    %MODULATION IKtXSAnRadioTestRFGeneratorModulation interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Modulation(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);

            %% Initialize properties
            try
                obj.AM = instrument.driver.AgXSAn.DeviceSpecific.SS.RFGenerator.Modulation.AM(obj.interface.AM);
            catch %#ok<CTCH>
            end

            try
                obj.FM = instrument.driver.AgXSAn.DeviceSpecific.SS.RFGenerator.Modulation.FM(obj.interface.FM);
            catch %#ok<CTCH>
            end

            try
                obj.PM = instrument.driver.AgXSAn.DeviceSpecific.SS.RFGenerator.Modulation.PM(obj.interface.PM);
            catch %#ok<CTCH>
            end

            try
                obj.Analog = instrument.driver.AgXSAn.DeviceSpecific.SS.RFGenerator.Modulation.Analog(obj.interface.Analog);
            catch %#ok<CTCH>
            end

            try
                obj.Digital = instrument.driver.AgXSAn.DeviceSpecific.SS.RFGenerator.Modulation.Digital(obj.interface.Digital);
            catch %#ok<CTCH>
            end

        end
        
        function delete(obj)
            obj.AM = [];
            obj.FM = [];
            obj.PM = [];
            obj.Analog = [];
            obj.Digital = [];
        end

    end
    
    %% Public Properties
    properties

        %ENABLED Enable or disable the Modulation.
        Enabled

        %TYPE Selects modulation mode/type.
        Type

    end

    %% Public Read Only Properties
    properties (SetAccess = private)

        %AM Pointer to the IKtXSAnRadioTestRFGeneratorAM interface. Read Only.
        AM

        %FM Pointer to the IKtXSAnRadioTestRFGeneratorFM interface. Read Only.
        FM

        %PM Pointer to the IKtXSAnRadioTestRFGeneratorPM interface. Read Only.
        PM

        %ANALOG Pointer to the IKtXSAnRadioTestRFGeneratorModulationAnalog interface. Read Only.
        Analog

        %DIGITAL Pointer to the IKtXSAnRadioTestRFGeneratorModulationDigital interface. Read Only.
        Digital

    end

    %% Property access methods
    methods

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

        %% AM property access methods
        function value = get.AM(obj)
            obj.checkValidObj();
            if isempty(obj.AM)
                try
                    obj.AM = instrument.driver.AgXSAn.DeviceSpecific.SS.RFGenerator.Modulation.AM(obj.interface.AM);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.AM;
        end

        %% FM property access methods
        function value = get.FM(obj)
            obj.checkValidObj();
            if isempty(obj.FM)
                try
                    obj.FM = instrument.driver.AgXSAn.DeviceSpecific.SS.RFGenerator.Modulation.FM(obj.interface.FM);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.FM;
        end

        %% PM property access methods
        function value = get.PM(obj)
            obj.checkValidObj();
            if isempty(obj.PM)
                try
                    obj.PM = instrument.driver.AgXSAn.DeviceSpecific.SS.RFGenerator.Modulation.PM(obj.interface.PM);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.PM;
        end

        %% Analog property access methods
        function value = get.Analog(obj)
            obj.checkValidObj();
            if isempty(obj.Analog)
                try
                    obj.Analog = instrument.driver.AgXSAn.DeviceSpecific.SS.RFGenerator.Modulation.Analog(obj.interface.Analog);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Analog;
        end

        %% Digital property access methods
        function value = get.Digital(obj)
            obj.checkValidObj();
            if isempty(obj.Digital)
                try
                    obj.Digital = instrument.driver.AgXSAn.DeviceSpecific.SS.RFGenerator.Modulation.Digital(obj.interface.Digital);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Digital;
        end

    end

end
