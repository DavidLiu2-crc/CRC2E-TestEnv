classdef Traces2 < instrument.ivicom.Interface
    %TRACES2 IAgXSAnSAChannelPowerTraces2 interface.
    
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

        %TYPE IVI SpecAn class-compliant values for Trace Type.
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

        function val = FetchChannelDensity(obj)
            %FETCHCHANNELDENSITY The power in the specified unit bandwidth.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                [val] = obj.interface.FetchChannelDensity();
            catch e
                obj.interpretError(e);
            end
        end

        function val = FetchChannelPower(obj)
            %FETCHCHANNELPOWER Finds the total power present in a specified bandwidth.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                [val] = obj.interface.FetchChannelPower();
            catch e
                obj.interpretError(e);
            end
        end

        function val = ReadChannelDesnsity(obj)
            %READCHANNELDESNSITY The power in the specified unit bandwidth.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                [val] = obj.interface.ReadChannelDesnsity();
            catch e
                obj.interpretError(e);
            end
        end

        function val = ReadChannelPower(obj)
            %READCHANNELPOWER Finds the total power present in a specified bandwidth.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                [val] = obj.interface.ReadChannelPower();
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
            %ITEM An interface reference pointer to the IAgXSAnSAChannelPowerTrace interface which is selected by the trace name.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            Name = obj.checkScalarStringArg(Name,'Name');
            try
                [val] = instrument.driver.AgXSAn.DeviceSpecific.SA4.ChannelPower2.Traces2.Item(obj.interface.Item(char(Name)));
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
