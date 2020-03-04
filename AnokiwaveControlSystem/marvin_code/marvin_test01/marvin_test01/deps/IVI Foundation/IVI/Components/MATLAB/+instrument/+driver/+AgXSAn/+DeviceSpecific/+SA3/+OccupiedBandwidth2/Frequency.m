classdef Frequency < instrument.ivicom.Interface
    %FREQUENCY IAgXSAnSAOccupiedBandwidthFrequency interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Frequency(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %SPAN Sets the frequency range symmetrically about the center frequency.
        Span

        %XDB Sets the x dB value used for the 'x dB bandwidth' result that measures the bandwidth between two points on the signal which is x dB down from the highest signal point within the OBW Span.
        XDB

    end

    %% Property access methods
    methods

        %% Span property access methods
        function value = get.Span(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Span;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Span(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'Span');
            try
                obj.interface.Span = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% XDB property access methods
        function value = get.XDB(obj)
            obj.checkValidObj();
            try
                value = obj.interface.XDB;
            catch e
                obj.interpretError(e);
            end
        end
		function set.XDB(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'XDB');
            try
                obj.interface.XDB = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

    %% Public Methods
    methods

        function FullSpan(obj)
            %FULLSPAN Changes the Span to show the full frequency range of the analyzer.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.FullSpan();
            catch e
                obj.interpretError(e);
            end
        end

        function LastSpan(obj)
            %LASTSPAN Changes the span to the previous span setting. If no previous span value exists, then the span will remain unchanged.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.LastSpan();
            catch e
                obj.interpretError(e);
            end
        end

    end

end
