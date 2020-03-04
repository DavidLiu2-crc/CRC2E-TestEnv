classdef Radio < instrument.ivicom.Interface
    %RADIO IAgXSAnRadio interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Radio(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %DEVICE Allows the user to specify the device to be used. It is a global setting that affects the Device selection, between Mobile (MS) and Base Station (BTS) settings, for all relevant Power Suite measurements.
        Device

        %STANDARD Allows the user to specify the radio standard to be used.
        Standard

        %NONSTANDARDMEASUREMENTENABLED Allows the user to specify whether all measurements and radio standards are enabled or not.
        NonStandardMeasurementEnabled

        %BANDCLASS It enables the user to select the band class.
        BandClass

        %PACKETTYPE Sets the specific parameters for the selected measurement appropriate for industry standard Bluetooth
        PacketType

    end

    %% Property access methods
    methods

        %% Device property access methods
        function value = get.Device(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Device;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Device(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.Device = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Standard property access methods
        function value = get.Standard(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Standard;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Standard(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.Standard = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% NonStandardMeasurementEnabled property access methods
        function value = get.NonStandardMeasurementEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.NonStandardMeasurementEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.NonStandardMeasurementEnabled(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.NonStandardMeasurementEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% BandClass property access methods
        function value = get.BandClass(obj)
            obj.checkValidObj();
            try
                value = obj.interface.BandClass;
            catch e
                obj.interpretError(e);
            end
        end
		function set.BandClass(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.BandClass = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% PacketType property access methods
        function value = get.PacketType(obj)
            obj.checkValidObj();
            try
                value = obj.interface.PacketType;
            catch e
                obj.interpretError(e);
            end
        end
		function set.PacketType(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.PacketType = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

end
