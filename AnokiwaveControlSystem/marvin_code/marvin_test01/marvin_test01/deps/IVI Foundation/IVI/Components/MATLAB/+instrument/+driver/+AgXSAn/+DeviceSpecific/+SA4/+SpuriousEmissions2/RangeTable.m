classdef RangeTable < instrument.ivicom.Interface
    %RANGETABLE IAgXSAnSASpuriousEmissionsRangeTable interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = RangeTable(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);

            %% Initialize properties
            try
                obj.Start = instrument.driver.AgXSAn.DeviceSpecific.SA4.SpuriousEmissions2.RangeTable.Start(obj.interface.Start);
            catch %#ok<CTCH>
            end

            try
                obj.Stop = instrument.driver.AgXSAn.DeviceSpecific.SA4.SpuriousEmissions2.RangeTable.Stop(obj.interface.Stop);
            catch %#ok<CTCH>
            end

            try
                obj.Bandwidth = instrument.driver.AgXSAn.DeviceSpecific.SA4.SpuriousEmissions2.RangeTable.Bandwidth(obj.interface.Bandwidth);
            catch %#ok<CTCH>
            end

        end
        
        function delete(obj)
            obj.Start = [];
            obj.Stop = [];
            obj.Bandwidth = [];
        end

    end
    
    %% Public Read Only Properties
    properties (SetAccess = private)

        %START Pointer to IAgXSAnSASpuriousEmissionsRangeTableStart interface. Read Only.
        Start

        %STOP Pointer to IAgXSAnSASpuriousEmissionsRangeTableStop interface. Read Only.
        Stop

        %BANDWIDTH Pointer to IAgXSAnSASpuriousEmissionsRangeTableBandwidth interface. Read Only.
        Bandwidth

    end

    %% Property access methods
    methods

        %% Start property access methods
        function value = get.Start(obj)
            obj.checkValidObj();
            if isempty(obj.Start)
                try
                    obj.Start = instrument.driver.AgXSAn.DeviceSpecific.SA4.SpuriousEmissions2.RangeTable.Start(obj.interface.Start);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Start;
        end

        %% Stop property access methods
        function value = get.Stop(obj)
            obj.checkValidObj();
            if isempty(obj.Stop)
                try
                    obj.Stop = instrument.driver.AgXSAn.DeviceSpecific.SA4.SpuriousEmissions2.RangeTable.Stop(obj.interface.Stop);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Stop;
        end

        %% Bandwidth property access methods
        function value = get.Bandwidth(obj)
            obj.checkValidObj();
            if isempty(obj.Bandwidth)
                try
                    obj.Bandwidth = instrument.driver.AgXSAn.DeviceSpecific.SA4.SpuriousEmissions2.RangeTable.Bandwidth(obj.interface.Bandwidth);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Bandwidth;
        end

    end

    %% Public Methods
    methods

        function ConfigureAttenuation(obj,AttenuationValue)
            %CONFIGUREATTENUATION Defines attenuation value for each range.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            AttenuationValue = obj.checkVectorDoubleArg(AttenuationValue,'AttenuationValue');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                obj.interface.ConfigureAttenuation(double(AttenuationValue));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = QueryAttenuation(obj)
            %QUERYATTENUATION Queries attenuation value for each range
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.QueryAttenuation();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function ConfigurePeakExcursion(obj,RelativeAmplitude)
            %CONFIGUREPEAKEXCURSION Sets the minimum amplitude variation of signals that can be identified as peaks. If a value of 6 dB is selected, peaks that rise and fall more than 6 dB above the peak threshold value are identified. This parameter can send up to 20 values. The location in the list sent corresponds to the range of the associated value.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            RelativeAmplitude = obj.checkVectorDoubleArg(RelativeAmplitude,'RelativeAmplitude');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                obj.interface.ConfigurePeakExcursion(double(RelativeAmplitude));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = QueryPeakExcursion(obj)
            %QUERYPEAKEXCURSION Queries the minimum amplitude variation of signals that can be identified as peaks. 
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.QueryPeakExcursion();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function ConfigurePeakThreshold(obj,Threshold)
            %CONFIGUREPEAKTHRESHOLD Sets the minimum amplitude of signals that can be identified as peaks.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            Threshold = obj.checkVectorDoubleArg(Threshold,'Threshold');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                obj.interface.ConfigurePeakThreshold(double(Threshold));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = QueryPeakThreshold(obj)
            %QUERYPEAKTHRESHOLD Queries the minimum amplitude of signals that can be identified as peaks.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.QueryPeakThreshold();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function ConfigureSweepTime(obj,SweepTime)
            %CONFIGURESWEEPTIME Sets the sweep time of the analyzer. This parameter can send up to 20 values. The location in the list sent corresponds to the range of the associated value.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            SweepTime = obj.checkVectorDoubleArg(SweepTime,'SweepTime');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                obj.interface.ConfigureSweepTime(double(SweepTime));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function ConfigureSweepTimeAutoEnabled(obj,State)
            %CONFIGURESWEEPTIMEAUTOENABLED Enables/Disables automatic setting up of analyzer sweep time.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            State = obj.checkVectorBoolArg(State,'State');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                obj.interface.ConfigureSweepTimeAutoEnabled(logical(State));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = QuerySweepTime(obj)
            %QUERYSWEEPTIME Queries the sweep time of the analyzer. 
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.QuerySweepTime();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = QuerySweepTimeAutoEnabled(obj)
            %QUERYSWEEPTIMEAUTOENABLED Queries the state of function that automatic sets up of sweep time of the analyzer.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.QuerySweepTimeAutoEnabled();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function ConfigureSweepPoints(obj,SweepPoints)
            %CONFIGURESWEEPPOINTS Sets the number of points per sweep for the measurement. This parameter can send up to 20 values. The location in the list sent corresponds to the range of the associated value.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            SweepPoints = obj.checkVectorInt32Arg(SweepPoints,'SweepPoints');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                obj.interface.ConfigureSweepPoints(int32(SweepPoints));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = QuerySweepPoints(obj)
            %QUERYSWEEPPOINTS Queries the number of points per sweep for the measurement. 
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.QuerySweepPoints();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function ConfigureSweepPointsAutoEnabled(obj,State)
            %CONFIGURESWEEPPOINTSAUTOENABLED Enables/Disables automatic setting up of analyzer sweep points.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            State = obj.checkVectorBoolArg(State,'State');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                obj.interface.ConfigureSweepPointsAutoEnabled(logical(State));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = QuerySweepPointsAutoEnabled(obj)
            %QUERYSWEEPPOINTSAUTOENABLED Queries the state of function that automatic sets up of sweep points of the analyzer.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.QuerySweepPointsAutoEnabled();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function ConfigureEnabled(obj,State)
            %CONFIGUREENABLED Turns On or Off the range inclusion.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            State = obj.checkVectorBoolArg(State,'State');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                obj.interface.ConfigureEnabled(logical(State));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = QueryEnabled(obj)
            %QUERYENABLED Queries the state (On or Off) of the range inclusion.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.QueryEnabled();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function ConfigureSweepTimeAutoRules(obj,AutoRules)
            %CONFIGURESWEEPTIMEAUTORULES Switches the analyzer between normal and accuracy sweep states. Setting Auto Sweep Time to Accy will result in slower sweep times, usually about three times as long, but better amplitude accuracy for CW signals. The instrument amplitude accuracy specifications only apply when Auto Sweep Time is set to Accy. Additional amplitude errors which occur when Auto Sweep Time is set to Norm are usually well under 0.1 dB, though this is not guaranteed. Because of the faster sweep times and still low errors, Norm is the preferred setting of Auto Sweep Time. Auto Sweep Time is set to Norm on a Preset or Auto Couple. This means that in the Preset or Auto Coupled state, instrument amplitude accuracy specifications do not apply.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                obj.interface.ConfigureSweepTimeAutoRules(int32(AutoRules));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = QuerySweepTimeAutoRules(obj)
            %QUERYSWEEPTIMEAUTORULES Switches the analyzer between normal and accuracy sweep states. Setting Auto Sweep Time to Accy will result in slower sweep times, usually about three times as long, but better amplitude accuracy for CW signals. The instrument amplitude accuracy specifications only apply when Auto Sweep Time is set to Accy. Additional amplitude errors which occur when Auto Sweep Time is set to Norm are usually well under 0.1 dB, though this is not guaranteed. Because of the faster sweep times and still low errors, Norm is the preferred setting of Auto Sweep Time. Auto Sweep Time is set to Norm on a Preset or Auto Couple. This means that in the Preset or Auto Coupled state, instrument amplitude accuracy specifications do not apply.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.QuerySweepTimeAutoRules();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function ConfigureAttenuationAutoEnabled(obj,State)
            %CONFIGUREATTENUATIONAUTOENABLED When set to true, attenuation value under AMPTD Y Scale is used. When set to false, the value set by ConfigureAttenuation method is used as mechanical attenuation value without electric attenuation.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            State = obj.checkVectorBoolArg(State,'State');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                obj.interface.ConfigureAttenuationAutoEnabled(logical(State));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = QueryAttenuationAutoEnabled(obj)
            %QUERYATTENUATIONAUTOENABLED Queries the state of function that automatic sets up the attenuation value for each range.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.QueryAttenuationAutoEnabled();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function ConfigureDetector1(obj,Detector)
            %CONFIGUREDETECTOR1 Sets the detector to be used by the trace for spur detection and limit line testing.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                obj.interface.ConfigureDetector1(int32(Detector));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = QueryDetector1(obj)
            %QUERYDETECTOR1 Gets the detector being used by the trace for spur detection and limit line testing.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.QueryDetector1();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function ConfigureDetector2(obj,Detector)
            %CONFIGUREDETECTOR2 Sets the detector to be used by the trace for display purposes only.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                obj.interface.ConfigureDetector2(int32(Detector));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = QueryDetector2(obj)
            %QUERYDETECTOR2 Queries the detector to be used by the trace for display purposes only.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.QueryDetector2();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

    end

end
