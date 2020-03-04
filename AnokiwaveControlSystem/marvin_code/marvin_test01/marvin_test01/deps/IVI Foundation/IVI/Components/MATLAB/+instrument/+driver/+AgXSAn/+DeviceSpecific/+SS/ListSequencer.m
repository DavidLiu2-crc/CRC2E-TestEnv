classdef ListSequencer < instrument.ivicom.Interface
    %LISTSEQUENCER IAgXSAn5SSListSequencer interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = ListSequencer(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);

            %% Initialize properties
            try
                obj.Setup = instrument.driver.AgXSAn.DeviceSpecific.SS.ListSequencer.Setup(obj.interface.Setup);
            catch %#ok<CTCH>
            end

        end
        
        function delete(obj)
            obj.Setup = [];
        end

    end
    
    %% Public Properties
    properties

        %ENABLED Enables or disables the list sequencer.
        Enabled

        %REPEATITIONMODE The repetition type for the list sequencer globally.
        RepeatitionMode

    end

    %% Public Read Only Properties
    properties (SetAccess = private)

        %SETUP Pointer to the IAgXSAn5SSListSequencerSetup interface. Read Only.
        Setup

    end

    %% Property access methods
    methods

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

        %% Setup property access methods
        function value = get.Setup(obj)
            obj.checkValidObj();
            if isempty(obj.Setup)
                try
                    obj.Setup = instrument.driver.AgXSAn.DeviceSpecific.SS.ListSequencer.Setup(obj.interface.Setup);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Setup;
        end

        %% RepeatitionMode property access methods
        function value = get.RepeatitionMode(obj)
            obj.checkValidObj();
            try
                value = obj.interface.RepeatitionMode;
            catch e
                obj.interpretError(e);
            end
        end
		function set.RepeatitionMode(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.RepeatitionMode = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

    %% Public Methods
    methods

        function Initiate(obj)
            %INITIATE Initiate the sequence.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.Initiate();
            catch e
                obj.interpretError(e);
            end
        end

        function Configure(obj,StepIndex,TriggerType,TransitionTime,RadioBand,Link,Frequency,Amplitude,Waveform,StepDuration,Count,OutputTriggerEnabled,Time)
            %CONFIGURE Configure the List Sequencer.
            
            obj.checkValidObj();
			error(nargchk(13,13,nargin,'struct'))
            StepIndex = obj.checkScalarInt32Arg(StepIndex,'StepIndex');
            TransitionTime = obj.checkScalarDoubleArg(TransitionTime,'TransitionTime');
            Frequency = obj.checkScalarDoubleArg(Frequency,'Frequency');
            Amplitude = obj.checkScalarDoubleArg(Amplitude,'Amplitude');
            Waveform = obj.checkScalarStringArg(Waveform,'Waveform');
            Count = obj.checkScalarInt32Arg(Count,'Count');
            OutputTriggerEnabled = obj.checkScalarBoolArg(OutputTriggerEnabled,'OutputTriggerEnabled');
            Time = obj.checkScalarDoubleArg(Time,'Time');
            try
                obj.interface.Configure(int32(StepIndex),int32(TriggerType),double(TransitionTime),int32(RadioBand),int32(Link),double(Frequency),double(Amplitude),char(Waveform),int32(StepDuration),int32(Count),logical(OutputTriggerEnabled),double(Time));
            catch e
                obj.interpretError(e);
            end
        end

        function val = IsArmed(obj)
            %ISARMED Get the status of list sequence being initiated successfully or not.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                [val] = obj.interface.IsArmed();
            catch e
                obj.interpretError(e);
            end
        end

        function [returnTriggerType,returnTransitionTime,returnRadioBand,returnLink,returnFrequency,returnAmplitude,returnWaveform,returnStepDuration,returnTime,returnCount,returnOutputTriggerEnabled] = QueryConfiguration(obj,StepIndex)
            %QUERYCONFIGURATION Query the Configuration of the List Sequencer.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            StepIndex = obj.checkScalarInt32Arg(StepIndex,'StepIndex');
            try
                [returnTriggerType,returnTransitionTime,returnRadioBand,returnLink,returnFrequency,returnAmplitude,returnWaveform,returnStepDuration,returnTime,returnCount,returnOutputTriggerEnabled] = obj.interface.QueryConfiguration(int32(StepIndex),int32(0),double(0),int32(0),int32(0),double(0),double(0),char(0),int32(0),double(0),int32(0),false);
            catch e
                obj.interpretError(e);
            end
        end

    end

end
