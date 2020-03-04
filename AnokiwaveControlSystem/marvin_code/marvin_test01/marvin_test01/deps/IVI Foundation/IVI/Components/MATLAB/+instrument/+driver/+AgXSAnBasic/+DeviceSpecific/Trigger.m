classdef Trigger < instrument.ivicom.Interface
    %TRIGGER AgXSAnBasic Trigger interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Trigger(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);

            %% Initialize properties
            try
                obj.Auto = instrument.driver.AgXSAnBasic.DeviceSpecific.Trigger.Auto(obj.interface.Auto);
            catch %#ok<CTCH>
            end

            try
                obj.External = instrument.driver.AgXSAnBasic.DeviceSpecific.Trigger.External(obj.interface.External);
            catch %#ok<CTCH>
            end

            try
                obj.External2 = instrument.driver.AgXSAnBasic.DeviceSpecific.Trigger.External2(obj.interface.External2);
            catch %#ok<CTCH>
            end

            try
                obj.Frame = instrument.driver.AgXSAnBasic.DeviceSpecific.Trigger.Frame(obj.interface.Frame);
            catch %#ok<CTCH>
            end

            try
                obj.IF = instrument.driver.AgXSAnBasic.DeviceSpecific.Trigger.IF(obj.interface.IF);
            catch %#ok<CTCH>
            end

            try
                obj.RFBurst = instrument.driver.AgXSAnBasic.DeviceSpecific.Trigger.RFBurst(obj.interface.RFBurst);
            catch %#ok<CTCH>
            end

        end
        
        function delete(obj)
            obj.Auto = [];
            obj.External = [];
            obj.External2 = [];
            obj.Frame = [];
            obj.IF = [];
            obj.RFBurst = [];
        end

    end
    
    %% Public Properties
    properties

        %HOLDOFF The holdoff time between triggers. After a trigger, another trigger will not be allowed until the holdoff time expires.
        Holdoff

        %SWEEPMODECONTINUOUSENABLED Selects whether a trigger is continuously initiated or not. Each trigger initiates a single, complete, measurement operation.
        SweepModeContinuousEnabled

    end

    %% Public Read Only Properties
    properties (SetAccess = private)

        %AUTO Pointer to the IAgXSAnBasicTriggerAuto interface. Read Only.
        Auto

        %EXTERNAL Pointer to the IAgXSAnBasicTriggerExternal interface. Read Only.
        External

        %EXTERNAL2 Pointer to the IAgXSAnBasicTriggerExternal2 interface. Read Only.
        External2

        %FRAME Pointer to the IAgXSAnBasicTriggerFrame interface. Read Only.
        Frame

        %IF Pointer to the IAgXSAnBasicTriggerIF interface. Read Only.
        IF

        %RFBURST Pointer to the IAgXSAnBasicTriggerRFBurst interface. Read Only.
        RFBurst

    end

    %% Property access methods
    methods

        %% Auto property access methods
        function value = get.Auto(obj)
            obj.checkValidObj();
            if isempty(obj.Auto)
                try
                    obj.Auto = instrument.driver.AgXSAnBasic.DeviceSpecific.Trigger.Auto(obj.interface.Auto);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Auto;
        end

        %% External property access methods
        function value = get.External(obj)
            obj.checkValidObj();
            if isempty(obj.External)
                try
                    obj.External = instrument.driver.AgXSAnBasic.DeviceSpecific.Trigger.External(obj.interface.External);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.External;
        end

        %% External2 property access methods
        function value = get.External2(obj)
            obj.checkValidObj();
            if isempty(obj.External2)
                try
                    obj.External2 = instrument.driver.AgXSAnBasic.DeviceSpecific.Trigger.External2(obj.interface.External2);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.External2;
        end

        %% Frame property access methods
        function value = get.Frame(obj)
            obj.checkValidObj();
            if isempty(obj.Frame)
                try
                    obj.Frame = instrument.driver.AgXSAnBasic.DeviceSpecific.Trigger.Frame(obj.interface.Frame);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Frame;
        end

        %% Holdoff property access methods
        function value = get.Holdoff(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Holdoff;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Holdoff(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'Holdoff');
            try
                obj.interface.Holdoff = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% IF property access methods
        function value = get.IF(obj)
            obj.checkValidObj();
            if isempty(obj.IF)
                try
                    obj.IF = instrument.driver.AgXSAnBasic.DeviceSpecific.Trigger.IF(obj.interface.IF);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.IF;
        end

        %% RFBurst property access methods
        function value = get.RFBurst(obj)
            obj.checkValidObj();
            if isempty(obj.RFBurst)
                try
                    obj.RFBurst = instrument.driver.AgXSAnBasic.DeviceSpecific.Trigger.RFBurst(obj.interface.RFBurst);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.RFBurst;
        end

        %% SweepModeContinuousEnabled property access methods
        function value = get.SweepModeContinuousEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.SweepModeContinuousEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.SweepModeContinuousEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'SweepModeContinuousEnabled');
            try
                obj.interface.SweepModeContinuousEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

end
