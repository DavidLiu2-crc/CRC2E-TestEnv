classdef DigitalModulation < instrument.ivicom.Interface
    %DIGITALMODULATION IAgXSAn5SSDigitalModulation interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = DigitalModulation(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);

            %% Initialize properties
            try
                obj.Arb = instrument.driver.AgXSAn.DeviceSpecific.SS.DigitalModulation.Arb(obj.interface.Arb);
            catch %#ok<CTCH>
            end

            try
                obj.Base = instrument.driver.AgXSAn.DeviceSpecific.SS.DigitalModulation.Base(obj.interface.Base);
            catch %#ok<CTCH>
            end

        end
        
        function delete(obj)
            obj.Arb = [];
            obj.Base = [];
        end

    end
    
    %% Public Read Only Properties
    properties (SetAccess = private)

        %ARB Pointer to the IAgXSAn5SSDigitalModulationArb interface. Read Only.
        Arb

        %BASE Pointer to the IAgXSAn5SSDigitalModulationBase interface. Read Only.
        Base

    end

    %% Property access methods
    methods

        %% Arb property access methods
        function value = get.Arb(obj)
            obj.checkValidObj();
            if isempty(obj.Arb)
                try
                    obj.Arb = instrument.driver.AgXSAn.DeviceSpecific.SS.DigitalModulation.Arb(obj.interface.Arb);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Arb;
        end

        %% Base property access methods
        function value = get.Base(obj)
            obj.checkValidObj();
            if isempty(obj.Base)
                try
                    obj.Base = instrument.driver.AgXSAn.DeviceSpecific.SS.DigitalModulation.Base(obj.interface.Base);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Base;
        end

    end

end
