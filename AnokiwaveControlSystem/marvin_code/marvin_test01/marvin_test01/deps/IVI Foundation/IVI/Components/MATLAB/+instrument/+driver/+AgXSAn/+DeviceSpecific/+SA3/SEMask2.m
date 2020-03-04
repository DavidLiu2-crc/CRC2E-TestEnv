classdef SEMask2 < instrument.ivicom.Interface
    %SEMASK2 IAgXSAnSASEMask2 interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = SEMask2(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);

            %% Initialize properties
            try
                obj.Display2 = instrument.driver.AgXSAn.DeviceSpecific.SA3.SEMask2.Display2(obj.interface.Display2);
            catch %#ok<CTCH>
            end

            try
                obj.SweepCoupling2 = instrument.driver.AgXSAn.DeviceSpecific.SA3.SEMask2.SweepCoupling2(obj.interface.SweepCoupling2);
            catch %#ok<CTCH>
            end

            try
                obj.Offset2 = instrument.driver.AgXSAn.DeviceSpecific.SA3.SEMask2.Offset2(obj.interface.Offset2);
            catch %#ok<CTCH>
            end

            try
                obj.Traces = instrument.driver.AgXSAn.DeviceSpecific.SA3.SEMask2.Traces(obj.interface.Traces);
            catch %#ok<CTCH>
            end

            try
                obj.Average = instrument.driver.AgXSAn.DeviceSpecific.SA3.SEMask2.Average(obj.interface.Average);
            catch %#ok<CTCH>
            end

            try
                obj.ReferenceChannel = instrument.driver.AgXSAn.DeviceSpecific.SA3.SEMask2.ReferenceChannel(obj.interface.ReferenceChannel);
            catch %#ok<CTCH>
            end

            try
                obj.SweepCoupling = instrument.driver.AgXSAn.DeviceSpecific.SA3.SEMask2.SweepCoupling(obj.interface.SweepCoupling);
            catch %#ok<CTCH>
            end

            try
                obj.Display = instrument.driver.AgXSAn.DeviceSpecific.SA3.SEMask2.Display(obj.interface.Display);
            catch %#ok<CTCH>
            end

            try
                obj.Marker = instrument.driver.AgXSAn.DeviceSpecific.SA3.SEMask2.Marker(obj.interface.Marker);
            catch %#ok<CTCH>
            end

            try
                obj.Offset = instrument.driver.AgXSAn.DeviceSpecific.SA3.SEMask2.Offset(obj.interface.Offset);
            catch %#ok<CTCH>
            end

        end
        
        function delete(obj)
            obj.Display2 = [];
            obj.SweepCoupling2 = [];
            obj.Offset2 = [];
            obj.Traces = [];
            obj.Average = [];
            obj.ReferenceChannel = [];
            obj.SweepCoupling = [];
            obj.Display = [];
            obj.Marker = [];
            obj.Offset = [];
        end

    end
    
    %% Public Properties
    properties

        %TRIGGERSOURCE Sets/Gets the source of the trigger.
        TriggerSource

        %MEASUREMENTTYPE Changes/Queries the reference used for the measurement. This allows you to make absolute and relative power measurements of either total power or the power normalized to the measurement bandwidth.
        MeasurementType

    end

    %% Public Read Only Properties
    properties (SetAccess = private)

        %DISPLAY2 Pointer to IAgXSAnSASEMaskDisplay interface. Read Only.
        Display2

        %SWEEPCOUPLING2 Pointer to IAgXSAnSASEMaskSweepCoupling interface. Read Only.
        SweepCoupling2

        %OFFSET2 Pointer to IAgXSAnSASEMaskOffset interface. Read Only.
        Offset2

        %TRACES Pointer to the IAgXSAnSASEMaskTraces interface. Read Only.
        Traces

        %AVERAGE Pointer to IAgXSAnSASEMaskAverage interface. Read Only.
        Average

        %REFERENCECHANNEL Pointer to IAgXSAnSASEMaskReferenceChannel interface. Read Only.
        ReferenceChannel

        %SWEEPCOUPLING Pointer to IAgXSAnSASEMaskSweepCoupling interface. Read Only.
        SweepCoupling

        %DISPLAY Pointer to IAgXSAnSASEMaskDisplay interface. Read Only.
        Display

        %MARKER Pointer to IAgXSAnSASEMaskMarker interface. Read Only.
        Marker

        %OFFSET Pointer to IAgXSAnSASEMaskOffset interface. Read Only.
        Offset

    end

    %% Property access methods
    methods

        %% Display2 property access methods
        function value = get.Display2(obj)
            obj.checkValidObj();
            if isempty(obj.Display2)
                try
                    obj.Display2 = instrument.driver.AgXSAn.DeviceSpecific.SA3.SEMask2.Display2(obj.interface.Display2);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Display2;
        end

        %% SweepCoupling2 property access methods
        function value = get.SweepCoupling2(obj)
            obj.checkValidObj();
            if isempty(obj.SweepCoupling2)
                try
                    obj.SweepCoupling2 = instrument.driver.AgXSAn.DeviceSpecific.SA3.SEMask2.SweepCoupling2(obj.interface.SweepCoupling2);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.SweepCoupling2;
        end

        %% Offset2 property access methods
        function value = get.Offset2(obj)
            obj.checkValidObj();
            if isempty(obj.Offset2)
                try
                    obj.Offset2 = instrument.driver.AgXSAn.DeviceSpecific.SA3.SEMask2.Offset2(obj.interface.Offset2);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Offset2;
        end

        %% TriggerSource property access methods
        function value = get.TriggerSource(obj)
            obj.checkValidObj();
            try
                value = obj.interface.TriggerSource;
            catch e
                obj.interpretError(e);
            end
        end
		function set.TriggerSource(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.TriggerSource = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% MeasurementType property access methods
        function value = get.MeasurementType(obj)
            obj.checkValidObj();
            try
                value = obj.interface.MeasurementType;
            catch e
                obj.interpretError(e);
            end
        end
		function set.MeasurementType(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.MeasurementType = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Traces property access methods
        function value = get.Traces(obj)
            obj.checkValidObj();
            if isempty(obj.Traces)
                try
                    obj.Traces = instrument.driver.AgXSAn.DeviceSpecific.SA3.SEMask2.Traces(obj.interface.Traces);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Traces;
        end

        %% Average property access methods
        function value = get.Average(obj)
            obj.checkValidObj();
            if isempty(obj.Average)
                try
                    obj.Average = instrument.driver.AgXSAn.DeviceSpecific.SA3.SEMask2.Average(obj.interface.Average);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Average;
        end

        %% ReferenceChannel property access methods
        function value = get.ReferenceChannel(obj)
            obj.checkValidObj();
            if isempty(obj.ReferenceChannel)
                try
                    obj.ReferenceChannel = instrument.driver.AgXSAn.DeviceSpecific.SA3.SEMask2.ReferenceChannel(obj.interface.ReferenceChannel);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.ReferenceChannel;
        end

        %% SweepCoupling property access methods
        function value = get.SweepCoupling(obj)
            obj.checkValidObj();
            if isempty(obj.SweepCoupling)
                try
                    obj.SweepCoupling = instrument.driver.AgXSAn.DeviceSpecific.SA3.SEMask2.SweepCoupling(obj.interface.SweepCoupling);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.SweepCoupling;
        end

        %% Display property access methods
        function value = get.Display(obj)
            obj.checkValidObj();
            if isempty(obj.Display)
                try
                    obj.Display = instrument.driver.AgXSAn.DeviceSpecific.SA3.SEMask2.Display(obj.interface.Display);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Display;
        end

        %% Marker property access methods
        function value = get.Marker(obj)
            obj.checkValidObj();
            if isempty(obj.Marker)
                try
                    obj.Marker = instrument.driver.AgXSAn.DeviceSpecific.SA3.SEMask2.Marker(obj.interface.Marker);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Marker;
        end

        %% Offset property access methods
        function value = get.Offset(obj)
            obj.checkValidObj();
            if isempty(obj.Offset)
                try
                    obj.Offset = instrument.driver.AgXSAn.DeviceSpecific.SA3.SEMask2.Offset(obj.interface.Offset);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Offset;
        end

    end

    %% Public Methods
    methods

        function Configure(obj)
            %CONFIGURE Restores all the measurement parameters of Spectrum Emission Mask measurement to their default values.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.Configure();
            catch e
                obj.interpretError(e);
            end
        end

        function ConfigureNoPreset(obj)
            %CONFIGURENOPRESET Selects spectrum emission measurement as current measurement but does not restore its parameters to their default values.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.ConfigureNoPreset();
            catch e
                obj.interpretError(e);
            end
        end

    end

end
