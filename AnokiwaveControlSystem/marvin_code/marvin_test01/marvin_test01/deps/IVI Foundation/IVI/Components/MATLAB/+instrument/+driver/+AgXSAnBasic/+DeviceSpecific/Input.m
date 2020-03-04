classdef Input < instrument.ivicom.Interface
    %INPUT AgXSAnBasic Input interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Input(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);

            %% Initialize properties
            try
                obj.IQ = instrument.driver.AgXSAnBasic.DeviceSpecific.Input.IQ(obj.interface.IQ);
            catch %#ok<CTCH>
            end

            try
                obj.RF = instrument.driver.AgXSAnBasic.DeviceSpecific.Input.RF(obj.interface.RF);
            catch %#ok<CTCH>
            end

            try
                obj.IF = instrument.driver.AgXSAnBasic.DeviceSpecific.Input.IF(obj.interface.IF);
            catch %#ok<CTCH>
            end

        end
        
        function delete(obj)
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

        %IQ Pointer to the IAgXSAnBasicInputIQ interface. Read Only.
        IQ

        %RF Pointer to the IAgXSAnBasicInputRF interface. Read Only.
        RF

        %IF Pointer to the IAgXSAnBasicInputIF interface. Read Only.
        IF

    end

    %% Property access methods
    methods

        %% IQ property access methods
        function value = get.IQ(obj)
            obj.checkValidObj();
            if isempty(obj.IQ)
                try
                    obj.IQ = instrument.driver.AgXSAnBasic.DeviceSpecific.Input.IQ(obj.interface.IQ);
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
                    obj.RF = instrument.driver.AgXSAnBasic.DeviceSpecific.Input.RF(obj.interface.RF);
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
                    obj.IF = instrument.driver.AgXSAnBasic.DeviceSpecific.Input.IF(obj.interface.IF);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.IF;
        end

    end

end
