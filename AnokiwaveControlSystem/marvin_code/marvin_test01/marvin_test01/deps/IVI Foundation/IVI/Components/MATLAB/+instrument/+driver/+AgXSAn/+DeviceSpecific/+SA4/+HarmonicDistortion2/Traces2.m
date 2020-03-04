classdef Traces2 < instrument.ivicom.Interface
    %TRACES2 IAgXSAnSAHarmonicDistortionTraces2 interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Traces2(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %TYPE Sets/Gets the harmonic trace type.
        Type

    end

    %% Public Read Only Properties
    properties (SetAccess = private)

        %COUNT The number of traces. Read Only.
        Count

    end

    %% Property access methods
    methods

        %% Count property access methods
        function value = get.Count(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Count;
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

    end

    %% Public Methods
    methods

        function val = FetchAmplitudeAll(obj)
            %FETCHAMPLITUDEALL Returns the amplitude values of the first 10 harmonics.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.FetchAmplitudeAll();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = ReadAmplitudeAll(obj)
            %READAMPLITUDEALL Returns the amplitude values of the first 10 harmonics.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.ReadAmplitudeAll();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = FetchAmplitude(obj,Harmonic)
            %FETCHAMPLITUDE Returns the amplitude values of the specified harmonic.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            Harmonic = obj.checkScalarInt32Arg(Harmonic,'Harmonic');
            try
                [val] = obj.interface.FetchAmplitude(int32(Harmonic));
            catch e
                obj.interpretError(e);
            end
        end

        function val = ReadAmplitude(obj,Harmonic)
            %READAMPLITUDE Returns the amplitude of the specified harmonic.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            Harmonic = obj.checkScalarInt32Arg(Harmonic,'Harmonic');
            try
                [val] = obj.interface.ReadAmplitude(int32(Harmonic));
            catch e
                obj.interpretError(e);
            end
        end

        function val = FetchFrequencyAll(obj)
            %FETCHFREQUENCYALL Returns the frequency values of the first 10 harmonics in Hz.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.FetchFrequencyAll();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = ReadFrequencyAll(obj)
            %READFREQUENCYALL Returns the frequency values of the first 10 harmonics in Hz.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.ReadFrequencyAll();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = FetchFrequency(obj,Harmonic)
            %FETCHFREQUENCY Returns the frequency of the specified harmonic in Hz.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            Harmonic = obj.checkScalarInt32Arg(Harmonic,'Harmonic');
            try
                [val] = obj.interface.FetchFrequency(int32(Harmonic));
            catch e
                obj.interpretError(e);
            end
        end

        function val = ReadFrequency(obj,Harmonic)
            %READFREQUENCY Returns the frequency of the specified harmonic in Hz.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            Harmonic = obj.checkScalarInt32Arg(Harmonic,'Harmonic');
            try
                [val] = obj.interface.ReadFrequency(int32(Harmonic));
            catch e
                obj.interpretError(e);
            end
        end

        function val = FetchFundamentalFrequency(obj)
            %FETCHFUNDAMENTALFREQUENCY Returns the frequency of the fundamental in Hz.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                [val] = obj.interface.FetchFundamentalFrequency();
            catch e
                obj.interpretError(e);
            end
        end

        function val = ReadFundamentalFrequency(obj)
            %READFUNDAMENTALFREQUENCY Returns the frequency of the fundamental in Hz.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                [val] = obj.interface.ReadFundamentalFrequency();
            catch e
                obj.interpretError(e);
            end
        end

        function val = FetchHarmonicDistortion(obj)
            %FETCHHARMONICDISTORTION Returns the computed total harmonic distortion as a percentage.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                [val] = obj.interface.FetchHarmonicDistortion();
            catch e
                obj.interpretError(e);
            end
        end

        function val = ReadHarmonicDistortion(obj)
            %READHARMONICDISTORTION Returns the computed total harmonic distortion as a percentage.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                [val] = obj.interface.ReadHarmonicDistortion();
            catch e
                obj.interpretError(e);
            end
        end

        function Abort(obj)
            %ABORT Stops any sweep or measurement in progress and resets the sweep or trigger system.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.Abort();
            catch e
                obj.interpretError(e);
            end
        end

        function Initiate(obj)
            %INITIATE Initiates a trigger cycle for the measurement specified.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.Initiate();
            catch e
                obj.interpretError(e);
            end
        end

        function InitiateSignal(obj,Frequency,Amplitude)
            %INITIATESIGNAL Initiates a trigger cycle for the measurement specified.
            
            obj.checkValidObj();
			error(nargchk(3,3,nargin,'struct'))
            Frequency = obj.checkScalarDoubleArg(Frequency,'Frequency');
            Amplitude = obj.checkScalarDoubleArg(Amplitude,'Amplitude');
            try
                obj.interface.InitiateSignal(double(Frequency),double(Amplitude));
            catch e
                obj.interpretError(e);
            end
        end

        function val = Item(obj,Name)
            %ITEM An interface reference pointer to the IAgXSAnSAHarmonicDistortionTrace interface which is selected by the trace name.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            Name = obj.checkScalarStringArg(Name,'Name');
            try
                [val] = instrument.driver.AgXSAn.DeviceSpecific.SA4.HarmonicDistortion2.Traces2.Item(obj.interface.Item(char(Name)));
            catch e
                obj.interpretError(e);
            end
        end

        function val = Name(obj,Index)
            %NAME The trace name for a given index.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            Index = obj.checkScalarInt32Arg(Index,'Index');
            try
                [val] = obj.interface.Name(int32(Index));
            catch e
                obj.interpretError(e);
            end
        end

    end

end
