classdef Auto < instrument.ivicom.Interface
    %AUTO IAgXSAnTrigger3Auto interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Auto(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %TIME The time that analyzer will wait for the trigger conditions to be met. If they are not met after that much time, then the analyzer is triggered anyway.
        Time

        %ENABLED Enable or disable the auto trigger state of analyzer.
        Enabled

    end

    %% Property access methods
    methods

        %% Time property access methods
        function value = get.Time(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Time;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Time(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'Time');
            try
                obj.interface.Time = newValue;
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

end
