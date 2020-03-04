classdef Status2 < instrument.ivicom.Interface
    %STATUS2 IAgXSAnStatus2 interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Status2(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Read Only Properties
    properties (SetAccess = private)

        %SERIALPOLL Serial poll the instrument status byte. Read Only.
        SerialPoll

    end

    %% Property access methods
    methods

        %% SerialPoll property access methods
        function value = get.SerialPoll(obj)
            obj.checkValidObj();
            try
                value = obj.interface.SerialPoll;
            catch e
                obj.interpretError(e);
            end
        end

    end

    %% Public Methods
    methods

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

        function Clear(obj)
            %CLEAR Clears all event registers and error queue. The enable registers are unaffected.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.Clear();
            catch e
                obj.interpretError(e);
            end
        end

        function ConfigureServiceRequest(obj,Reason)
            %CONFIGURESERVICEREQUEST Clears all the enable registers. It then sets the appropriate transition filters and enable registers so when the specified event(s) occur(s) the instrument requests service. All other events are disabled from generating a service request.  To detect a service request the client application must poll the status byte using the Status.SerialPoll method or Status.Register property and test the request service bit.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            try
                obj.interface.ConfigureServiceRequest(int32(Reason));
            catch e
                obj.interpretError(e);
            end
        end

        function Preset(obj)
            %PRESET Sets the SCPI defined enable registers and transition filters. It performs the actions specified by SCPI for the :STATus:PREset command, see SCPI Vol. 2: Command Reference, section 20.7.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.Preset();
            catch e
                obj.interpretError(e);
            end
        end

        function val = Register(obj,Register,SubRegister,newValue)
            %REGISTER Insturment status registers.
            
            obj.checkValidObj();
			error(nargchk(3,4,nargin,'struct'))
            try
                if nargin == 3
                    [val] = obj.interface.Register(int32(Register),int32(SubRegister));
                else
                    newValue = obj.checkScalarInt32Arg(newValue,'Register');
                    obj.interface.Register(int32(Register),int32(SubRegister),newValue);
                end
            catch e
                obj.interpretError(e);
            end
        end

    end

end
