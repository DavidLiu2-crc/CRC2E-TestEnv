classdef Offset2 < instrument.ivicom.Interface
    %OFFSET2 IAgXSAnSASEMaskOffset2 interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Offset2(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);

            %% Initialize properties
            try
                obj.List2 = instrument.driver.AgXSAn.DeviceSpecific.SA3.SEMask2.Offset2.List2(obj.interface.List2);
            catch %#ok<CTCH>
            end

            try
                obj.Filter = instrument.driver.AgXSAn.DeviceSpecific.SA3.SEMask2.Offset2.Filter(obj.interface.Filter);
            catch %#ok<CTCH>
            end

            try
                obj.List = instrument.driver.AgXSAn.DeviceSpecific.SA3.SEMask2.Offset2.List(obj.interface.List);
            catch %#ok<CTCH>
            end

        end
        
        function delete(obj)
            obj.List2 = [];
            obj.Filter = [];
            obj.List = [];
        end

    end
    
    %% Public Properties
    properties

        %DETECTORTYPE Selects the detector mode for the offsets.
        DetectorType

        %DETECTORTYPEAUTOENABLED Sets the detector to the default detection mode for the offsets. This mode is dependent upon the current signal conditions of the offsets.
        DetectorTypeAutoEnabled

        %TYPE Selects/Queries Offset definition. Each standard defines each Offset from Carrier
        Type

    end

    %% Public Read Only Properties
    properties (SetAccess = private)

        %LIST2 Pointer to IAgXSAnSASEMaskOffsetList interface. Read Only.
        List2

        %FILTER Pointer to IAgXSAnSASEMaskOffsetFilter interface. Read Only.
        Filter

        %LIST Pointer to IAgXSAnSASEMaskOffsetList interface. Read Only.
        List

    end

    %% Property access methods
    methods

        %% List2 property access methods
        function value = get.List2(obj)
            obj.checkValidObj();
            if isempty(obj.List2)
                try
                    obj.List2 = instrument.driver.AgXSAn.DeviceSpecific.SA3.SEMask2.Offset2.List2(obj.interface.List2);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.List2;
        end

        %% Filter property access methods
        function value = get.Filter(obj)
            obj.checkValidObj();
            if isempty(obj.Filter)
                try
                    obj.Filter = instrument.driver.AgXSAn.DeviceSpecific.SA3.SEMask2.Offset2.Filter(obj.interface.Filter);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Filter;
        end

        %% DetectorType property access methods
        function value = get.DetectorType(obj)
            obj.checkValidObj();
            try
                value = obj.interface.DetectorType;
            catch e
                obj.interpretError(e);
            end
        end
		function set.DetectorType(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.DetectorType = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% DetectorTypeAutoEnabled property access methods
        function value = get.DetectorTypeAutoEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.DetectorTypeAutoEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.DetectorTypeAutoEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'DetectorTypeAutoEnabled');
            try
                obj.interface.DetectorTypeAutoEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% List property access methods
        function value = get.List(obj)
            obj.checkValidObj();
            if isempty(obj.List)
                try
                    obj.List = instrument.driver.AgXSAn.DeviceSpecific.SA3.SEMask2.Offset2.List(obj.interface.List);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.List;
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
