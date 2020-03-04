classdef Arm < instrument.ivicom.Interface
    %ARM LxiSync arm interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Arm(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);

            %% Initialize properties
            try
                obj.Sources = instrument.driver.AgXSAn.DeviceSpecific.Arm.Sources(obj.interface.Sources);
            catch %#ok<CTCH>
            end

            try
                obj.Alarms = instrument.driver.AgXSAn.DeviceSpecific.Arm.Alarms(obj.interface.Alarms);
            catch %#ok<CTCH>
            end

        end
        
        function delete(obj)
            obj.Sources = [];
            obj.Alarms = [];
        end

    end
    
    %% Public Properties
    properties

        %ARMCOUNT Specifies the number of times the arm has to occur to complete the arm loop; that is, the number of arms that are accepted before the measurement must be initiated again.
        ArmCount

        %DELAY Specifies the delay from when the arm logic satisfied until the waiting for trigger state is entered.  The units are seconds.
        Delay

    end

    %% Public Read Only Properties
    properties (SetAccess = private)

        %SOURCES Pointer to the ILxiSyncArmSources interface. Read Only.
        Sources

        %ALARMS Pointer to the IAgXSAnArmAlarms interface. Read Only.
        Alarms

    end

    %% Property access methods
    methods

        %% Sources property access methods
        function value = get.Sources(obj)
            obj.checkValidObj();
            if isempty(obj.Sources)
                try
                    obj.Sources = instrument.driver.AgXSAn.DeviceSpecific.Arm.Sources(obj.interface.Sources);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Sources;
        end

        %% ArmCount property access methods
        function value = get.ArmCount(obj)
            obj.checkValidObj();
            try
                value = obj.interface.ArmCount;
            catch e
                obj.interpretError(e);
            end
        end
		function set.ArmCount(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarInt32Arg(newValue,'ArmCount');
            try
                obj.interface.ArmCount = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Delay property access methods
        function value = get.Delay(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Delay;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Delay(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'Delay');
            try
                obj.interface.Delay = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Alarms property access methods
        function value = get.Alarms(obj)
            obj.checkValidObj();
            if isempty(obj.Alarms)
                try
                    obj.Alarms = instrument.driver.AgXSAn.DeviceSpecific.Arm.Alarms(obj.interface.Alarms);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Alarms;
        end

    end

end
