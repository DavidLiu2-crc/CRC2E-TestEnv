classdef ChannelPower2 < instrument.ivicom.Interface
    %CHANNELPOWER2 IAgXSAnSAChannelPower2 interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = ChannelPower2(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);

            %% Initialize properties
            try
                obj.Traces2 = instrument.driver.AgXSAn.DeviceSpecific.SA4.ChannelPower2.Traces2(obj.interface.Traces2);
            catch %#ok<CTCH>
            end

            try
                obj.Traces = instrument.driver.AgXSAn.DeviceSpecific.SA4.ChannelPower2.Traces(obj.interface.Traces);
            catch %#ok<CTCH>
            end

            try
                obj.Average = instrument.driver.AgXSAn.DeviceSpecific.SA4.ChannelPower2.Average(obj.interface.Average);
            catch %#ok<CTCH>
            end

            try
                obj.Frequency = instrument.driver.AgXSAn.DeviceSpecific.SA4.ChannelPower2.Frequency(obj.interface.Frequency);
            catch %#ok<CTCH>
            end

            try
                obj.OffsetFilter = instrument.driver.AgXSAn.DeviceSpecific.SA4.ChannelPower2.OffsetFilter(obj.interface.OffsetFilter);
            catch %#ok<CTCH>
            end

            try
                obj.Marker = instrument.driver.AgXSAn.DeviceSpecific.SA4.ChannelPower2.Marker(obj.interface.Marker);
            catch %#ok<CTCH>
            end

            try
                obj.Display = instrument.driver.AgXSAn.DeviceSpecific.SA4.ChannelPower2.Display(obj.interface.Display);
            catch %#ok<CTCH>
            end

            try
                obj.SweepCoupling = instrument.driver.AgXSAn.DeviceSpecific.SA4.ChannelPower2.SweepCoupling(obj.interface.SweepCoupling);
            catch %#ok<CTCH>
            end

        end
        
        function delete(obj)
            obj.Traces2 = [];
            obj.Traces = [];
            obj.Average = [];
            obj.Frequency = [];
            obj.OffsetFilter = [];
            obj.Marker = [];
            obj.Display = [];
            obj.SweepCoupling = [];
        end

    end
    
    %% Public Properties
    properties

        %LIMIT Threshold that can judge whether the real measured channel power can be passed or not.
        Limit

        %LIMITENABLED Enable/Disable Power Limit.
        LimitEnabled

        %PSDLIMIT Threshold that can judge whether the real measured PSD can be passed or not.
        PSDLimit

        %PSDLIMITENABLED Enabled/Disabled PSD Limit
        PSDLimitEnabled

        %PSDUNIT Sets the unit bandwidth for Power Spectral Density.
        PSDUnit

        %DETECTORTYPE Sets/Gets a detector to be used by the analyzer for the Channel Power measurement.
        DetectorType

        %DETECTORTYPEAUTOENABLED Sets/Gets the detector for the currently selected trace to auto.
        DetectorTypeAutoEnabled

        %TRIGGERSOURCE Sets the source of the trigger.
        TriggerSource

        %IFGAIN Selects the range of the IF Gain.
        IFGain

        %IFGAINAUTOENABLED Activates the auto rules for IF Gain. When Auto is active, the IF Gain is set to High Gain under any of the following conditions: The input attenuator is set to 0 dB The preamp is turned On and the frequency range is under 3.6 GHz For other settings, Auto sets the IF Gain to Low Gain.
        IFGainAutoEnabled

    end

    %% Public Read Only Properties
    properties (SetAccess = private)

        %TRACES2 Pointer to the IAgXSAnSAChannelPowerTraces interface. Read Only.
        Traces2

        %TRACES Pointer to the IAgXSAnSAChannelPowerTraces interface. Read Only.
        Traces

        %AVERAGE Pointer to IAgXSAnSAChannelPowerAverage interface. Read Only.
        Average

        %FREQUENCY Pointer to IAgXSAnSAChannelPowerFrequency interface. Read Only.
        Frequency

        %OFFSETFILTER Pointer to IAgXSAnSAChannelPowerOffsetFilter. Read Only.
        OffsetFilter

        %MARKER Pointer to IAgXSAnSAChannelPowerMarker interface. Read Only.
        Marker

        %DISPLAY Pointer to IAgXSAnSAChannelPowerDisplay interface. Read Only.
        Display

        %SWEEPCOUPLING Pointer to IAgXSAnSAChannelPowerSweepCoupling interface. Read Only.
        SweepCoupling

    end

    %% Property access methods
    methods

        %% Limit property access methods
        function value = get.Limit(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Limit;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Limit(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'Limit');
            try
                obj.interface.Limit = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% LimitEnabled property access methods
        function value = get.LimitEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.LimitEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.LimitEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'LimitEnabled');
            try
                obj.interface.LimitEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% PSDLimit property access methods
        function value = get.PSDLimit(obj)
            obj.checkValidObj();
            try
                value = obj.interface.PSDLimit;
            catch e
                obj.interpretError(e);
            end
        end
		function set.PSDLimit(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'PSDLimit');
            try
                obj.interface.PSDLimit = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% PSDLimitEnabled property access methods
        function value = get.PSDLimitEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.PSDLimitEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.PSDLimitEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'PSDLimitEnabled');
            try
                obj.interface.PSDLimitEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% PSDUnit property access methods
        function value = get.PSDUnit(obj)
            obj.checkValidObj();
            try
                value = obj.interface.PSDUnit;
            catch e
                obj.interpretError(e);
            end
        end
		function set.PSDUnit(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.PSDUnit = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Traces2 property access methods
        function value = get.Traces2(obj)
            obj.checkValidObj();
            if isempty(obj.Traces2)
                try
                    obj.Traces2 = instrument.driver.AgXSAn.DeviceSpecific.SA4.ChannelPower2.Traces2(obj.interface.Traces2);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Traces2;
        end

        %% Traces property access methods
        function value = get.Traces(obj)
            obj.checkValidObj();
            if isempty(obj.Traces)
                try
                    obj.Traces = instrument.driver.AgXSAn.DeviceSpecific.SA4.ChannelPower2.Traces(obj.interface.Traces);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Traces;
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

        %% Average property access methods
        function value = get.Average(obj)
            obj.checkValidObj();
            if isempty(obj.Average)
                try
                    obj.Average = instrument.driver.AgXSAn.DeviceSpecific.SA4.ChannelPower2.Average(obj.interface.Average);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Average;
        end

        %% Frequency property access methods
        function value = get.Frequency(obj)
            obj.checkValidObj();
            if isempty(obj.Frequency)
                try
                    obj.Frequency = instrument.driver.AgXSAn.DeviceSpecific.SA4.ChannelPower2.Frequency(obj.interface.Frequency);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Frequency;
        end

        %% OffsetFilter property access methods
        function value = get.OffsetFilter(obj)
            obj.checkValidObj();
            if isempty(obj.OffsetFilter)
                try
                    obj.OffsetFilter = instrument.driver.AgXSAn.DeviceSpecific.SA4.ChannelPower2.OffsetFilter(obj.interface.OffsetFilter);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.OffsetFilter;
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

        %% Marker property access methods
        function value = get.Marker(obj)
            obj.checkValidObj();
            if isempty(obj.Marker)
                try
                    obj.Marker = instrument.driver.AgXSAn.DeviceSpecific.SA4.ChannelPower2.Marker(obj.interface.Marker);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Marker;
        end

        %% Display property access methods
        function value = get.Display(obj)
            obj.checkValidObj();
            if isempty(obj.Display)
                try
                    obj.Display = instrument.driver.AgXSAn.DeviceSpecific.SA4.ChannelPower2.Display(obj.interface.Display);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Display;
        end

        %% SweepCoupling property access methods
        function value = get.SweepCoupling(obj)
            obj.checkValidObj();
            if isempty(obj.SweepCoupling)
                try
                    obj.SweepCoupling = instrument.driver.AgXSAn.DeviceSpecific.SA4.ChannelPower2.SweepCoupling(obj.interface.SweepCoupling);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.SweepCoupling;
        end

        %% IFGain property access methods
        function value = get.IFGain(obj)
            obj.checkValidObj();
            try
                value = obj.interface.IFGain;
            catch e
                obj.interpretError(e);
            end
        end
		function set.IFGain(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'IFGain');
            try
                obj.interface.IFGain = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% IFGainAutoEnabled property access methods
        function value = get.IFGainAutoEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.IFGainAutoEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.IFGainAutoEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'IFGainAutoEnabled');
            try
                obj.interface.IFGainAutoEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

    %% Public Methods
    methods

        function Configure(obj)
            %CONFIGURE Restores all the measurement parameters of Channel Power measurement to their default values.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.Configure();
            catch e
                obj.interpretError(e);
            end
        end

        function ConfigureNoPreset(obj)
            %CONFIGURENOPRESET Selects Channel Power measurement as current measurement but does not restore its parameters to their default values.
            
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
