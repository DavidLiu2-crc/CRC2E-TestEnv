classdef Average2 < instrument.ivicom.Interface
    %AVERAGE2 IAgXSAnBasicWaveformAverage2 interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Average2(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %TIMEAVERAGECOUNTAUTOENABLED Enable or disable the auto selection of the number of HW averages to be executed per each data acquisition.
        TimeAverageCountAutoEnabled

        %TYPEAUTOENABLED Auto enabled the selected averaging type.
        TypeAutoEnabled

        %COUNT The number of sweeps that will be averaged. After the specified number of sweeps (average counts), the averaging mode (terminal control) setting determines the averaging action.
        Count

        %ENABLED Enable or disable the averaging.
        Enabled

        %MODE Select the type of termination control used for the averaging function. This determines the averaging action after the specified number of sweeps (average count) is reached.
        Mode

        %TYPE Select the type of averaging.
        Type

    end

    %% Property access methods
    methods

        %% TimeAverageCountAutoEnabled property access methods
        function value = get.TimeAverageCountAutoEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.TimeAverageCountAutoEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.TimeAverageCountAutoEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'TimeAverageCountAutoEnabled');
            try
                obj.interface.TimeAverageCountAutoEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% TypeAutoEnabled property access methods
        function value = get.TypeAutoEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.TypeAutoEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.TypeAutoEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'TypeAutoEnabled');
            try
                obj.interface.TypeAutoEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Count property access methods
        function value = get.Count(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Count;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Count(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarInt32Arg(newValue,'Count');
            try
                obj.interface.Count = newValue;
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

        %% Mode property access methods
        function value = get.Mode(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Mode;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Mode(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.Mode = newValue;
            catch e
                obj.interpretError(e);
            end
        end

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

end
