classdef Item < instrument.ivicom.Interface
    %ITEM AgXSAn limit interface.
    
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

        %AMPLITUDEINTERPOLATOR Allows user to determine how limit trace values are computed between points in a limit table. 
        AmplitudeInterpolator

        %COMMENT Sets an ASCII comment field which will be stored in an exported file.
        Comment

        %DISPLAYENABLED Turns limit-line display On or Off. Either Limit or Margin, as well as Test, must be turned on to turn on a limit test.
        DisplayEnabled

        %DOMAIN Selects how the limit-line segments are defined. Pressing X Axis Units selects whether the limit lines will be entered using frequency (Freq) or sweep time (Time) to define the segments. 
        Domain

        %ENABLED Selects whether displayed traces are tested against displayed limits
        Enabled

        %FREQUENCYINTERPOLATOR Sets the interpolation to linear or logarithmic for the specified limiting points set, allowing user to determine how limit trace values are computed between points in a limit table. 
        FrequencyInterpolator

        %MARGIN Selects a margin for the selected limit, which will cause a trace to Fail Margin when the trace is between the limit line and the margin line.
        Margin

        %MARGINENABLED Turns margin On or Off. Selecting On allows user to set a limit-line offset for the selected limit line. Only positive margins are allowed for lower limits and only negative margins are allowed for upper limits. 
        MarginEnabled

        %MODE Specifies whether the current limit lines are fixed or relative. 
        Mode

        %REALTIVETOCENTERFREQUENCYENABLED Chooses whether the limit line frequency points are coupled to the instrument  enter frequency, and whether the frequency points are expressed as an offset from the instrument center frequency. If the limit lines are specified with time, this has no effect. The limit table must in this case support negative frequencies.
        RealtiveToCenterFrequencyEnabled

        %RELATIVETOAMPLITUDEENABLED Chooses whether the limit line amplitude points are coupled to the instrument reference level, and whether the amplitude points are expressed as an offset from the instrument reference level.
        RelativeToAmplitudeEnabled

        %TESTTRACE Selects the trace you want the limit to test. A limit is applied to one and only one trace; each trace can have both an upper and a lower limit. When executing Limit Test, the limit is applied only to the specified trace. 
        TestTrace

        %TYPE Allows user to define the limit you are editing as either an upper or lower limit. An Upper limit fails if the trace exceeds the limit. A Lower limit fails if the trace falls below the limit.
        Type

        %XOFFSET Offsets the limit trace by some specified frequency (for Frequency-based limit lines) or a time (for time-based limit lines).
        XOffset

        %YOFFSET Offsets all segments in the limit line by some specified amplitude.
        YOffset

        %LINEENABLED Sets or queries whether the limit line is tested.
        LineEnabled

    end

    %% Public Read Only Properties
    properties (SetAccess = private)

        %FAIL Queries whether a trace passed all limits. Read Only.
        Fail

    end

    %% Property access methods
    methods

        %% AmplitudeInterpolator property access methods
        function value = get.AmplitudeInterpolator(obj)
            obj.checkValidObj();
            try
                value = obj.interface.AmplitudeInterpolator;
            catch e
                obj.interpretError(e);
            end
        end
		function set.AmplitudeInterpolator(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.AmplitudeInterpolator = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Comment property access methods
        function value = get.Comment(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Comment;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Comment(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarStringArg(newValue,'Comment');
            try
                obj.interface.Comment = newValue;
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

        %% Domain property access methods
        function value = get.Domain(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Domain;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Domain(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.Domain = newValue;
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

        %% Fail property access methods
        function value = get.Fail(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Fail;
            catch e
                obj.interpretError(e);
            end
        end

        %% FrequencyInterpolator property access methods
        function value = get.FrequencyInterpolator(obj)
            obj.checkValidObj();
            try
                value = obj.interface.FrequencyInterpolator;
            catch e
                obj.interpretError(e);
            end
        end
		function set.FrequencyInterpolator(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.FrequencyInterpolator = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Margin property access methods
        function value = get.Margin(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Margin;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Margin(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'Margin');
            try
                obj.interface.Margin = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% MarginEnabled property access methods
        function value = get.MarginEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.MarginEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.MarginEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'MarginEnabled');
            try
                obj.interface.MarginEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Mode property access methods
        function value = get.Mode(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Mode;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Mode(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.Mode = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% RealtiveToCenterFrequencyEnabled property access methods
        function value = get.RealtiveToCenterFrequencyEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.RealtiveToCenterFrequencyEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.RealtiveToCenterFrequencyEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'RealtiveToCenterFrequencyEnabled');
            try
                obj.interface.RealtiveToCenterFrequencyEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% RelativeToAmplitudeEnabled property access methods
        function value = get.RelativeToAmplitudeEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.RelativeToAmplitudeEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.RelativeToAmplitudeEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'RelativeToAmplitudeEnabled');
            try
                obj.interface.RelativeToAmplitudeEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% TestTrace property access methods
        function value = get.TestTrace(obj)
            obj.checkValidObj();
            try
                value = obj.interface.TestTrace;
            catch e
                obj.interpretError(e);
            end
        end
		function set.TestTrace(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarInt32Arg(newValue,'TestTrace');
            try
                obj.interface.TestTrace = newValue;
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

        %% XOffset property access methods
        function value = get.XOffset(obj)
            obj.checkValidObj();
            try
                value = obj.interface.XOffset;
            catch e
                obj.interpretError(e);
            end
        end
		function set.XOffset(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'XOffset');
            try
                obj.interface.XOffset = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% YOffset property access methods
        function value = get.YOffset(obj)
            obj.checkValidObj();
            try
                value = obj.interface.YOffset;
            catch e
                obj.interpretError(e);
            end
        end
		function set.YOffset(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'YOffset');
            try
                obj.interface.YOffset = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% LineEnabled property access methods
        function value = get.LineEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.LineEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.LineEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'LineEnabled');
            try
                obj.interface.LineEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

    %% Public Methods
    methods

        function BuildFromExisting(obj,SourceTraceNumber)
            %BUILDFROMEXISTING Builds a limit using an existing trace. This command will overwrite all data in the limit.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            SourceTraceNumber = obj.checkScalarInt32Arg(SourceTraceNumber,'SourceTraceNumber');
            try
                obj.interface.BuildFromExisting(int32(SourceTraceNumber));
            catch e
                obj.interpretError(e);
            end
        end

        function ConfigureData(obj,DataArray)
            %CONFIGUREDATA Defines the limit line values, and destroys all existing data. 
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            DataArray = obj.checkVectorDoubleArg(DataArray,'DataArray');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                obj.interface.ConfigureData(double(DataArray));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function Copy(obj,SourceLineNumber)
            %COPY Copies an existing limit into the current limit, including all secondary parameters (Description, Associated Trace, Type, Margin, Interpolation, Relative to CF/RL).
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            SourceLineNumber = obj.checkScalarInt32Arg(SourceLineNumber,'SourceLineNumber');
            try
                obj.interface.Copy(int32(SourceLineNumber));
            catch e
                obj.interpretError(e);
            end
        end

        function Delete(obj)
            %DELETE Deletes selected limit line.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.Delete();
            catch e
                obj.interpretError(e);
            end
        end

        function MergeData(obj,DataArray)
            %MERGEDATA Adds the points with the specified values to the current limit line, allowing user to merge limit line data. Up to two amplitude values are allowed for each x value.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            DataArray = obj.checkVectorDoubleArg(DataArray,'DataArray');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                obj.interface.MergeData(double(DataArray));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = QueryData(obj)
            %QUERYDATA Accesses limit line data.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.QueryData();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function UpdateOffsets(obj)
            %UPDATEOFFSETS Adds the X and Y offsets to each point in the limit table, then resets the X and Y offset values to zero. This has no effect on the position of the limit trace.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.UpdateOffsets();
            catch e
                obj.interpretError(e);
            end
        end

    end

end
