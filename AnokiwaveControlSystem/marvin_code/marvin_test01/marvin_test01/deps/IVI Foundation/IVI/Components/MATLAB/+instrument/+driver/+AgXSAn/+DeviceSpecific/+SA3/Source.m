classdef Source < instrument.ivicom.Interface
    %SOURCE IAgXSAn3Source interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Source(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);

            %% Initialize properties
            try
                obj.Level = instrument.driver.AgXSAn.DeviceSpecific.SA3.Source.Level(obj.interface.Level);
            catch %#ok<CTCH>
            end

            try
                obj.Frequency = instrument.driver.AgXSAn.DeviceSpecific.SA3.Source.Frequency(obj.interface.Frequency);
            catch %#ok<CTCH>
            end

        end
        
        function delete(obj)
            obj.Level = [];
            obj.Frequency = [];
        end

    end
    
    %% Public Properties
    properties

        %RFOUTPUTENABLED Enable or disable the source RF power.
        RFOutputEnabled

        %MODE The source mode.
        Mode

        %ADDRESS Allows the programmatic user to directly define the VISA address via a string parameter.
        Address

        %POINTTRIGGERTYPE The point trigger type.
        PointTriggerType

    end

    %% Public Read Only Properties
    properties (SetAccess = private)

        %LEVEL Pointer to the IAgXSAn3SourceLevel interface. Read Only.
        Level

        %FREQUENCY Pointer to the IAgXSAn3SourceFrequency interface. Read Only.
        Frequency

    end

    %% Property access methods
    methods

        %% RFOutputEnabled property access methods
        function value = get.RFOutputEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.RFOutputEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.RFOutputEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'RFOutputEnabled');
            try
                obj.interface.RFOutputEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Level property access methods
        function value = get.Level(obj)
            obj.checkValidObj();
            if isempty(obj.Level)
                try
                    obj.Level = instrument.driver.AgXSAn.DeviceSpecific.SA3.Source.Level(obj.interface.Level);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Level;
        end

        %% Frequency property access methods
        function value = get.Frequency(obj)
            obj.checkValidObj();
            if isempty(obj.Frequency)
                try
                    obj.Frequency = instrument.driver.AgXSAn.DeviceSpecific.SA3.Source.Frequency(obj.interface.Frequency);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Frequency;
        end

        %% Mode property access methods
        function value = get.Mode(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Mode;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Mode(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.Mode = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Address property access methods
        function value = get.Address(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Address;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Address(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarStringArg(newValue,'Address');
            try
                obj.interface.Address = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% PointTriggerType property access methods
        function value = get.PointTriggerType(obj)
            obj.checkValidObj();
            try
                value = obj.interface.PointTriggerType;
            catch e
                obj.interpretError(e);
            end
        end
		function set.PointTriggerType(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.PointTriggerType = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

    %% Public Methods
    methods

        function Preset(obj)
            %PRESET Forces all the settings in the analyzer's Source State to their preset condition.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.Preset();
            catch e
                obj.interpretError(e);
            end
        end

        function val = GetSourceSettings(obj)
            %GETSOURCESETTINGS Get certain settings from the Source when the Source Mode is set to Tracking.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.GetSourceSettings();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

    end

end
