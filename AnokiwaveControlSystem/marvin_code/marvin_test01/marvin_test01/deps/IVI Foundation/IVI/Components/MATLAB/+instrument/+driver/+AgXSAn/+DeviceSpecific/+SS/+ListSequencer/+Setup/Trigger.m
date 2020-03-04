classdef Trigger < instrument.ivicom.Interface
    %TRIGGER IAgXSAn5SSListSequencerSetupTrigger interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Trigger(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %TYPE The trigger type.
        Type

    end

    %% Property access methods
    methods

        %% Type property access methods
        function value = get.Type(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Type;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Type(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.Type = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

    %% Public Methods
    methods

        function Initiate(obj)
            %INITIATE Trigger the step and continue the sequence.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.Initiate();
            catch e
                obj.interpretError(e);
            end
        end

        function ConfigureStepInputTriggerType(obj,StepIndex,TriggerType)
            %CONFIGURESTEPINPUTTRIGGERTYPE Configure the trigger input for the selected step.
            
            obj.checkValidObj();
			error(nargchk(3,3,nargin,'struct'))
            StepIndex = obj.checkScalarInt32Arg(StepIndex,'StepIndex');
            try
                obj.interface.ConfigureStepInputTriggerType(int32(StepIndex),int32(TriggerType));
            catch e
                obj.interpretError(e);
            end
        end

        function val = QueryStepInputTriggerType(obj,StepIndex)
            %QUERYSTEPINPUTTRIGGERTYPE Query the trigger input for the selected step.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            StepIndex = obj.checkScalarInt32Arg(StepIndex,'StepIndex');
            try
                [val] = obj.interface.QueryStepInputTriggerType(int32(StepIndex));
            catch e
                obj.interpretError(e);
            end
        end

        function ConfigureDataMarker(obj,DataMarker)
            %CONFIGUREDATAMARKER Configure the output trigger maker routing to Marker for DataMarker  in  the whole source sequence.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            try
                obj.interface.ConfigureDataMarker(int32(DataMarker));
            catch e
                obj.interpretError(e);
            end
        end

        function val = QueryDataMarker(obj)
            %QUERYDATAMARKER Query the output trigger maker routing to Marker for DataMarker  in  the whole source sequence.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                [val] = obj.interface.QueryDataMarker();
            catch e
                obj.interpretError(e);
            end
        end

    end

end
