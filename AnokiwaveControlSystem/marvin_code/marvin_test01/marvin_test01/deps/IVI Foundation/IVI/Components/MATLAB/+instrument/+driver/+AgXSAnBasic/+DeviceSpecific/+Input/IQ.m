classdef IQ < instrument.ivicom.Interface
    %IQ AgXSAnBasic InputIQ interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = IQ(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);

            %% Initialize properties
            try
                obj.Power = instrument.driver.AgXSAnBasic.DeviceSpecific.Input.IQ.Power(obj.interface.Power);
            catch %#ok<CTCH>
            end

            try
                obj.Voltage = instrument.driver.AgXSAnBasic.DeviceSpecific.Input.IQ.Voltage(obj.interface.Voltage);
            catch %#ok<CTCH>
            end

        end
        
        function delete(obj)
            obj.Power = [];
            obj.Voltage = [];
        end

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

        %% Power property access methods
        function value = get.Power(obj)
            obj.checkValidObj();
            if isempty(obj.Power)
                try
                    obj.Power = instrument.driver.AgXSAnBasic.DeviceSpecific.Input.IQ.Power(obj.interface.Power);
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
                    obj.Voltage = instrument.driver.AgXSAnBasic.DeviceSpecific.Input.IQ.Voltage(obj.interface.Voltage);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Voltage;
        end

    end

end
