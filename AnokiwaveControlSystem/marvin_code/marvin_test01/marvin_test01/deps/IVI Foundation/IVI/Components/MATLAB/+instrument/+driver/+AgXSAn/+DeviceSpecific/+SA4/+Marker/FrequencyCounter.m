classdef FrequencyCounter < instrument.ivicom.Interface
    %FREQUENCYCOUNTER IVI SpecAn class-compliant marker frequency counter interface
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = FrequencyCounter(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %ENABLED This function activates/deactivates the marker counter.
        Enabled

        %RESOLUTION Specifies the resolution of the frequency counter in Hertz.
        Resolution

        %GATETIME Sets the length of time during which the frequency counter measures the signal frequency.
        GateTime

        %GATETIMEAUTOENABLED Turns gate time auto on and off.
        GateTimeAutoEnabled

        %RESOLUTIONAUTOENABLED Get/Set the auto resolution of the frequency counter in Hertz.
        ResolutionAutoEnabled

    end

    %% Property access methods
    methods

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

        %% Resolution property access methods
        function value = get.Resolution(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Resolution;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Resolution(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'Resolution');
            try
                obj.interface.Resolution = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% GateTime property access methods
        function value = get.GateTime(obj)
            obj.checkValidObj();
            try
                value = obj.interface.GateTime;
            catch e
                obj.interpretError(e);
            end
        end
		function set.GateTime(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'GateTime');
            try
                obj.interface.GateTime = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% GateTimeAutoEnabled property access methods
        function value = get.GateTimeAutoEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.GateTimeAutoEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.GateTimeAutoEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'GateTimeAutoEnabled');
            try
                obj.interface.GateTimeAutoEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% ResolutionAutoEnabled property access methods
        function value = get.ResolutionAutoEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.ResolutionAutoEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.ResolutionAutoEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'ResolutionAutoEnabled');
            try
                obj.interface.ResolutionAutoEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

    %% Public Methods
    methods

        function Configure(obj,Enabled,Resolution)
            %CONFIGURE This function sets the marker frequency counter resolution and turns the marker frequency counter on/off.
            
            obj.checkValidObj();
			error(nargchk(3,3,nargin,'struct'))
            Enabled = obj.checkScalarBoolArg(Enabled,'Enabled');
            Resolution = obj.checkScalarDoubleArg(Resolution,'Resolution');
            try
                obj.interface.Configure(logical(Enabled),double(Resolution));
            catch e
                obj.interpretError(e);
            end
        end

        function val = QueryCount(obj)
            %QUERYCOUNT Queries the frequency count. The query returns the absolute count unless the specified marker is in Delta mode, then it returns the relative count. If the marker is off, or the marker is on but the counter is off, the analyzer will return not a number.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                [val] = obj.interface.QueryCount();
            catch e
                obj.interpretError(e);
            end
        end

    end

end
