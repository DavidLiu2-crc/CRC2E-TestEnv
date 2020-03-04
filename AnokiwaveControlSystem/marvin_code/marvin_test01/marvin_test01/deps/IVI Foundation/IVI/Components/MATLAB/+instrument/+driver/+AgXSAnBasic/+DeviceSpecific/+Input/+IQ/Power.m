classdef Power < instrument.ivicom.Interface
    %POWER IAgXSAnBasicInputIQPower interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Power(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %IMAX The internal power gain range for the I channel when Input Path is I Only or Ind I/Q, and it is used for both the I and Q channels when the Input Path is I+jQ.
        IMax

        %QMAX The internal Power gain range for the Q channel.
        QMax

        %MIRRORINGENABLED Enable or disables the Q Same as I that will cause the Q channel range to be mirrored from the I channel.
        MirroringEnabled

    end

    %% Property access methods
    methods

        %% IMax property access methods
        function value = get.IMax(obj)
            obj.checkValidObj();
            try
                value = obj.interface.IMax;
            catch e
                obj.interpretError(e);
            end
        end
		function set.IMax(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'IMax');
            try
                obj.interface.IMax = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% QMax property access methods
        function value = get.QMax(obj)
            obj.checkValidObj();
            try
                value = obj.interface.QMax;
            catch e
                obj.interpretError(e);
            end
        end
		function set.QMax(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'QMax');
            try
                obj.interface.QMax = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% MirroringEnabled property access methods
        function value = get.MirroringEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.MirroringEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.MirroringEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'MirroringEnabled');
            try
                obj.interface.MirroringEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

end
