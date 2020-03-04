classdef Setup < instrument.ivicom.Interface
    %SETUP IAgXSAn5SSListSequencerSetup interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Setup(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);

            %% Initialize properties
            try
                obj.Trigger = instrument.driver.AgXSAn.DeviceSpecific.SS.ListSequencer.Setup.Trigger(obj.interface.Trigger);
            catch %#ok<CTCH>
            end

        end
        
        function delete(obj)
            obj.Trigger = [];
        end

    end
    
    %% Public Properties
    properties

        %NUMBEROFSTEPS The number of steps within the list sequence.
        NumberOfSteps

    end

    %% Public Read Only Properties
    properties (SetAccess = private)

        %TRIGGER Pointer to the IAgXSAn5SSListSequencerSetupTrigger interface. Read Only.
        Trigger

    end

    %% Property access methods
    methods

        %% NumberOfSteps property access methods
        function value = get.NumberOfSteps(obj)
            obj.checkValidObj();
            try
                value = obj.interface.NumberOfSteps;
            catch e
                obj.interpretError(e);
            end
        end
		function set.NumberOfSteps(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarInt32Arg(newValue,'NumberOfSteps');
            try
                obj.interface.NumberOfSteps = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Trigger property access methods
        function value = get.Trigger(obj)
            obj.checkValidObj();
            if isempty(obj.Trigger)
                try
                    obj.Trigger = instrument.driver.AgXSAn.DeviceSpecific.SS.ListSequencer.Setup.Trigger(obj.interface.Trigger);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Trigger;
        end

    end

    %% Public Methods
    methods

        function val = QueryListPower(obj)
            %QUERYLISTPOWER Queries Power parameter array of the whole List Sequencer at one time.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.QueryListPower();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function ConfigureListPower(obj,Power)
            %CONFIGURELISTPOWER Configure Power parameter array of the whole List Sequencer at one time.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            Power = obj.checkVectorDoubleArg(Power,'Power');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                obj.interface.ConfigureListPower(double(Power));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function ClearList(obj)
            %CLEARLIST Clear the list. Clearing the list sets the number of steps to the default value of 1 and sets the parameters for the only step to their default values.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.ClearList();
            catch e
                obj.interpretError(e);
            end
        end

        function ConfigureListFrequency(obj,Frequency)
            %CONFIGURELISTFREQUENCY Configure Frequency array of the whole List Sequencer at one time.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            Frequency = obj.checkVectorDoubleArg(Frequency,'Frequency');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                obj.interface.ConfigureListFrequency(double(Frequency));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function ConfigureListStepDurationType(obj,StepIndex,StepDuartionType)
            %CONFIGURELISTSTEPDURATIONTYPE Configure duration type of the selected step.
            
            obj.checkValidObj();
			error(nargchk(3,3,nargin,'struct'))
            StepIndex = obj.checkScalarInt32Arg(StepIndex,'StepIndex');
            try
                obj.interface.ConfigureListStepDurationType(int32(StepIndex),int32(StepDuartionType));
            catch e
                obj.interpretError(e);
            end
        end

        function val = QueryListFrequency(obj)
            %QUERYLISTFREQUENCY Query Frequency array of the whole List Sequencer at one time.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.QueryListFrequency();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = QueryListStepDurationType(obj,StepIndex)
            %QUERYLISTSTEPDURATIONTYPE Query the Step Duration type parameter array of the whole List Sequencer at one time.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            StepIndex = obj.checkScalarInt32Arg(StepIndex,'StepIndex');
            try
                [val] = obj.interface.QueryListStepDurationType(int32(StepIndex));
            catch e
                obj.interpretError(e);
            end
        end

        function ConfigureListStepDurationTime(obj,StepIndex,Time)
            %CONFIGURELISTSTEPDURATIONTIME Configure the length of time the step will play.
            
            obj.checkValidObj();
			error(nargchk(3,3,nargin,'struct'))
            StepIndex = obj.checkScalarInt32Arg(StepIndex,'StepIndex');
            Time = obj.checkScalarDoubleArg(Time,'Time');
            try
                obj.interface.ConfigureListStepDurationTime(int32(StepIndex),double(Time));
            catch e
                obj.interpretError(e);
            end
        end

        function val = QueryListStepDurationTime(obj,StepIndex)
            %QUERYLISTSTEPDURATIONTIME Query the length of time the step will play.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            StepIndex = obj.checkScalarInt32Arg(StepIndex,'StepIndex');
            try
                [val] = obj.interface.QueryListStepDurationTime(int32(StepIndex));
            catch e
                obj.interpretError(e);
            end
        end

        function ConfigureListStepRadioBand(obj,StepIndex,RadioBand)
            %CONFIGURELISTSTEPRADIOBAND Configure radio band standard of the selected step.
            
            obj.checkValidObj();
			error(nargchk(3,3,nargin,'struct'))
            StepIndex = obj.checkScalarInt32Arg(StepIndex,'StepIndex');
            try
                obj.interface.ConfigureListStepRadioBand(int32(StepIndex),int32(RadioBand));
            catch e
                obj.interpretError(e);
            end
        end

        function val = QueryListStepRadioBand(obj,StepIndex)
            %QUERYLISTSTEPRADIOBAND Query the radio standard and the associated radio band for use in the selected step.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            StepIndex = obj.checkScalarInt32Arg(StepIndex,'StepIndex');
            try
                [val] = obj.interface.QueryListStepRadioBand(int32(StepIndex));
            catch e
                obj.interpretError(e);
            end
        end

        function ConfigureListStepRadioBandLink(obj,StepIndex,Link)
            %CONFIGURELISTSTEPRADIOBANDLINK Configure the radio band link direction for the steps within the list sequence.
            
            obj.checkValidObj();
			error(nargchk(3,3,nargin,'struct'))
            StepIndex = obj.checkScalarInt32Arg(StepIndex,'StepIndex');
            try
                obj.interface.ConfigureListStepRadioBandLink(int32(StepIndex),int32(Link));
            catch e
                obj.interpretError(e);
            end
        end

        function val = QueryListStepRadioBandLink(obj,StepIndex)
            %QUERYLISTSTEPRADIOBANDLINK Query the radio band link direction for the steps within the list sequence.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            StepIndex = obj.checkScalarInt32Arg(StepIndex,'StepIndex');
            try
                [val] = obj.interface.QueryListStepRadioBandLink(int32(StepIndex));
            catch e
                obj.interpretError(e);
            end
        end

        function ConfigureListStepTransitionTime(obj,StepIndex,TranisitionTime)
            %CONFIGURELISTSTEPTRANSITIONTIME Configure the step transition time.
            
            obj.checkValidObj();
			error(nargchk(3,3,nargin,'struct'))
            StepIndex = obj.checkScalarInt32Arg(StepIndex,'StepIndex');
            TranisitionTime = obj.checkScalarDoubleArg(TranisitionTime,'TranisitionTime');
            try
                obj.interface.ConfigureListStepTransitionTime(int32(StepIndex),double(TranisitionTime));
            catch e
                obj.interpretError(e);
            end
        end

        function val = QueryListStepTransitionTime(obj,StepIndex)
            %QUERYLISTSTEPTRANSITIONTIME Query the step transition time.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            StepIndex = obj.checkScalarInt32Arg(StepIndex,'StepIndex');
            try
                [val] = obj.interface.QueryListStepTransitionTime(int32(StepIndex));
            catch e
                obj.interpretError(e);
            end
        end

        function ConfigureListStepWaveform(obj,StepIndex,Waveform)
            %CONFIGURELISTSTEPWAVEFORM Configure the waveform to be played back during the selected step.
            
            obj.checkValidObj();
			error(nargchk(3,3,nargin,'struct'))
            StepIndex = obj.checkScalarInt32Arg(StepIndex,'StepIndex');
            Waveform = obj.checkScalarStringArg(Waveform,'Waveform');
            try
                obj.interface.ConfigureListStepWaveform(int32(StepIndex),char(Waveform));
            catch e
                obj.interpretError(e);
            end
        end

        function val = QueryListStepWaveform(obj,StepIndex)
            %QUERYLISTSTEPWAVEFORM Query the waveform to be played back during the selected step.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            StepIndex = obj.checkScalarInt32Arg(StepIndex,'StepIndex');
            try
                [val] = obj.interface.QueryListStepWaveform(int32(StepIndex));
            catch e
                obj.interpretError(e);
            end
        end

        function ConfigureListStepFrequency(obj,StepIndex,Frequency)
            %CONFIGURELISTSTEPFREQUENCY Configure frequency of the selected step.
            
            obj.checkValidObj();
			error(nargchk(3,3,nargin,'struct'))
            StepIndex = obj.checkScalarInt32Arg(StepIndex,'StepIndex');
            Frequency = obj.checkScalarDoubleArg(Frequency,'Frequency');
            try
                obj.interface.ConfigureListStepFrequency(int32(StepIndex),double(Frequency));
            catch e
                obj.interpretError(e);
            end
        end

        function val = QueryListStepFrequency(obj,StepIndex)
            %QUERYLISTSTEPFREQUENCY Query the frequency array of the whole List Sequencer at one time.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            StepIndex = obj.checkScalarInt32Arg(StepIndex,'StepIndex');
            try
                [val] = obj.interface.QueryListStepFrequency(int32(StepIndex));
            catch e
                obj.interpretError(e);
            end
        end

        function ConfigureListDurationTime(obj,Time)
            %CONFIGURELISTDURATIONTIME Configure duration time parameter array of the whole List Sequencer at one time.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            Time = obj.checkVectorDoubleArg(Time,'Time');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                obj.interface.ConfigureListDurationTime(double(Time));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = QueryListDurationTime(obj)
            %QUERYLISTDURATIONTIME Query duration time array of the whole List Sequencer at one time.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.QueryListDurationTime();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function ConfigureListDurationType(obj,DurationType)
            %CONFIGURELISTDURATIONTYPE Configure duration type parameter array of the whole List Sequencer at one time.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                obj.interface.ConfigureListDurationType(int32(DurationType));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = QueryListDurationType(obj)
            %QUERYLISTDURATIONTYPE Query duration type array of the whole List Sequencer at one time.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.QueryListDurationType();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function ConfigureListRadioBand(obj,RadioBand)
            %CONFIGURELISTRADIOBAND Configure Radio Band parameter array of the whole List Sequencer at one time.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                obj.interface.ConfigureListRadioBand(int32(RadioBand));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = QueryListRadioBand(obj)
            %QUERYLISTRADIOBAND Query radio band standard array of the whole List Sequencer at one time.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.QueryListRadioBand();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function ConfigureListRadioBandLink(obj,Link)
            %CONFIGURELISTRADIOBANDLINK Configure Radio Band Link parameter array of the whole List Sequencer at one time.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                obj.interface.ConfigureListRadioBandLink(int32(Link));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = QueryListRadioBandLink(obj)
            %QUERYLISTRADIOBANDLINK Query radio band link array of the whole List Sequencer at one time.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.QueryListRadioBandLink();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

    end

end
