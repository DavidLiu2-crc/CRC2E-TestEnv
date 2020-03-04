classdef Frequency < instrument.ivicom.Interface
    %FREQUENCY AgXSAnBasic Frequency interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Frequency(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);

            %% Initialize properties
            try
                obj.IQ = instrument.driver.AgXSAnBasic.DeviceSpecific.Frequency.IQ(obj.interface.IQ);
            catch %#ok<CTCH>
            end

            try
                obj.RF = instrument.driver.AgXSAnBasic.DeviceSpecific.Frequency.RF(obj.interface.RF);
            catch %#ok<CTCH>
            end

        end
        
        function delete(obj)
            obj.IQ = [];
            obj.RF = [];
        end

    end
    
    %% Public Properties
    properties

        %CENTER Set the center frequency in Hz for the currently selected input.
        Center

    end

    %% Public Read Only Properties
    properties (SetAccess = private)

        %IQ Pointer to the IAgXSAnBasicFrequencyIQ interface. Read Only.
        IQ

        %RF Pointer to the IAgXSAnBasicFrequencyRF interface. Read Only.
        RF

    end

    %% Property access methods
    methods

        %% Center property access methods
        function value = get.Center(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Center;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Center(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'Center');
            try
                obj.interface.Center = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% IQ property access methods
        function value = get.IQ(obj)
            obj.checkValidObj();
            if isempty(obj.IQ)
                try
                    obj.IQ = instrument.driver.AgXSAnBasic.DeviceSpecific.Frequency.IQ(obj.interface.IQ);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.IQ;
        end

        %% RF property access methods
        function value = get.RF(obj)
            obj.checkValidObj();
            if isempty(obj.RF)
                try
                    obj.RF = instrument.driver.AgXSAnBasic.DeviceSpecific.Frequency.RF(obj.interface.RF);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.RF;
        end

    end

end
