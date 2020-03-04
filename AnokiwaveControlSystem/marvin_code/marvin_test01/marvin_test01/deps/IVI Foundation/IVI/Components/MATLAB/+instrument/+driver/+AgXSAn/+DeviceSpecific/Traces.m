classdef Traces < instrument.ivicom.RepeatedCapability
    %TRACES AgXSAn trace collection interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Traces(interface)
            
            %% construct superclass
            obj@instrument.ivicom.RepeatedCapability(interface);

            %% Initialize properties
            try
                obj.Math = instrument.driver.AgXSAn.DeviceSpecific.Traces.Math(obj.interface.Math);
            catch %#ok<CTCH>
            end

        end
        
        function delete(obj)
            obj.Math = [];
        end

    end
    
    %% Public Properties
    properties

        %AVERAGETYPE Sets/Gets the type of averaging to be used for measurement results.
        AverageType

        %AVERAGETYPEAUTOENABLED Turns averaging type auto mode on and off.
        AverageTypeAutoEnabled

        %AVERAGEENABLED Enables/Disables the averaging.
        AverageEnabled

    end

    %% Public Read Only Properties
    properties (SetAccess = private)

        %COUNT The number of traces. Read Only.
        Count

        %MATH Pointer to the IAgXSAnTracesMath interface Read Only.
        Math

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

        %% Math property access methods
        function value = get.Math(obj)
            obj.checkValidObj();
            if isempty(obj.Math)
                try
                    obj.Math = instrument.driver.AgXSAn.DeviceSpecific.Traces.Math(obj.interface.Math);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Math;
        end

        %% AverageType property access methods
        function value = get.AverageType(obj)
            obj.checkValidObj();
            try
                value = obj.interface.AverageType;
            catch e
                obj.interpretError(e);
            end
        end
		function set.AverageType(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.AverageType = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% AverageTypeAutoEnabled property access methods
        function value = get.AverageTypeAutoEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.AverageTypeAutoEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.AverageTypeAutoEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'AverageTypeAutoEnabled');
            try
                obj.interface.AverageTypeAutoEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% AverageEnabled property access methods
        function value = get.AverageEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.AverageEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.AverageEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'AverageEnabled');
            try
                obj.interface.AverageEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

    %% Public Methods
    methods

        function SendSoftwareTrigger(obj)
            %SENDSOFTWARETRIGGER This function generates a software trigger.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.SendSoftwareTrigger();
            catch e
                obj.interpretError(e);
            end
        end

        function val = AcquisitionStatus(obj)
            %ACQUISITIONSTATUS This function determines if an acquisition is in progress or complete.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                [val] = obj.interface.AcquisitionStatus();
            catch e
                obj.interpretError(e);
            end
        end

        function Initiate(obj)
            %INITIATE This function initiates an acquisition.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.Initiate();
            catch e
                obj.interpretError(e);
            end
        end

        function Abort(obj)
            %ABORT This function aborts a previously initiated measurement.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.Abort();
            catch e
                obj.interpretError(e);
            end
        end

        function InitiateSignal(obj,Frequency,Amplitude,Span)
            %INITIATESIGNAL Initiates a trigger cycle for the measurement specified.
            
            obj.checkValidObj();
			error(nargchk(4,4,nargin,'struct'))
            Frequency = obj.checkScalarDoubleArg(Frequency,'Frequency');
            Amplitude = obj.checkScalarDoubleArg(Amplitude,'Amplitude');
            Span = obj.checkScalarDoubleArg(Span,'Span');
            try
                obj.interface.InitiateSignal(double(Frequency),double(Amplitude),double(Span));
            catch e
                obj.interpretError(e);
            end
        end

        function ClearAverage(obj)
            %CLEARAVERAGE Resets the average/hold count and restarts the averaging process.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.ClearAverage();
            catch e
                obj.interpretError(e);
            end
        end

        function ClearAll(obj)
            %CLEARALL Clears all traces.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.ClearAll();
            catch e
                obj.interpretError(e);
            end
        end

        function val = Item(obj,Name)
            %ITEM An interface reference pointer to the IAgXSAnTrace interface which is selected by the trace name.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            Name = obj.checkScalarStringArg(Name,'Name');
            try
                [val] = instrument.driver.AgXSAn.DeviceSpecific.Traces.Item(obj.interface.Item(char(Name)));
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
