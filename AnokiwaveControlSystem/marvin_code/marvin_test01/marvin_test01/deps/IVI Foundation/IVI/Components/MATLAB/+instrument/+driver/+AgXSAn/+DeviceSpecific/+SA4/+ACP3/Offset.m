classdef Offset < instrument.ivicom.Interface
    %OFFSET IAgXSAnSAACPOffset interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Offset(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);

            %% Initialize properties
            try
                obj.List = instrument.driver.AgXSAn.DeviceSpecific.SA4.ACP3.Offset.List(obj.interface.List);
            catch %#ok<CTCH>
            end

            try
                obj.Filter = instrument.driver.AgXSAn.DeviceSpecific.SA4.ACP3.Offset.Filter(obj.interface.Filter);
            catch %#ok<CTCH>
            end

        end
        
        function delete(obj)
            obj.List = [];
            obj.Filter = [];
        end

    end
    
    %% Public Properties
    properties

        %TYPE The Offset definition. Each standard defines each Offset from Carrier.
        Type

    end

    %% Public Read Only Properties
    properties (SetAccess = private)

        %LIST Pointer to IAgXSAnSAACPOffsetList interface. Read Only.
        List

        %FILTER Pointer to IAgXSAnSAACPOffsetFilter interface. Read Only.
        Filter

    end

    %% Property access methods
    methods

        %% List property access methods
        function value = get.List(obj)
            obj.checkValidObj();
            if isempty(obj.List)
                try
                    obj.List = instrument.driver.AgXSAn.DeviceSpecific.SA4.ACP3.Offset.List(obj.interface.List);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.List;
        end

        %% Filter property access methods
        function value = get.Filter(obj)
            obj.checkValidObj();
            if isempty(obj.Filter)
                try
                    obj.Filter = instrument.driver.AgXSAn.DeviceSpecific.SA4.ACP3.Offset.Filter(obj.interface.Filter);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Filter;
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
