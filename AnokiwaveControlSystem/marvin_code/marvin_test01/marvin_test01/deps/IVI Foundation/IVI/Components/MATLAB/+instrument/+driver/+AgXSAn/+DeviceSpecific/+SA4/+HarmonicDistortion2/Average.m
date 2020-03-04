classdef Average < instrument.ivicom.Interface
    %AVERAGE IAgXSAnSAHarmonicDistortionAverage interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Average(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %COUNT Sets/Gets the number of data acquisitions that will be averaged. After the specified number of average counts, the averaging mode (terminal control) setting determines the averaging action.
        Count

        %ENABLED Turns averaging on or off.
        Enabled

        %MODE Sets/Gets the type of termination control used for the averaging function. This determines the averaging action after the specified number of data acquisitions (average count) is reached.
        Mode

    end

    %% Property access methods
    methods

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

    end

end
