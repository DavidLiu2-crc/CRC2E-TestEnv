classdef SEMask < instrument.ivicom.Interface
    %SEMASK IAgXSAnSASEMask interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = SEMask(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);

            %% Initialize properties
            try
                obj.Traces = instrument.driver.AgXSAn.DeviceSpecific.SA4.SEMask.Traces(obj.interface.Traces);
            catch %#ok<CTCH>
            end

            try
                obj.Average = instrument.driver.AgXSAn.DeviceSpecific.SA4.SEMask.Average(obj.interface.Average);
            catch %#ok<CTCH>
            end

            try
                obj.ReferenceChannel = instrument.driver.AgXSAn.DeviceSpecific.SA4.SEMask.ReferenceChannel(obj.interface.ReferenceChannel);
            catch %#ok<CTCH>
            end

            try
                obj.SweepCoupling = instrument.driver.AgXSAn.DeviceSpecific.SA4.SEMask.SweepCoupling(obj.interface.SweepCoupling);
            catch %#ok<CTCH>
            end

            try
                obj.Display = instrument.driver.AgXSAn.DeviceSpecific.SA4.SEMask.Display(obj.interface.Display);
            catch %#ok<CTCH>
            end

            try
                obj.Marker = instrument.driver.AgXSAn.DeviceSpecific.SA4.SEMask.Marker(obj.interface.Marker);
            catch %#ok<CTCH>
            end

            try
                obj.Offset = instrument.driver.AgXSAn.DeviceSpecific.SA4.SEMask.Offset(obj.interface.Offset);
            catch %#ok<CTCH>
            end

        end
        
        function delete(obj)
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
                    obj.Traces = instrument.driver.AgXSAn.DeviceSpecific.SA4.SEMask.Traces(obj.interface.Traces);
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
                    obj.Average = instrument.driver.AgXSAn.DeviceSpecific.SA4.SEMask.Average(obj.interface.Average);
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
                    obj.ReferenceChannel = instrument.driver.AgXSAn.DeviceSpecific.SA4.SEMask.ReferenceChannel(obj.interface.ReferenceChannel);
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
                    obj.SweepCoupling = instrument.driver.AgXSAn.DeviceSpecific.SA4.SEMask.SweepCoupling(obj.interface.SweepCoupling);
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
                    obj.Display = instrument.driver.AgXSAn.DeviceSpecific.SA4.SEMask.Display(obj.interface.Display);
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
                    obj.Marker = instrument.driver.AgXSAn.DeviceSpecific.SA4.SEMask.Marker(obj.interface.Marker);
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
                    obj.Offset = instrument.driver.AgXSAn.DeviceSpecific.SA4.SEMask.Offset(obj.interface.Offset);
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
