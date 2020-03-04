classdef Trigger2 < instrument.ivicom.Interface
    %TRIGGER2 IAgXSAnTrigger2 interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Trigger2(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);

            %% Initialize properties
            try
                obj.ExternalEx = instrument.driver.AgXSAn.DeviceSpecific.Trigger2.ExternalEx(obj.interface.ExternalEx);
            catch %#ok<CTCH>
            end

            try
                obj.External2Ex = instrument.driver.AgXSAn.DeviceSpecific.Trigger2.External2Ex(obj.interface.External2Ex);
            catch %#ok<CTCH>
            end

            try
                obj.External = instrument.driver.AgXSAn.DeviceSpecific.Trigger2.External(obj.interface.External);
            catch %#ok<CTCH>
            end

            try
                obj.Video = instrument.driver.AgXSAn.DeviceSpecific.Trigger2.Video(obj.interface.Video);
            catch %#ok<CTCH>
            end

            try
                obj.Sources = instrument.driver.AgXSAn.DeviceSpecific.Trigger2.Sources(obj.interface.Sources);
            catch %#ok<CTCH>
            end

            try
                obj.Alarms = instrument.driver.AgXSAn.DeviceSpecific.Trigger2.Alarms(obj.interface.Alarms);
            catch %#ok<CTCH>
            end

            try
                obj.External2 = instrument.driver.AgXSAn.DeviceSpecific.Trigger2.External2(obj.interface.External2);
            catch %#ok<CTCH>
            end

        end
        
        function delete(obj)
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

        %% ExternalEx property access methods
        function value = get.ExternalEx(obj)
            obj.checkValidObj();
            if isempty(obj.ExternalEx)
                try
                    obj.ExternalEx = instrument.driver.AgXSAn.DeviceSpecific.Trigger2.ExternalEx(obj.interface.ExternalEx);
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
                    obj.External2Ex = instrument.driver.AgXSAn.DeviceSpecific.Trigger2.External2Ex(obj.interface.External2Ex);
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
                    obj.External = instrument.driver.AgXSAn.DeviceSpecific.Trigger2.External(obj.interface.External);
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
                    obj.Video = instrument.driver.AgXSAn.DeviceSpecific.Trigger2.Video(obj.interface.Video);
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
                    obj.Sources = instrument.driver.AgXSAn.DeviceSpecific.Trigger2.Sources(obj.interface.Sources);
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
                    obj.Alarms = instrument.driver.AgXSAn.DeviceSpecific.Trigger2.Alarms(obj.interface.Alarms);
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
                    obj.External2 = instrument.driver.AgXSAn.DeviceSpecific.Trigger2.External2(obj.interface.External2);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.External2;
        end

    end

end
