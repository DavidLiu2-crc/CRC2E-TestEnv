classdef TraceZoom < instrument.ivicom.Interface
    %TRACEZOOM IAgXSAnFrequency3TraceZoom interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = TraceZoom(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %CENTRE allows to change the frequency of the zoom region, and hence of the lower window, without changing the Zoom Span.
        Centre

        %SPAN Allows the span of the zoom region to be changed without changing the zoom center.
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
