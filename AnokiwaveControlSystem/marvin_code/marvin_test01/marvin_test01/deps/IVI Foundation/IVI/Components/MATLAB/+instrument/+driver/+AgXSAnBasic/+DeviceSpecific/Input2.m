classdef Input2 < instrument.ivicom.Interface
    %INPUT2 IAgXSAnBasicInput2 interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Input2(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);

            %% Initialize properties
            try
                obj.IQ2 = instrument.driver.AgXSAnBasic.DeviceSpecific.Input2.IQ2(obj.interface.IQ2);
            catch %#ok<CTCH>
            end

            try
                obj.IQ = instrument.driver.AgXSAnBasic.DeviceSpecific.Input2.IQ(obj.interface.IQ);
            catch %#ok<CTCH>
            end

            try
                obj.RF = instrument.driver.AgXSAnBasic.DeviceSpecific.Input2.RF(obj.interface.RF);
            catch %#ok<CTCH>
            end

            try
                obj.IF = instrument.driver.AgXSAnBasic.DeviceSpecific.Input2.IF(obj.interface.IF);
            catch %#ok<CTCH>
            end

        end
        
        function delete(obj)
            obj.IQ2 = [];
            obj.IQ = [];
            obj.RF = [];
            obj.IF = [];
        end

    end
    
    %% Public Properties
    properties

        %PORT Selects the input signal.
        Port

    end

    %% Public Read Only Properties
    properties (SetAccess = private)

        %IQ2 Pointer to the IAgXSAnBasicInputIQ interface. Read Only.
        IQ2

        %IQ Pointer to the IAgXSAnBasicInputIQ interface. Read Only.
        IQ

        %RF Pointer to the IAgXSAnBasicInputRF interface. Read Only.
        RF

        %IF Pointer to the IAgXSAnBasicInputIF interface. Read Only.
        IF

    end

    %% Property access methods
    methods

        %% IQ2 property access methods
        function value = get.IQ2(obj)
            obj.checkValidObj();
            if isempty(obj.IQ2)
                try
                    obj.IQ2 = instrument.driver.AgXSAnBasic.DeviceSpecific.Input2.IQ2(obj.interface.IQ2);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.IQ2;
        end

        %% IQ property access methods
        function value = get.IQ(obj)
            obj.checkValidObj();
            if isempty(obj.IQ)
                try
                    obj.IQ = instrument.driver.AgXSAnBasic.DeviceSpecific.Input2.IQ(obj.interface.IQ);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.IQ;
        end

        %% Port property access methods
        function value = get.Port(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Port;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Port(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.Port = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% RF property access methods
        function value = get.RF(obj)
            obj.checkValidObj();
            if isempty(obj.RF)
                try
                    obj.RF = instrument.driver.AgXSAnBasic.DeviceSpecific.Input2.RF(obj.interface.RF);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.RF;
        end

        %% IF property access methods
        function value = get.IF(obj)
            obj.checkValidObj();
            if isempty(obj.IF)
                try
                    obj.IF = instrument.driver.AgXSAnBasic.DeviceSpecific.Input2.IF(obj.interface.IF);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.IF;
        end

    end

end
