classdef WindowX < instrument.ivicom.Interface
    %WINDOWX IAgXSAnSABurstPowerDisplayWindowX interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = WindowX(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %AUTOSCALEENABLED Enables or disables the X auto scaling function.
        AutoScaleEnabled

        %REFERENCE The display X reference value.
        Reference

        %REFPOSITION The display X reference position.
        RefPosition

        %SCALE The display X scale/division value in seconds.
        Scale

    end

    %% Property access methods
    methods

        %% AutoScaleEnabled property access methods
        function value = get.AutoScaleEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.AutoScaleEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.AutoScaleEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'AutoScaleEnabled');
            try
                obj.interface.AutoScaleEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Reference property access methods
        function value = get.Reference(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Reference;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Reference(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'Reference');
            try
                obj.interface.Reference = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% RefPosition property access methods
        function value = get.RefPosition(obj)
            obj.checkValidObj();
            try
                value = obj.interface.RefPosition;
            catch e
                obj.interpretError(e);
            end
        end
		function set.RefPosition(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.RefPosition = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Scale property access methods
        function value = get.Scale(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Scale;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Scale(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'Scale');
            try
                obj.interface.Scale = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

end
