classdef ZoneSpan < instrument.ivicom.Interface
    %ZONESPAN IAgXSAnFrequency3ZoneSpan interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = ZoneSpan(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %CENTRE Zone center allows you to change the frequency of the zone without changing the zone span.
        Centre

        %SPAN Allows the span of the zone markers to be changed without changing the center frequency.
        Span

    end

    %% Property access methods
    methods

        %% Centre property access methods
        function value = get.Centre(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Centre;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Centre(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'Centre');
            try
                obj.interface.Centre = newValue;
            catch e
                obj.interpretError(e);
            end
        end

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

    end

end
