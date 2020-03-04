classdef Traces2 < instrument.ivicom.Interface
    %TRACES2 IAgXSAnSAOccupiedBandwidthTraces2 interface.
    
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

        %TYPE Get or set IVI SpecAn class-compliant values for Trace Type
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

        function val = FetchOccupiedBandwidth(obj)
            %FETCHOCCUPIEDBANDWIDTH Computes and displays the bandwidth occupied by a given percentage of the total mean power of a signal.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                [val] = obj.interface.FetchOccupiedBandwidth();
            catch e
                obj.interpretError(e);
            end
        end

        function val = ReadOccupiedBandwidth(obj)
            %READOCCUPIEDBANDWIDTH Displays the bandwidth occupied by a given percentage of the total mean power of a signal.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                [val] = obj.interface.ReadOccupiedBandwidth();
            catch e
                obj.interpretError(e);
            end
        end

        function val = FetchXDB(obj)
            %FETCHXDB Fetch bandwidth between two points on the signal which is x dB down from the highest signal point.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                [val] = obj.interface.FetchXDB();
            catch e
                obj.interpretError(e);
            end
        end

        function val = ReadXDB(obj)
            %READXDB Display bandwidth between two points on the signal which is x dB down from the highest signal point.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                [val] = obj.interface.ReadXDB();
            catch e
                obj.interpretError(e);
            end
        end

        function val = FetchTransmitFrequencyError(obj)
            %FETCHTRANSMITFREQUENCYERROR Computes and display transmit frequency Error.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                [val] = obj.interface.FetchTransmitFrequencyError();
            catch e
                obj.interpretError(e);
            end
        end

        function val = ReadTransmitFrequencyError(obj)
            %READTRANSMITFREQUENCYERROR Computes and display transmit frequency error.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                [val] = obj.interface.ReadTransmitFrequencyError();
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
            %ITEM An interface reference pointer to the IAgXSAnSAOccupiedBandwidthTrace interface which is selected by the trace name.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            Name = obj.checkScalarStringArg(Name,'Name');
            try
                [val] = instrument.driver.AgXSAn.DeviceSpecific.SA3.OccupiedBandwidth2.Traces2.Item(obj.interface.Item(char(Name)));
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
