classdef Item < instrument.ivicom.Interface
    %ITEM AgXSAn trace interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Item(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %TYPE Specifies the representation of the aquired data.
        Type

        %UPDATEENABLED Turns on or off updates of the current trace.
        UpdateEnabled

        %DISPLAYENABLED Turns on and off display of the current trace.
        DisplayEnabled

        %DETECTORTYPE Sets/Gets the detector type.
        DetectorType

    end

    %% Public Read Only Properties
    properties (SetAccess = private)

        %SIZE Returns the number of points in the trace array. Read Only.
        Size

    end

    %% Property access methods
    methods

        %% Size property access methods
        function value = get.Size(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Size;
            catch e
                obj.interpretError(e);
            end
        end

        %% Type property access methods
        function value = get.Type(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Type;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Type(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.Type = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% UpdateEnabled property access methods
        function value = get.UpdateEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.UpdateEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.UpdateEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'UpdateEnabled');
            try
                obj.interface.UpdateEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% DisplayEnabled property access methods
        function value = get.DisplayEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.DisplayEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.DisplayEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'DisplayEnabled');
            try
                obj.interface.DisplayEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% DetectorType property access methods
        function value = get.DetectorType(obj)
            obj.checkValidObj();
            try
                value = obj.interface.DetectorType;
            catch e
                obj.interpretError(e);
            end
        end
		function set.DetectorType(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.DetectorType = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

    %% Public Methods
    methods

        function val = ReadY(obj,MaxTimeMilliseconds)
            %READY This function initiates a signal acquisition, waits for the completion, and returns the trace as amplitude array.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            MaxTimeMilliseconds = obj.checkScalarInt32Arg(MaxTimeMilliseconds,'MaxTimeMilliseconds');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.ReadY(int32(MaxTimeMilliseconds));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = FetchY(obj)
            %FETCHY This function returns the trace the spectrum analyzer aquires.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.FetchY();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function Clear(obj)
            %CLEAR Clears the current trace.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.Clear();
            catch e
                obj.interpretError(e);
            end
        end

        function val = FetchX(obj)
            %FETCHX Returns the X axis data from the most recent measurement.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.FetchX();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = Compress(obj,Method,StartOffset,Length,RepeatOffset,RepeatLimit)
            %COMPRESS Returns compressed data for the specified trace data. The data is returned in the same units as the original trace and only works with the currently selected measurement.
            
            obj.checkValidObj();
			error(nargchk(6,6,nargin,'struct'))
            StartOffset = obj.checkScalarDoubleArg(StartOffset,'StartOffset');
            Length = obj.checkScalarDoubleArg(Length,'Length');
            RepeatOffset = obj.checkScalarDoubleArg(RepeatOffset,'RepeatOffset');
            RepeatLimit = obj.checkScalarInt32Arg(RepeatLimit,'RepeatLimit');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.Compress(int32(Method),double(StartOffset),double(Length),double(RepeatOffset),int32(RepeatLimit));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function ImportTraceCSV(obj,TraceNumber,Filename)
            %IMPORTTRACECSV Imports the trace from the file in the default path.
            
            obj.checkValidObj();
			error(nargchk(3,3,nargin,'struct'))
            TraceNumber = obj.checkScalarInt32Arg(TraceNumber,'TraceNumber');
            Filename = obj.checkScalarStringArg(Filename,'Filename');
            try
                obj.interface.ImportTraceCSV(int32(TraceNumber),char(Filename));
            catch e
                obj.interpretError(e);
            end
        end

        function ExportTraceCSV(obj,TraceNumber,Filename)
            %EXPORTTRACECSV Exports the trace to the file in the default path.
            
            obj.checkValidObj();
			error(nargchk(3,3,nargin,'struct'))
            TraceNumber = obj.checkScalarInt32Arg(TraceNumber,'TraceNumber');
            Filename = obj.checkScalarStringArg(Filename,'Filename');
            try
                obj.interface.ExportTraceCSV(int32(TraceNumber),char(Filename));
            catch e
                obj.interpretError(e);
            end
        end

        function val = Peaks(obj,Threshold,Excursion,Sort)
            %PEAKS Returns a list of peaks for the designated trace data n for the currently selected measurement. The peaks must meet the requirements of the peak threshold and excursion values.
            
            obj.checkValidObj();
			error(nargchk(4,4,nargin,'struct'))
            Threshold = obj.checkScalarDoubleArg(Threshold,'Threshold');
            Excursion = obj.checkScalarDoubleArg(Excursion,'Excursion');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.Peaks(double(Threshold),double(Excursion),int32(Sort));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

    end

end
