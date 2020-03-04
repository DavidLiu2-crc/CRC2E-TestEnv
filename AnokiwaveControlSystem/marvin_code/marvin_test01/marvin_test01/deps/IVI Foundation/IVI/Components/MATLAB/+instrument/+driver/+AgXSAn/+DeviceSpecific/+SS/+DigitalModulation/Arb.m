classdef Arb < instrument.ivicom.Interface
    %ARB IAgXSAn5SSDigitalModulationArb interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Arb(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);

            %% Initialize properties
            try
                obj.IQAdjustment = instrument.driver.AgXSAn.DeviceSpecific.SS.DigitalModulation.Arb.IQAdjustment(obj.interface.IQAdjustment);
            catch %#ok<CTCH>
            end

        end
        
        function delete(obj)
            obj.IQAdjustment = [];
        end

    end
    
    %% Public Properties
    properties

        %RUNTIMESCALING Allows you to adjust the run-time scaling value. The run-time scaling value is applied in real-time while the waveform is playing.
        RunTimeScaling

        %TRIGGERSOURCE The source of triggering for starting to play (generate) an Arb waveform.
        TriggerSource

        %TRIGGERTYPE Selects trigger type determines the behavior of the waveform when it plays.
        TriggerType

        %CONTINUOUSTRIGGERTYPE The active continuous trigger type.
        ContinuousTriggerType

        %SEGMENTADVANCETRIGGERTYPE The active trigger type to Segment Advance. Segment Advance triggering allows you to control the playback of waveform segments within a waveform sequence.
        SegmentAdvanceTriggerType

        %EXTERNALTRIGGERSLOPE The polarity of the external trigger. When Positive is selected, trigger event happens on a rising edge of the external trigger in signal. When Negative is selected, trigger event happens on a falling edge of the external trigger in signal.
        ExternalTriggerSlope

        %EXTERNALTRIGGERDELAYENABLED Enabled the state and value of external trigger delay.
        ExternalTriggerDelayEnabled

        %EXTERNALTRIGGERDELAY Delay time between when an external trigger is received and when it is applied to the waveform.
        ExternalTriggerDelay

        %RETRIGGERMODE Enables or disables the ARB retriggering mode.
        ReTriggerMode

        %SAMPLINGRATE Allows you to set the ARB waveform playback sample rate.
        SamplingRate

        %RMSVALUE Specify current RMS value used to playback currently selected waveform.
        RMSValue

        %RMSCALCULATIONMODE The mode to calculate the current RMS.
        RMSCalculationMode

        %SELECTEDWAVEFORM Select a waveform sequence or segment for the dual ARB to play.
        SelectedWaveform

        %SEQUENCESYNCENABLED Enable or disable the function of saving slaves waveform sequence files based on the current master segment's waveform settings.
        SequenceSyncEnabled

        %ALCHOLD Specify which marker is routed for use within the ALC hold function.
        ALCHold

        %RFBLANKING Select which marker is used for the pulse/RF blanking function.
        RFBlanking

        %ENABLED Enable or disable the Arb waveform.
        Enabled

        %DIRECTORYPATH The default directory path.
        DirectoryPath

    end

    %% Public Read Only Properties
    properties (SetAccess = private)

        %IQADJUSTMENT Pointer to the IAgXSAn5SSDigitalModulationArbIQAdjustment interface. Read Only.
        IQAdjustment

    end

    %% Property access methods
    methods

        %% RunTimeScaling property access methods
        function value = get.RunTimeScaling(obj)
            obj.checkValidObj();
            try
                value = obj.interface.RunTimeScaling;
            catch e
                obj.interpretError(e);
            end
        end
		function set.RunTimeScaling(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'RunTimeScaling');
            try
                obj.interface.RunTimeScaling = newValue;
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

        %% TriggerType property access methods
        function value = get.TriggerType(obj)
            obj.checkValidObj();
            try
                value = obj.interface.TriggerType;
            catch e
                obj.interpretError(e);
            end
        end
		function set.TriggerType(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.TriggerType = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% ContinuousTriggerType property access methods
        function value = get.ContinuousTriggerType(obj)
            obj.checkValidObj();
            try
                value = obj.interface.ContinuousTriggerType;
            catch e
                obj.interpretError(e);
            end
        end
		function set.ContinuousTriggerType(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.ContinuousTriggerType = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% SegmentAdvanceTriggerType property access methods
        function value = get.SegmentAdvanceTriggerType(obj)
            obj.checkValidObj();
            try
                value = obj.interface.SegmentAdvanceTriggerType;
            catch e
                obj.interpretError(e);
            end
        end
		function set.SegmentAdvanceTriggerType(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.SegmentAdvanceTriggerType = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% ExternalTriggerSlope property access methods
        function value = get.ExternalTriggerSlope(obj)
            obj.checkValidObj();
            try
                value = obj.interface.ExternalTriggerSlope;
            catch e
                obj.interpretError(e);
            end
        end
		function set.ExternalTriggerSlope(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.ExternalTriggerSlope = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% ExternalTriggerDelayEnabled property access methods
        function value = get.ExternalTriggerDelayEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.ExternalTriggerDelayEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.ExternalTriggerDelayEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'ExternalTriggerDelayEnabled');
            try
                obj.interface.ExternalTriggerDelayEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% ExternalTriggerDelay property access methods
        function value = get.ExternalTriggerDelay(obj)
            obj.checkValidObj();
            try
                value = obj.interface.ExternalTriggerDelay;
            catch e
                obj.interpretError(e);
            end
        end
		function set.ExternalTriggerDelay(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'ExternalTriggerDelay');
            try
                obj.interface.ExternalTriggerDelay = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% ReTriggerMode property access methods
        function value = get.ReTriggerMode(obj)
            obj.checkValidObj();
            try
                value = obj.interface.ReTriggerMode;
            catch e
                obj.interpretError(e);
            end
        end
		function set.ReTriggerMode(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.ReTriggerMode = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% SamplingRate property access methods
        function value = get.SamplingRate(obj)
            obj.checkValidObj();
            try
                value = obj.interface.SamplingRate;
            catch e
                obj.interpretError(e);
            end
        end
		function set.SamplingRate(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'SamplingRate');
            try
                obj.interface.SamplingRate = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% RMSValue property access methods
        function value = get.RMSValue(obj)
            obj.checkValidObj();
            try
                value = obj.interface.RMSValue;
            catch e
                obj.interpretError(e);
            end
        end
		function set.RMSValue(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'RMSValue');
            try
                obj.interface.RMSValue = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% RMSCalculationMode property access methods
        function value = get.RMSCalculationMode(obj)
            obj.checkValidObj();
            try
                value = obj.interface.RMSCalculationMode;
            catch e
                obj.interpretError(e);
            end
        end
		function set.RMSCalculationMode(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.RMSCalculationMode = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% SelectedWaveform property access methods
        function value = get.SelectedWaveform(obj)
            obj.checkValidObj();
            try
                value = obj.interface.SelectedWaveform;
            catch e
                obj.interpretError(e);
            end
        end
		function set.SelectedWaveform(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarStringArg(newValue,'SelectedWaveform');
            try
                obj.interface.SelectedWaveform = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% SequenceSyncEnabled property access methods
        function value = get.SequenceSyncEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.SequenceSyncEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.SequenceSyncEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'SequenceSyncEnabled');
            try
                obj.interface.SequenceSyncEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% ALCHold property access methods
        function value = get.ALCHold(obj)
            obj.checkValidObj();
            try
                value = obj.interface.ALCHold;
            catch e
                obj.interpretError(e);
            end
        end
		function set.ALCHold(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.ALCHold = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% RFBlanking property access methods
        function value = get.RFBlanking(obj)
            obj.checkValidObj();
            try
                value = obj.interface.RFBlanking;
            catch e
                obj.interpretError(e);
            end
        end
		function set.RFBlanking(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.RFBlanking = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Enabled property access methods
        function value = get.Enabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Enabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Enabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'Enabled');
            try
                obj.interface.Enabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% IQAdjustment property access methods
        function value = get.IQAdjustment(obj)
            obj.checkValidObj();
            if isempty(obj.IQAdjustment)
                try
                    obj.IQAdjustment = instrument.driver.AgXSAn.DeviceSpecific.SS.DigitalModulation.Arb.IQAdjustment(obj.interface.IQAdjustment);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.IQAdjustment;
        end

        %% DirectoryPath property access methods
        function value = get.DirectoryPath(obj)
            obj.checkValidObj();
            try
                value = obj.interface.DirectoryPath;
            catch e
                obj.interpretError(e);
            end
        end
		function set.DirectoryPath(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarStringArg(newValue,'DirectoryPath');
            try
                obj.interface.DirectoryPath = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

    %% Public Methods
    methods

        function ClearAllFileHeader(obj)
            %CLEARALLFILEHEADER Allows you to clear the header information from the file header associated with the currently selected waveform.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.ClearAllFileHeader();
            catch e
                obj.interpretError(e);
            end
        end

        function [returnMemoryUsed,returnMemoryFree,returnNumberOfFiles,returnWaveformList] = QueryCatalog(obj)
            %QUERYCATALOG Queries the test set for the list of waveform segments in the ARB memory.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                [returnMemoryUsed,returnMemoryFree,returnNumberOfFiles,returnWaveformList] = obj.interface.QueryCatalog(double(0),double(0),int32(0),char(0));
            catch e
                obj.interpretError(e);
            end
        end

        function Delete(obj,Filename)
            %DELETE Remove a segment from ARB playback memory.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            Filename = obj.checkScalarStringArg(Filename,'Filename');
            try
                obj.interface.Delete(char(Filename));
            catch e
                obj.interpretError(e);
            end
        end

        function DeleteAll(obj)
            %DELETEALL Remove all segments from ARB playback memory.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.DeleteAll();
            catch e
                obj.interpretError(e);
            end
        end

        function SetMarkerPolarity(obj,MarkerIndex,MarkerPolarity)
            %SETMARKERPOLARITY Set the polarity of marker.
            
            obj.checkValidObj();
			error(nargchk(3,3,nargin,'struct'))
            try
                obj.interface.SetMarkerPolarity(int32(MarkerIndex),int32(MarkerPolarity));
            catch e
                obj.interpretError(e);
            end
        end

        function val = GetMarkerPolarity(obj,MarkerIndex)
            %GETMARKERPOLARITY Get the polarity of marker.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            try
                [val] = obj.interface.GetMarkerPolarity(int32(MarkerIndex));
            catch e
                obj.interpretError(e);
            end
        end

        function CalculateRMS(obj)
            %CALCULATERMS Calculate current RMS based on mode selected.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.CalculateRMS();
            catch e
                obj.interpretError(e);
            end
        end

        function InitiateTrigger(obj)
            %INITIATETRIGGER Initiate an immediate trigger event if the trigger source is set to Bus.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.InitiateTrigger();
            catch e
                obj.interpretError(e);
            end
        end

        function val = GetHeaderDescription(obj)
            %GETHEADERDESCRIPTION Gets a list of the current selected ARB header information.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                [val] = obj.interface.GetHeaderDescription();
            catch e
                obj.interpretError(e);
            end
        end

        function SaveHeader(obj)
            %SAVEHEADER Save new file header information details to the file.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.SaveHeader();
            catch e
                obj.interpretError(e);
            end
        end

        function val = QueryLockedWaveformList(obj,ListType)
            %QUERYLOCKEDWAVEFORMLIST Query the locked waveform unique id or name list.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            try
                [val] = obj.interface.QueryLockedWaveformList(int32(ListType));
            catch e
                obj.interpretError(e);
            end
        end

    end

end
