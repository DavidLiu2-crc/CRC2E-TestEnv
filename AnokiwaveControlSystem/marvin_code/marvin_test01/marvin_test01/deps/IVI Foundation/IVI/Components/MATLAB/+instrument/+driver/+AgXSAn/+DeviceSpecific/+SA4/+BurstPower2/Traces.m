classdef Traces < instrument.ivicom.RepeatedCapability
    %TRACES AgXSAn trace collection interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Traces(interface)
            
            %% construct superclass
            obj@instrument.ivicom.RepeatedCapability(interface);
        end
        
        function delete(obj)
        end

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

    end

    %% Public Methods
    methods

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
            %ITEM An interface reference pointer to the IAgXSAnSABurstPowerTrace interface which is selected by the trace name.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            Name = obj.checkScalarStringArg(Name,'Name');
            try
                [val] = instrument.driver.AgXSAn.DeviceSpecific.SA4.BurstPower2.Traces.Item(obj.interface.Item(char(Name)));
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
