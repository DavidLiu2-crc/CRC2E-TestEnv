classdef Item < instrument.ivicom.Interface
    %ITEM AgXSAn triggeralarm interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Item(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %PERIOD Specifies the period of the trigger alarm in seconds; that is, the amount of time in seconds that transpire before the alarm repeats.
        Period

        %REPEATCOUNT Specifies the number of times to repeat the trigger at the period specified by the Trigger Alarm Period attribute.
        RepeatCount

        %TIMEFRACTION Specifies the fractional seconds portion of the time at which the alarm will go off.
        TimeFraction

        %TIMESECONDS Specifies the seconds portion of the time at which the alarm will go off.
        TimeSeconds

        %ENABLED Enables or disables the trigger alarm.
        Enabled

    end

    %% Property access methods
    methods

        %% Period property access methods
        function value = get.Period(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Period;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Period(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'Period');
            try
                obj.interface.Period = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% RepeatCount property access methods
        function value = get.RepeatCount(obj)
            obj.checkValidObj();
            try
                value = obj.interface.RepeatCount;
            catch e
                obj.interpretError(e);
            end
        end
		function set.RepeatCount(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarInt32Arg(newValue,'RepeatCount');
            try
                obj.interface.RepeatCount = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% TimeFraction property access methods
        function value = get.TimeFraction(obj)
            obj.checkValidObj();
            try
                value = obj.interface.TimeFraction;
            catch e
                obj.interpretError(e);
            end
        end
		function set.TimeFraction(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'TimeFraction');
            try
                obj.interface.TimeFraction = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% TimeSeconds property access methods
        function value = get.TimeSeconds(obj)
            obj.checkValidObj();
            try
                value = obj.interface.TimeSeconds;
            catch e
                obj.interpretError(e);
            end
        end
		function set.TimeSeconds(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'TimeSeconds');
            try
                obj.interface.TimeSeconds = newValue;
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

    end

    %% Public Methods
    methods

        function Configure(obj,TimeSeconds,TimeFraction,Period,RepeatCount)
            %CONFIGURE This function configures the most commonly configured attributes of the trigger alarm sub-system.
            
            obj.checkValidObj();
			error(nargchk(5,5,nargin,'struct'))
            TimeSeconds = obj.checkScalarDoubleArg(TimeSeconds,'TimeSeconds');
            TimeFraction = obj.checkScalarDoubleArg(TimeFraction,'TimeFraction');
            Period = obj.checkScalarDoubleArg(Period,'Period');
            RepeatCount = obj.checkScalarInt32Arg(RepeatCount,'RepeatCount');
            try
                obj.interface.Configure(double(TimeSeconds),double(TimeFraction),double(Period),int32(RepeatCount));
            catch e
                obj.interpretError(e);
            end
        end

    end

end
