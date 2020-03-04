classdef Input < instrument.ivicom.Interface
    %INPUT IAgXSAnInput interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Input(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);

            %% Initialize properties
            try
                obj.IF = instrument.driver.AgXSAn.DeviceSpecific.Input.IF(obj.interface.IF);
            catch %#ok<CTCH>
            end

            try
                obj.RF = instrument.driver.AgXSAn.DeviceSpecific.Input.RF(obj.interface.RF);
            catch %#ok<CTCH>
            end

        end
        
        function delete(obj)
            obj.IF = [];
            obj.RF = [];
        end

    end
    
    %% Public Properties
    properties

        %AMPLITUDEREFERENCE Sets/Gets the RF Calibrator type.
        AmplitudeReference

        %PORT Sets the signal input path to be the RF input on the front panel or the internal amplitude reference.
        Port

        %TYPE Selects the RF input port.
        Type

    end

    %% Public Read Only Properties
    properties (SetAccess = private)

        %IF Pointer to IAgXSAnInputIF interface. Read Only.
        IF

        %RF Pointer to IAgXSAnInputRF interface. Read Only.
        RF

    end

    %% Property access methods
    methods

        %% AmplitudeReference property access methods
        function value = get.AmplitudeReference(obj)
            obj.checkValidObj();
            try
                value = obj.interface.AmplitudeReference;
            catch e
                obj.interpretError(e);
            end
        end
		function set.AmplitudeReference(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.AmplitudeReference = newValue;
            catch e
                obj.interpretError(e);
            end
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

        %% IF property access methods
        function value = get.IF(obj)
            obj.checkValidObj();
            if isempty(obj.IF)
                try
                    obj.IF = instrument.driver.AgXSAn.DeviceSpecific.Input.IF(obj.interface.IF);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.IF;
        end

        %% RF property access methods
        function value = get.RF(obj)
            obj.checkValidObj();
            if isempty(obj.RF)
                try
                    obj.RF = instrument.driver.AgXSAn.DeviceSpecific.Input.RF(obj.interface.RF);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.RF;
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

    end

end
