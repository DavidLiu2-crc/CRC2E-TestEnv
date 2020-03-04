classdef PM < instrument.ivicom.Interface
    %PM IKtXSAnRadioTestRFGeneratorPM interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = PM(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %ENABLED Enable or disable the Phase Modulation.
        Enabled

        %FREQUENCY The frequency of the PM Modulation.
        Frequency

        %DEVIATION The peak level of the PM modulation.
        Deviation

    end

    %% Property access methods
    methods

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

    end

end
