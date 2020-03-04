classdef AM < instrument.ivicom.Interface
    %AM IKtXSAnRadioTestRFGeneratorAM interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = AM(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %DEPTH The AM depth.
        Depth

        %ENABLED Enable or disable the Amplitude Modulation.
        Enabled

        %FREQUENCY The frequency of the AM Modulation.
        Frequency

    end

    %% Property access methods
    methods

        %% Depth property access methods
        function value = get.Depth(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Depth;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Depth(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'Depth');
            try
                obj.interface.Depth = newValue;
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

        %% Frequency property access methods
        function value = get.Frequency(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Frequency;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Frequency(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'Frequency');
            try
                obj.interface.Frequency = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

end
