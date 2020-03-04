classdef Trigger3 < instrument.ivicom.Interface
    %TRIGGER3 IAgXSAnTrigger3 interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Trigger3(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);

            %% Initialize properties
            try
                obj.RFBurst = instrument.driver.AgXSAn.DeviceSpecific.Trigger3.RFBurst(obj.interface.RFBurst);
            catch %#ok<CTCH>
            end

            try
                obj.Video2 = instrument.driver.AgXSAn.DeviceSpecific.Trigger3.Video2(obj.interface.Video2);
            catch %#ok<CTCH>
            end

            try
                obj.External2Ex2 = instrument.driver.AgXSAn.DeviceSpecific.Trigger3.External2Ex2(obj.interface.External2Ex2);
            catch %#ok<CTCH>
            end

            try
                obj.ExternalEx2 = instrument.driver.AgXSAn.DeviceSpecific.Trigger3.ExternalEx2(obj.interface.ExternalEx2);
            catch %#ok<CTCH>
            end

            try
                obj.Line = instrument.driver.AgXSAn.DeviceSpecific.Trigger3.Line(obj.interface.Line);
            catch %#ok<CTCH>
            end

            try
                obj.Frame = instrument.driver.AgXSAn.DeviceSpecific.Trigger3.Frame(obj.interface.Frame);
            catch %#ok<CTCH>
            end

            try
                obj.Auto = instrument.driver.AgXSAn.DeviceSpecific.Trigger3.Auto(obj.interface.Auto);
            catch %#ok<CTCH>
            end

            try
                obj.HoldOff = instrument.driver.AgXSAn.DeviceSpecific.Trigger3.HoldOff(obj.interface.HoldOff);
            catch %#ok<CTCH>
            end

            try
                obj.ExternalEx = instrument.driver.AgXSAn.DeviceSpecific.Trigger3.ExternalEx(obj.interface.ExternalEx);
            catch %#ok<CTCH>
            end

            try
                obj.External2Ex = instrument.driver.AgXSAn.DeviceSpecific.Trigger3.External2Ex(obj.interface.External2Ex);
            catch %#ok<CTCH>
            end

            try
                obj.External = instrument.driver.AgXSAn.DeviceSpecific.Trigger3.External(obj.interface.External);
            catch %#ok<CTCH>
            end

            try
                obj.Video = instrument.driver.AgXSAn.DeviceSpecific.Trigger3.Video(obj.interface.Video);
            catch %#ok<CTCH>
            end

            try
                obj.Sources = instrument.driver.AgXSAn.DeviceSpecific.Trigger3.Sources(obj.interface.Sources);
            catch %#ok<CTCH>
            end

            try
                obj.Alarms = instrument.driver.AgXSAn.DeviceSpecific.Trigger3.Alarms(obj.interface.Alarms);
            catch %#ok<CTCH>
            end

            try
                obj.External2 = instrument.driver.AgXSAn.DeviceSpecific.Trigger3.External2(obj.interface.External2);
            catch %#ok<CTCH>
            end

        end
        
        function delete(obj)
            obj.RFBurst = [];
            obj.Video2 = [];
            obj.External2Ex2 = [];
            obj.ExternalEx2 = [];
            obj.Line = [];
            obj.Frame = [];
            obj.Auto = [];
            obj.HoldOff = [];
            obj.ExternalEx = [];
            obj.External2Ex = [];
            obj.External = [];
            obj.Video = [];
            obj.Sources = [];
            obj.Alarms = [];
            obj.External2 = [];
        end

    end
    
    %% Public Properties
    properties

        %SOURCE Specifies the source for the trigger signal that causes the analyzer to leave the Wait-For-Trigger state.
        Source

        %COUNT Specifies the number of times a trigger has to occur to complete a measurement; that is, the number of triggers that are accepted before the measurement must be armed again.
        Count

    end

    %% Public Read Only Properties
    properties (SetAccess = private)

        %RFBURST Pointer to the IAgXSAnTrigger3RFBurst interface. Read Only.
        RFBurst

        %VIDEO2 Pointer to the IAgXSAnTriggerVideo interface Read Only.
        Video2

        %EXTERNAL2EX2 Pointer to the IAgXSAnTriggerExternal2 interface. Read Only.
        External2Ex2

        %EXTERNALEX2 Pointer to the IAgXSAnTriggerExternal interface Read Only.
        ExternalEx2

        %LINE Pointer to the IAgXSAnTrigger3Line interface. Read Only.
        Line

        %FRAME Pointer to the IAgXSAnTrigger3Frame interface. Read Only.
        Frame

        %AUTO Pointer to the IAgXSAnTrigger3Auto interface. Read Only.
        Auto

        %HOLDOFF Pointer to the IAgXSAnTrigger3HoldOff interface. Read Only.
        HoldOff

        %EXTERNALEX Pointer to the IAgXSAnTriggerExternal interface Read Only.
        ExternalEx

        %EXTERNAL2EX Pointer to the IAgXSAnTriggerExternal2 interface. Read Only.
        External2Ex

        %EXTERNAL Pointer to the IAgXSAnTriggerExternal interface Read Only.
        External

        %VIDEO Pointer to the IAgXSAnTriggerVideo interface Read Only.
        Video

        %SOURCES Pointer to the IAgXSAnTriggerSources interface. Read Only.
        Sources

        %ALARMS Pointer to the IAgXSAnTriggerAlarms interface. Read Only.
        Alarms

        %EXTERNAL2 Pointer to the IAgXSAnTriggerExternal2 interface. Read Only.
        External2

    end

    %% Property access methods
    methods

        %% RFBurst property access methods
        function value = get.RFBurst(obj)
            obj.checkValidObj();
            if isempty(obj.RFBurst)
                try
                    obj.RFBurst = instrument.driver.AgXSAn.DeviceSpecific.Trigger3.RFBurst(obj.interface.RFBurst);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.RFBurst;
        end

        %% Video2 property access methods
        function value = get.Video2(obj)
            obj.checkValidObj();
            if isempty(obj.Video2)
                try
                    obj.Video2 = instrument.driver.AgXSAn.DeviceSpecific.Trigger3.Video2(obj.interface.Video2);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Video2;
        end

        %% External2Ex2 property access methods
        function value = get.External2Ex2(obj)
            obj.checkValidObj();
            if isempty(obj.External2Ex2)
                try
                    obj.External2Ex2 = instrument.driver.AgXSAn.DeviceSpecific.Trigger3.External2Ex2(obj.interface.External2Ex2);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.External2Ex2;
        end

        %% ExternalEx2 property access methods
        function value = get.ExternalEx2(obj)
            obj.checkValidObj();
            if isempty(obj.ExternalEx2)
                try
                    obj.ExternalEx2 = instrument.driver.AgXSAn.DeviceSpecific.Trigger3.ExternalEx2(obj.interface.ExternalEx2);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.ExternalEx2;
        end

        %% Line property access methods
        function value = get.Line(obj)
            obj.checkValidObj();
            if isempty(obj.Line)
                try
                    obj.Line = instrument.driver.AgXSAn.DeviceSpecific.Trigger3.Line(obj.interface.Line);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Line;
        end

        %% Frame property access methods
        function value = get.Frame(obj)
            obj.checkValidObj();
            if isempty(obj.Frame)
                try
                    obj.Frame = instrument.driver.AgXSAn.DeviceSpecific.Trigger3.Frame(obj.interface.Frame);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Frame;
        end

        %% Auto property access methods
        function value = get.Auto(obj)
            obj.checkValidObj();
            if isempty(obj.Auto)
                try
                    obj.Auto = instrument.driver.AgXSAn.DeviceSpecific.Trigger3.Auto(obj.interface.Auto);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Auto;
        end

        %% HoldOff property access methods
        function value = get.HoldOff(obj)
            obj.checkValidObj();
            if isempty(obj.HoldOff)
                try
                    obj.HoldOff = instrument.driver.AgXSAn.DeviceSpecific.Trigger3.HoldOff(obj.interface.HoldOff);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.HoldOff;
        end

        %% ExternalEx property access methods
        function value = get.ExternalEx(obj)
            obj.checkValidObj();
            if isempty(obj.ExternalEx)
                try
                    obj.ExternalEx = instrument.driver.AgXSAn.DeviceSpecific.Trigger3.ExternalEx(obj.interface.ExternalEx);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.ExternalEx;
        end

        %% External2Ex property access methods
        function value = get.External2Ex(obj)
            obj.checkValidObj();
            if isempty(obj.External2Ex)
                try
                    obj.External2Ex = instrument.driver.AgXSAn.DeviceSpecific.Trigger3.External2Ex(obj.interface.External2Ex);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.External2Ex;
        end

        %% Source property access methods
        function value = get.Source(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Source;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Source(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.Source = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% External property access methods
        function value = get.External(obj)
            obj.checkValidObj();
            if isempty(obj.External)
                try
                    obj.External = instrument.driver.AgXSAn.DeviceSpecific.Trigger3.External(obj.interface.External);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.External;
        end

        %% Video property access methods
        function value = get.Video(obj)
            obj.checkValidObj();
            if isempty(obj.Video)
                try
                    obj.Video = instrument.driver.AgXSAn.DeviceSpecific.Trigger3.Video(obj.interface.Video);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Video;
        end

        %% Sources property access methods
        function value = get.Sources(obj)
            obj.checkValidObj();
            if isempty(obj.Sources)
                try
                    obj.Sources = instrument.driver.AgXSAn.DeviceSpecific.Trigger3.Sources(obj.interface.Sources);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Sources;
        end

        %% Count property access methods
        function value = get.Count(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Count;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Count(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarInt32Arg(newValue,'Count');
            try
                obj.interface.Count = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Alarms property access methods
        function value = get.Alarms(obj)
            obj.checkValidObj();
            if isempty(obj.Alarms)
                try
                    obj.Alarms = instrument.driver.AgXSAn.DeviceSpecific.Trigger3.Alarms(obj.interface.Alarms);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Alarms;
        end

        %% External2 property access methods
        function value = get.External2(obj)
            obj.checkValidObj();
            if isempty(obj.External2)
                try
                    obj.External2 = instrument.driver.AgXSAn.DeviceSpecific.Trigger3.External2(obj.interface.External2);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.External2;
        end

    end

end
