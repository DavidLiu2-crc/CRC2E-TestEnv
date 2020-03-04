classdef Output2 < instrument.ivicom.Interface
    %OUTPUT2 IAgXSAnOutput2 interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Output2(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %TYPE Selects the RF output port.
        Type

        %ANALOGTYPE Selects the signal fed to the ?Analog Out? connector on the analyzer rear panel
        AnalogType

        %ANALOGAUTOTYPEENABLED Selects the Auto state for the Analog Output menu.
        AnalogAutoTypeEnabled

        %AUXILIARYIFTYPE Controls the signals that appear on the SMA output on the rear panel labeled ?AUX IF OUT?.
        AuxiliaryIFType

        %ARBITRARYIF Specifies the value of the Arbitrary IF at the aux output.
        ArbitraryIF

    end

    %% Property access methods
    methods

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

        %% AnalogType property access methods
        function value = get.AnalogType(obj)
            obj.checkValidObj();
            try
                value = obj.interface.AnalogType;
            catch e
                obj.interpretError(e);
            end
        end
		function set.AnalogType(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.AnalogType = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% AnalogAutoTypeEnabled property access methods
        function value = get.AnalogAutoTypeEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.AnalogAutoTypeEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.AnalogAutoTypeEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'AnalogAutoTypeEnabled');
            try
                obj.interface.AnalogAutoTypeEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% AuxiliaryIFType property access methods
        function value = get.AuxiliaryIFType(obj)
            obj.checkValidObj();
            try
                value = obj.interface.AuxiliaryIFType;
            catch e
                obj.interpretError(e);
            end
        end
		function set.AuxiliaryIFType(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.AuxiliaryIFType = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% ArbitraryIF property access methods
        function value = get.ArbitraryIF(obj)
            obj.checkValidObj();
            try
                value = obj.interface.ArbitraryIF;
            catch e
                obj.interpretError(e);
            end
        end
		function set.ArbitraryIF(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'ArbitraryIF');
            try
                obj.interface.ArbitraryIF = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

end
