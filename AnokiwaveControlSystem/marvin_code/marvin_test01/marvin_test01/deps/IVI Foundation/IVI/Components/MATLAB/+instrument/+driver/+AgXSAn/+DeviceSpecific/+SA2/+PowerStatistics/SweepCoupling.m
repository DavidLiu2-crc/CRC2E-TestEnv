classdef SweepCoupling < instrument.ivicom.Interface
    %SWEEPCOUPLING IAgXSAnSAPowerStatisticsSweepCoupling interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = SweepCoupling(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %SWEEPCYCLES Sets/Gets the number of measurement cycles to calculate power statistic data. 
        SweepCycles

        %SWEEPTIME Sets/Gets the length of time in which the spectrum analyzer sweeps the displayed frequency span.
        SweepTime

    end

    %% Property access methods
    methods

        %% SweepCycles property access methods
        function value = get.SweepCycles(obj)
            obj.checkValidObj();
            try
                value = obj.interface.SweepCycles;
            catch e
                obj.interpretError(e);
            end
        end
		function set.SweepCycles(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarInt32Arg(newValue,'SweepCycles');
            try
                obj.interface.SweepCycles = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% SweepTime property access methods
        function value = get.SweepTime(obj)
            obj.checkValidObj();
            try
                value = obj.interface.SweepTime;
            catch e
                obj.interpretError(e);
            end
        end
		function set.SweepTime(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'SweepTime');
            try
                obj.interface.SweepTime = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

end
