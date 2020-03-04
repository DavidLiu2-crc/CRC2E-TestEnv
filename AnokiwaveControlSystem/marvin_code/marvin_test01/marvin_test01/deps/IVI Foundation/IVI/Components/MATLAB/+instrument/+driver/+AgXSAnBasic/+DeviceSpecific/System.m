classdef System < instrument.ivicom.Interface
    %SYSTEM IAgXSAnBasic2System interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = System(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %IOTIMEOUT The I/O timeout in milliseconds.  The client program should normally not need to set the timeout.  Driver methods  with operations which take a significant time to perform are responsible for adjusting the I/O timeout to an appropriate value.
        IOTimeout

        %TRACEENABLED If true, output trace log of all driver calls to an XML file using a unique file name based on date and time in the same directory as the application executable accessing the driver OR as specified using tracing options when initializing the driver.
        TraceEnabled

    end

    %% Public Read Only Properties
    properties (SetAccess = private)

        %SERIALNUMBER -READ ONLY- The instrument serial number. Read Only.
        SerialNumber

        %DIRECTIO Reference to the VISA-COM IMessageBasedFormattedIO interface associated with the VISA-COM session used by the driver to connect to the instrument. The client can use this interface to communicate directly with the instrument using all the capabilities of the VISA.COM formatted I/O interface. Read Only.
        DirectIO

    end

    %% Property access methods
    methods

        %% IOTimeout property access methods
        function value = get.IOTimeout(obj)
            obj.checkValidObj();
            try
                value = obj.interface.IOTimeout;
            catch e
                obj.interpretError(e);
            end
        end
		function set.IOTimeout(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarInt32Arg(newValue,'IOTimeout');
            try
                obj.interface.IOTimeout = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% SerialNumber property access methods
        function value = get.SerialNumber(obj)
            obj.checkValidObj();
            try
                value = obj.interface.SerialNumber;
            catch e
                obj.interpretError(e);
            end
        end

        %% TraceEnabled property access methods
        function value = get.TraceEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.TraceEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.TraceEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'TraceEnabled');
            try
                obj.interface.TraceEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% DirectIO property access methods
        function value = get.DirectIO(obj)
            obj.checkValidObj();
            try
                value = obj.interface.DirectIO;
            catch e
                obj.interpretError(e);
            end
        end

    end

    %% Public Methods
    methods

        function ClearIO(obj)
            %CLEARIO Performs an IEEE 488.1-style clear of the device.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.ClearIO();
            catch e
                obj.interpretError(e);
            end
        end

        function val = ReadBytes(obj)
            %READBYTES Reads a complete response from the instrument and returns it as an array of bytes.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.ReadBytes();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = ReadString(obj)
            %READSTRING Reads a complete response from the instrument and returns it as a string.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                [val] = obj.interface.ReadString();
            catch e
                obj.interpretError(e);
            end
        end

        function RecallState(obj,Identifier)
            %RECALLSTATE Restore the instrument to a state previously stored in the instrument's internal memory.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            Identifier = obj.checkScalarInt32Arg(Identifier,'Identifier');
            try
                obj.interface.RecallState(int32(Identifier));
            catch e
                obj.interpretError(e);
            end
        end

        function SaveState(obj,Identifier)
            %SAVESTATE Save the current instrument state to the instrument's internal memory.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            Identifier = obj.checkScalarDoubleArg(Identifier,'Identifier');
            try
                obj.interface.SaveState(double(Identifier));
            catch e
                obj.interpretError(e);
            end
        end

        function Wait(obj)
            %WAIT Tells the instrument to wait until all pending operations have completed before executing additional commands and returns.  Used to synchronize instrument and application execution.  May cause subsequent commands or queries to timeout if waiting for a lengthy pending operation.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.Wait();
            catch e
                obj.interpretError(e);
            end
        end

        function val = WriteBytes(obj,Buffer)
            %WRITEBYTES Write an array of bytes to the device.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.WriteBytes(uint8(Buffer));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function WaitForOperationComplete(obj,MaxTimeMilliseconds)
            %WAITFOROPERATIONCOMPLETE Does not return until all previously started instrument operations complete or until MaxTimeMilliseconds has expired.  Used to synchronize instrument and application execution.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            MaxTimeMilliseconds = obj.checkScalarInt32Arg(MaxTimeMilliseconds,'MaxTimeMilliseconds');
            try
                obj.interface.WaitForOperationComplete(int32(MaxTimeMilliseconds));
            catch e
                obj.interpretError(e);
            end
        end

        function WriteString(obj,Data)
            %WRITESTRING Write a string to the device.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            Data = obj.checkScalarStringArg(Data,'Data');
            try
                obj.interface.WriteString(char(Data));
            catch e
                obj.interpretError(e);
            end
        end

        function ResetActiveMode(obj)
            %RESETACTIVEMODE Restore Mode Defaults resets the state for the currently active mode by resetting the mode persistent settings to their factory default values.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.ResetActiveMode();
            catch e
                obj.interpretError(e);
            end
        end

        function UserPresetAllModes(obj)
            %USERPRESETALLMODES Recalls all of the User Preset files for each mode, switches to the power-on mode, and activates the saved measurement from the power-on mode User Preset file.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.UserPresetAllModes();
            catch e
                obj.interpretError(e);
            end
        end

    end

end
