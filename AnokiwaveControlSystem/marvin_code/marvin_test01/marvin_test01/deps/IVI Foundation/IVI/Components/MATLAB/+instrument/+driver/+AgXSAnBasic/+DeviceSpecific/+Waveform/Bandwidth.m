classdef Bandwidth < instrument.ivicom.Interface
    %BANDWIDTH AgXSAnBasic WaveformBandwidth interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Bandwidth(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %RESOLUTION The Digital IF (formerly Info BW) bandwidth of the instrument.
        Resolution

        %SHAPE Type of Resolution BW filter that is used.
        Shape

    end

    %% Property access methods
    methods

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

        %% Shape property access methods
        function value = get.Shape(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Shape;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Shape(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.Shape = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

end
