classdef SpuriousEmissions2 < instrument.ivicom.Interface
    %SPURIOUSEMISSIONS2 IAgXSAnSASpuriousEmissions2 interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = SpuriousEmissions2(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);

            %% Initialize properties
            try
                obj.Display2 = instrument.driver.AgXSAn.DeviceSpecific.SA4.SpuriousEmissions2.Display2(obj.interface.Display2);
            catch %#ok<CTCH>
            end

            try
                obj.RangeTable2 = instrument.driver.AgXSAn.DeviceSpecific.SA4.SpuriousEmissions2.RangeTable2(obj.interface.RangeTable2);
            catch %#ok<CTCH>
            end

            try
                obj.Traces = instrument.driver.AgXSAn.DeviceSpecific.SA4.SpuriousEmissions2.Traces(obj.interface.Traces);
            catch %#ok<CTCH>
            end

            try
                obj.Average = instrument.driver.AgXSAn.DeviceSpecific.SA4.SpuriousEmissions2.Average(obj.interface.Average);
            catch %#ok<CTCH>
            end

            try
                obj.Display = instrument.driver.AgXSAn.DeviceSpecific.SA4.SpuriousEmissions2.Display(obj.interface.Display);
            catch %#ok<CTCH>
            end

            try
                obj.Marker = instrument.driver.AgXSAn.DeviceSpecific.SA4.SpuriousEmissions2.Marker(obj.interface.Marker);
            catch %#ok<CTCH>
            end

            try
                obj.RangeTable = instrument.driver.AgXSAn.DeviceSpecific.SA4.SpuriousEmissions2.RangeTable(obj.interface.RangeTable);
            catch %#ok<CTCH>
            end

        end
        
        function delete(obj)
            obj.Display2 = [];
            obj.RangeTable2 = [];
            obj.Traces = [];
            obj.Average = [];
            obj.Display = [];
            obj.Marker = [];
            obj.RangeTable = [];
        end

    end
    
    %% Public Properties
    properties

        %FASTMEASUREMENTENABLED When set to true, only spurs above the limit line will be reported. When set to false, all detected spurs will be reported.
        FastMeasurementEnabled

        %MEASUREMENTTYPE Changes/Queries the reference used for the measurement. This allows you to make absolute and relative power measurements of either total power or the power normalized to the measurement bandwidth.
        MeasurementType

        %REPORTMODE Sets/Gets the spurious report mode.
        ReportMode

        %TRIGGERSOURCE Sets/Gets the source of the trigger.
        TriggerSource

    end

    %% Public Read Only Properties
    properties (SetAccess = private)

        %DISPLAY2 Pointer to IAgXSAnSASpuriousEmissionsDisplay interface. Read Only.
        Display2

        %RANGETABLE2 Pointer to IAgXSAnSASpuriousEmissionsRangeTable interface. Read Only.
        RangeTable2

        %TRACES Pointer to the IAgXSAnSASpuriousEmissionsTraces interface. Read Only.
        Traces

        %AVERAGE Pointer to IAgXSAnSASpuriousEmissionsAverage interface. Read Only.
        Average

        %LIMITTESTFAILSTATE Queries the status of the current measurement limit testing. It returns a 0 if the measured results pass when compared with the current limits. It returns a 1 if the measured results fail any limit tests. Read Only.
        LimitTestFailState

        %DISPLAY Pointer to IAgXSAnSASpuriousEmissionsDisplay interface. Read Only.
        Display

        %MARKER Pointer to IAgXSAnSASpuriousEmissionsMarker interface. Read Only.
        Marker

        %RANGETABLE Pointer to IAgXSAnSASpuriousEmissionsRangeTable interface. Read Only.
        RangeTable

    end

    %% Property access methods
    methods

        %% Display2 property access methods
        function value = get.Display2(obj)
            obj.checkValidObj();
            if isempty(obj.Display2)
                try
                    obj.Display2 = instrument.driver.AgXSAn.DeviceSpecific.SA4.SpuriousEmissions2.Display2(obj.interface.Display2);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Display2;
        end

        %% RangeTable2 property access methods
        function value = get.RangeTable2(obj)
            obj.checkValidObj();
            if isempty(obj.RangeTable2)
                try
                    obj.RangeTable2 = instrument.driver.AgXSAn.DeviceSpecific.SA4.SpuriousEmissions2.RangeTable2(obj.interface.RangeTable2);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.RangeTable2;
        end

        %% Traces property access methods
        function value = get.Traces(obj)
            obj.checkValidObj();
            if isempty(obj.Traces)
                try
                    obj.Traces = instrument.driver.AgXSAn.DeviceSpecific.SA4.SpuriousEmissions2.Traces(obj.interface.Traces);
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
                    obj.Average = instrument.driver.AgXSAn.DeviceSpecific.SA4.SpuriousEmissions2.Average(obj.interface.Average);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Average;
        end

        %% FastMeasurementEnabled property access methods
        function value = get.FastMeasurementEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.FastMeasurementEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.FastMeasurementEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'FastMeasurementEnabled');
            try
                obj.interface.FastMeasurementEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% LimitTestFailState property access methods
        function value = get.LimitTestFailState(obj)
            obj.checkValidObj();
            try
                value = obj.interface.LimitTestFailState;
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

        %% ReportMode property access methods
        function value = get.ReportMode(obj)
            obj.checkValidObj();
            try
                value = obj.interface.ReportMode;
            catch e
                obj.interpretError(e);
            end
        end
		function set.ReportMode(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.ReportMode = newValue;
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

        %% Display property access methods
        function value = get.Display(obj)
            obj.checkValidObj();
            if isempty(obj.Display)
                try
                    obj.Display = instrument.driver.AgXSAn.DeviceSpecific.SA4.SpuriousEmissions2.Display(obj.interface.Display);
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
                    obj.Marker = instrument.driver.AgXSAn.DeviceSpecific.SA4.SpuriousEmissions2.Marker(obj.interface.Marker);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Marker;
        end

        %% RangeTable property access methods
        function value = get.RangeTable(obj)
            obj.checkValidObj();
            if isempty(obj.RangeTable)
                try
                    obj.RangeTable = instrument.driver.AgXSAn.DeviceSpecific.SA4.SpuriousEmissions2.RangeTable(obj.interface.RangeTable);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.RangeTable;
        end

    end

    %% Public Methods
    methods

        function Configure(obj)
            %CONFIGURE Restores all the measurement parameters of Spurious Emissions measurement to their default values.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.Configure();
            catch e
                obj.interpretError(e);
            end
        end

        function ConfigureIFGainState(obj,State)
            %CONFIGUREIFGAINSTATE Selects the range of IF Gain.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            State = obj.checkVectorBoolArg(State,'State');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                obj.interface.ConfigureIFGainState(logical(State));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = QueryIFGainState(obj)
            %QUERYIFGAINSTATE Query the range of IF Gain.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.QueryIFGainState();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function ConfigureIFGainAutoEnabled(obj,State)
            %CONFIGUREIFGAINAUTOENABLED Activates the auto rules for IF Gain. When Auto is active, the IF Gain is set to High Gain under any of the following conditions: The input attenuator is set to 0 dB The preamp is turned On and the frequency range is under 3.6 GHz For other settings, Auto sets the IF Gain to Low Gain.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            State = obj.checkVectorBoolArg(State,'State');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                obj.interface.ConfigureIFGainAutoEnabled(logical(State));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = QueryIFGainAutoEnabled(obj)
            %QUERYIFGAINAUTOENABLED Queries the auto rules for IF Gain.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.QueryIFGainAutoEnabled();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function ConfigureNoPreset(obj)
            %CONFIGURENOPRESET Selects spurious emissions measurement as current measurement but does not restore its parameters to their default values.
            
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
