classdef WindowX < instrument.ivicom.Interface
    %WINDOWX IAgXSAnBasicWaveform2DisplayWindowX interface.
    
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

        %AUTOSCALEENABLED Enable or disable the scale coupling function.
        AutoScaleEnabled

        %SCALE Specifies the horizontal scale by changing a time value per division.
        Scale

        %REFERENCE The reference value for time on the horizontal axis.
        Reference

        %REFPOSITION Positions the reference level at the Left, center, or right of the X- scale display.
        RefPosition

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

    end

end
