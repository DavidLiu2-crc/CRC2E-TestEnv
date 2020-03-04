classdef System3 < instrument.ivicom.Interface
    %SYSTEM3 IAgXSAnSystem3 interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = System3(interface)
            
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

        %DATE Current date formatted as 'YYYY, MM,DD'. YYYY is a four-digit representation of the year including century and millennium information. MM is a two-digit representation of the month where January is 1 and December is 12. DD is the day of the month.
        Date

        %TIME Current time formatted as 'HH,MM,SS.SSSSS'. HH is the hour and its range is 0 to 23 inclusive. MM is the minute and its range is 0 to 59 inclusive. SS is the second in the range 0 to 59.999.
        Time

        %TIMEOUTMILLISECONDS The value, in milliseconds, of the default timeout used by I/O operations. This property provides access to the driver's Visa Session Timeout. <p>Only in rare, unusual circumstances should the client set this property. Driver methods and properties with operations which take a significant time to perform are responsible for adjusting the I/O timeout to an appropriate value. Some methods provide a MaxTimeMilliseconds parameter which gives the client direct control over the timeout value for that method. Sometimes, however, increasing the timeout value can work around an obscure driver defect. Note: If using an Agilent 82357A USB/GPIB interface, the minimum timeout is 2000ms.</p>
        TimeoutMilliseconds

        %TRACEENABLED If true, outputs a trace log of all driver calls to an xml file in the same directory as the applicatioin executable accessing the driver.  Generates default unique file names based on date and time.  A new file is generated each time the driver is initialized.  You may specify the trace file name using 'TraceName=' the 'DriverSetup=' option string parameter to the Initialize() method.  For example: 'DriverSetup= TraceName=TraceOutput'
        TraceEnabled

    end

    %% Public Read Only Properties
    properties (SetAccess = private)

        %SERIALNUMBER Instrument serial number. Read Only.
        SerialNumber

        %DIRECTIO References a pointer to the IFormattedIO488 interface associated with the I/O object used by the driver. The client can use this interface to communicate directly to the instrument using all the capabilities of the I/O interface. Read Only.
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

        %% Date property access methods
        function value = get.Date(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Date;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Date(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarStringArg(newValue,'Date');
            try
                obj.interface.Date = newValue;
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

        %% Time property access methods
        function value = get.Time(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Time;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Time(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarStringArg(newValue,'Time');
            try
                obj.interface.Time = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% TimeoutMilliseconds property access methods
        function value = get.TimeoutMilliseconds(obj)
            obj.checkValidObj();
            try
                value = obj.interface.TimeoutMilliseconds;
            catch e
                obj.interpretError(e);
            end
        end
		function set.TimeoutMilliseconds(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarInt32Arg(newValue,'TimeoutMilliseconds');
            try
                obj.interface.TimeoutMilliseconds = newValue;
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

        function val = ReadBytes2(obj)
            %READBYTES2 Reads a complete response from the instrument and returns it as an array of bytes.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.ReadBytes2();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = WriteBytes2(obj,Buffer)
            %WRITEBYTES2 Write an array of bytes to the device.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.WriteBytes2(uint8(Buffer));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
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

        function WriteBytes(obj,Buffer)
            %WRITEBYTES Write an array of bytes to the device.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                obj.interface.WriteBytes(uint8(Buffer));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
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

        function ClearIO(obj)
            %CLEARIO No documentation available.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.ClearIO();
            catch e
                obj.interpretError(e);
            end
        end

        function DisableLocalControls(obj)
            %DISABLELOCALCONTROLS Puts the instrument into a state where all local controls, including return to local, are disabled from changing the state of the instrument. The power switch is excluded. The client program can ensure that an operator cannot change the state of an instrument through its front panel.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.DisableLocalControls();
            catch e
                obj.interpretError(e);
            end
        end

        function EnableLocalControls(obj)
            %ENABLELOCALCONTROLS Allows an operator to examine and change the instrument's state through its local controls. The client can allow an operator to interact directly with the instrument through its front panel for a period of time.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.EnableLocalControls();
            catch e
                obj.interpretError(e);
            end
        end

        function returnImage = GetScreenImage(obj,Image)
            %GETSCREENIMAGE Retuns an array whose contents may be saved as a image file of the current display.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            byRefFlag = feature('COM_PassSafeArrayByRef');
            try
                feature('COM_SafeArraySingleDim',1);
                feature('COM_PassSafeArrayByRef',1);
                [returnImage] = obj.interface.GetScreenImage(uint8(Image));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                feature('COM_PassSafeArrayByRef',byRefFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
            feature('COM_PassSafeArrayByRef',byRefFlag);
        end

        function returnpData = GetState(obj,pData)
            %GETSTATE Binary current instrument state.  May be restored using PutState method.  Data is in internal instrument format, do not alter.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            byRefFlag = feature('COM_PassSafeArrayByRef');
            try
                feature('COM_SafeArraySingleDim',1);
                feature('COM_PassSafeArrayByRef',1);
                [returnpData] = obj.interface.GetState(uint8(pData));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                feature('COM_PassSafeArrayByRef',byRefFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
            feature('COM_PassSafeArrayByRef',byRefFlag);
        end

        function PutState(obj,Data)
            %PUTSTATE Writes binary instrument state as saved by GetState method.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                obj.interface.PutState(uint8(Data));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function RecallState(obj,Identifier)
            %RECALLSTATE Restore the instrument to a state previously stored in the instrument's internal memory.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            Identifier = obj.checkScalarStringArg(Identifier,'Identifier');
            try
                obj.interface.RecallState(char(Identifier));
            catch e
                obj.interpretError(e);
            end
        end

        function SaveState(obj,Identifier)
            %SAVESTATE Save the instrument's state the instrument's internal memory.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            Identifier = obj.checkScalarStringArg(Identifier,'Identifier');
            try
                obj.interface.SaveState(char(Identifier));
            catch e
                obj.interpretError(e);
            end
        end

        function WaitForOperationComplete(obj,MaxTimeMilliseconds)
            %WAITFOROPERATIONCOMPLETE Does not return until previously started operations complete or more MaxTimeMilliseconds milliseconds of time have expired.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            MaxTimeMilliseconds = obj.checkScalarInt32Arg(MaxTimeMilliseconds,'MaxTimeMilliseconds');
            try
                obj.interface.WaitForOperationComplete(int32(MaxTimeMilliseconds));
            catch e
                obj.interpretError(e);
            end
        end

    end

end
