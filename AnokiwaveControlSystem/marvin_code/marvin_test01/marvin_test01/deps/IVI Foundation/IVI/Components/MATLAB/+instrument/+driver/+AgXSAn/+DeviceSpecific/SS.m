classdef SS < instrument.ivicom.Interface
    %SS IAgXSAn5SS interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = SS(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);

            %% Initialize properties
            try
                obj.DigitalModulation = instrument.driver.AgXSAn.DeviceSpecific.SS.DigitalModulation(obj.interface.DigitalModulation);
            catch %#ok<CTCH>
            end

            try
                obj.ListSequencer = instrument.driver.AgXSAn.DeviceSpecific.SS.ListSequencer(obj.interface.ListSequencer);
            catch %#ok<CTCH>
            end

            try
                obj.RFGenerator = instrument.driver.AgXSAn.DeviceSpecific.SS.RFGenerator(obj.interface.RFGenerator);
            catch %#ok<CTCH>
            end

        end
        
        function delete(obj)
            obj.DigitalModulation = [];
            obj.ListSequencer = [];
            obj.RFGenerator = [];
        end

    end
    
    %% Public Read Only Properties
    properties (SetAccess = private)

        %DIGITALMODULATION Pointer to the IAgXSAn5SSDigitalModulation interface. Read Only.
        DigitalModulation

        %LISTSEQUENCER Pointer to the IAgXSAn5SSListSequencer interface. Read Only.
        ListSequencer

        %RFGENERATOR Pointer to the IAgXSAn5SSRFGenerator interface. Read Only.
        RFGenerator

    end

    %% Property access methods
    methods

        %% DigitalModulation property access methods
        function value = get.DigitalModulation(obj)
            obj.checkValidObj();
            if isempty(obj.DigitalModulation)
                try
                    obj.DigitalModulation = instrument.driver.AgXSAn.DeviceSpecific.SS.DigitalModulation(obj.interface.DigitalModulation);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.DigitalModulation;
        end

        %% ListSequencer property access methods
        function value = get.ListSequencer(obj)
            obj.checkValidObj();
            if isempty(obj.ListSequencer)
                try
                    obj.ListSequencer = instrument.driver.AgXSAn.DeviceSpecific.SS.ListSequencer(obj.interface.ListSequencer);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.ListSequencer;
        end

        %% RFGenerator property access methods
        function value = get.RFGenerator(obj)
            obj.checkValidObj();
            if isempty(obj.RFGenerator)
                try
                    obj.RFGenerator = instrument.driver.AgXSAn.DeviceSpecific.SS.RFGenerator(obj.interface.RFGenerator);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.RFGenerator;
        end

    end

end
