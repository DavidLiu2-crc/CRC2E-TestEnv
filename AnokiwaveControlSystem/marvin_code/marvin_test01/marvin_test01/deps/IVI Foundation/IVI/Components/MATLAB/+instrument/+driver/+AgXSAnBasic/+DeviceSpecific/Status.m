classdef Status < instrument.ivicom.Interface
    %STATUS IAgXSAnBasic2Status interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Status(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Methods
    methods

        function Clear(obj)
            %CLEAR Clears all event registers and the error message queue. Enable and any transition registers are unaffected.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.Clear();
            catch e
                obj.interpretError(e);
            end
        end

        function val = GetRegister(obj,Register)
            %GETREGISTER Gets the specified instrument status register.  Reading an Event register clears it.  Other registers are unaffected.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            try
                [val] = obj.interface.GetRegister(int32(Register));
            catch e
                obj.interpretError(e);
            end
        end

        function Preset(obj)
            %PRESET Sets the standard SCPI enable registers and any transition filters.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.Preset();
            catch e
                obj.interpretError(e);
            end
        end

        function val = SerialPoll(obj)
            %SERIALPOLL Serial poll the instrument status byte.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                [val] = obj.interface.SerialPoll();
            catch e
                obj.interpretError(e);
            end
        end

        function SetRegister(obj,Register,Value)
            %SETREGISTER Sets the specified instrument status register. Condition and Event registers are read only and cannot be set.
            
            obj.checkValidObj();
			error(nargchk(3,3,nargin,'struct'))
            Value = obj.checkScalarInt16Arg(Value,'Value');
            try
                obj.interface.SetRegister(int32(Register),int16(Value));
            catch e
                obj.interpretError(e);
            end
        end

    end

end
