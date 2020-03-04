classdef IQAdjustment < instrument.ivicom.Interface
    %IQADJUSTMENT IAgXSAn5SSDigitalModulationArbIQAdjustment interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = IQAdjustment(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %ENABLED Enables or disables the I/Q adjustments.
        Enabled

        %GAIN Adjust the ratio of I to Q while preserving the composite, vector magnitude. Adding Gain (+x dB) to the signal increases the I component and decreases the Q component proportionally. Reducing Gain (-x dB) decreases the I component and increases the Q component proportionally.
        Gain

        %DELAY The absolute phase of both I and Q with respect to triggers and markers. A positive value delays I and Q. This value affects both the external I/Q out signals and the baseband signal modulated on the RF output. This adjustment does not affect external I/Q inputs.
        Delay

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

        %% Gain property access methods
        function value = get.Gain(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Gain;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Gain(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'Gain');
            try
                obj.interface.Gain = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Delay property access methods
        function value = get.Delay(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Delay;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Delay(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'Delay');
            try
                obj.interface.Delay = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

end
