classdef PowerStatistics < instrument.ivicom.Interface
    %POWERSTATISTICS IAgXSAnSAPowerStatistics interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = PowerStatistics(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);

            %% Initialize properties
            try
                obj.Traces = instrument.driver.AgXSAn.DeviceSpecific.SA4.PowerStatistics.Traces(obj.interface.Traces);
            catch %#ok<CTCH>
            end

            try
                obj.Display = instrument.driver.AgXSAn.DeviceSpecific.SA4.PowerStatistics.Display(obj.interface.Display);
            catch %#ok<CTCH>
            end

            try
                obj.SweepCoupling = instrument.driver.AgXSAn.DeviceSpecific.SA4.PowerStatistics.SweepCoupling(obj.interface.SweepCoupling);
            catch %#ok<CTCH>
            end

            try
                obj.Marker = instrument.driver.AgXSAn.DeviceSpecific.SA4.PowerStatistics.Marker(obj.interface.Marker);
            catch %#ok<CTCH>
            end

        end
        
        function delete(obj)
            obj.Traces = [];
            obj.Display = [];
            obj.SweepCoupling = [];
            obj.Marker = [];
        end

    end
    
    %% Public Properties
    properties

        %SAMPLINGCOUNT Sets/Gets the accumulated number of sampling points for data acquisition.
        SamplingCount

        %TRIGGERSOURCE Sets/Gets the source of the trigger.
        TriggerSource

        %CHANNELBANDWIDTH Sets/Gets channel bandwidth that will be used for data acquisition
        ChannelBandwidth

        %IFGAIN Selects the range of the IF Gain.
        IFGain

        %IFGAINAUTOENABLED Activates the auto rules for IF Gain. When Auto is active, the IF Gain is set to High Gain under any of the following conditions: The input attenuator is set to 0 dB The preamp is turned On and the frequency range is under 3.6 GHz For other settings, Auto sets the IF Gain to Low Gain.
        IFGainAutoEnabled

    end

    %% Public Read Only Properties
    properties (SetAccess = private)

        %TRACES Pointer to the IAgXSAnSAPowerStatisticsTraces interface. Read Only.
        Traces

        %DISPLAY Pointer to IAgXSAnSAPowerStatisticsDisplay interface. Read Only.
        Display

        %SWEEPCOUPLING Pointer to IAgXSAnSAPowerStatisticsSweepCoupling interface. Read Only.
        SweepCoupling

        %MARKER Pointer to IAgXSAnSAPowerStatisticsMarker interface. Read Only.
        Marker

    end

    %% Property access methods
    methods

        %% SamplingCount property access methods
        function value = get.SamplingCount(obj)
            obj.checkValidObj();
            try
                value = obj.interface.SamplingCount;
            catch e
                obj.interpretError(e);
            end
        end
		function set.SamplingCount(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarInt32Arg(newValue,'SamplingCount');
            try
                obj.interface.SamplingCount = newValue;
            catch e
                obj.interpretError(e);
            end
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

        %% ChannelBandwidth property access methods
        function value = get.ChannelBandwidth(obj)
            obj.checkValidObj();
            try
                value = obj.interface.ChannelBandwidth;
            catch e
                obj.interpretError(e);
            end
        end
		function set.ChannelBandwidth(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'ChannelBandwidth');
            try
                obj.interface.ChannelBandwidth = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Traces property access methods
        function value = get.Traces(obj)
            obj.checkValidObj();
            if isempty(obj.Traces)
                try
                    obj.Traces = instrument.driver.AgXSAn.DeviceSpecific.SA4.PowerStatistics.Traces(obj.interface.Traces);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Traces;
        end

        %% Display property access methods
        function value = get.Display(obj)
            obj.checkValidObj();
            if isempty(obj.Display)
                try
                    obj.Display = instrument.driver.AgXSAn.DeviceSpecific.SA4.PowerStatistics.Display(obj.interface.Display);
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
                    obj.SweepCoupling = instrument.driver.AgXSAn.DeviceSpecific.SA4.PowerStatistics.SweepCoupling(obj.interface.SweepCoupling);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.SweepCoupling;
        end

        %% Marker property access methods
        function value = get.Marker(obj)
            obj.checkValidObj();
            if isempty(obj.Marker)
                try
                    obj.Marker = instrument.driver.AgXSAn.DeviceSpecific.SA4.PowerStatistics.Marker(obj.interface.Marker);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Marker;
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
            %CONFIGURE Restores all the measurement parameters of Power Statistics measurement to their default values.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.Configure();
            catch e
                obj.interpretError(e);
            end
        end

        function ConfigureNoPreset(obj)
            %CONFIGURENOPRESET Selects power statistics measurement as current measurement but does not restore its parameters to their default values.
            
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
