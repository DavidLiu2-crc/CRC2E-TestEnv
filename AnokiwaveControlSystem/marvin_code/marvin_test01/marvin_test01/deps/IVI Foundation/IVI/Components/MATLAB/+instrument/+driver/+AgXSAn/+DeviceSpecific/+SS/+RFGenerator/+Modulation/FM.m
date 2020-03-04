classdef FM < instrument.ivicom.Interface
    %FM IKtXSAnRadioTestRFGeneratorFM interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = FM(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %DEVIATION The peak level of the FM modulation.
        Deviation

        %ENABLED Enable or disable the Frequency Modulation.
        Enabled

        %FREQUENCY The frequency of the FM Modulation.
        Frequency

    end

    %% Property access methods
    methods

        %% Deviation property access methods
        function value = get.Deviation(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Deviation;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Deviation(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'Deviation');
            try
                obj.interface.Deviation = newValue;
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
