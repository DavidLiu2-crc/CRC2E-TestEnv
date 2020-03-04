classdef RefOscillator < instrument.ivicom.Interface
    %REFOSCILLATOR IAgXSAn RefOscillator interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = RefOscillator(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %EXTERNALFREQUENCY Specify the frequency of the external reference being supplied to the instrument.
        ExternalFrequency

        %SOURCE Select the reference oscillator (time base) source.
        Source

        %EXTERNALCOUPLING Couples the sweep system of the analyzer to the state of the External Reference
        ExternalCoupling

        %EXTERNALBANDWIDTH Adjust the External Reference phase lock bandwidth
        ExternalBandwidth

    end

    %% Property access methods
    methods

        %% ExternalFrequency property access methods
        function value = get.ExternalFrequency(obj)
            obj.checkValidObj();
            try
                value = obj.interface.ExternalFrequency;
            catch e
                obj.interpretError(e);
            end
        end
		function set.ExternalFrequency(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'ExternalFrequency');
            try
                obj.interface.ExternalFrequency = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Source property access methods
        function value = get.Source(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Source;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Source(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.Source = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% ExternalCoupling property access methods
        function value = get.ExternalCoupling(obj)
            obj.checkValidObj();
            try
                value = obj.interface.ExternalCoupling;
            catch e
                obj.interpretError(e);
            end
        end
		function set.ExternalCoupling(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.ExternalCoupling = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% ExternalBandwidth property access methods
        function value = get.ExternalBandwidth(obj)
            obj.checkValidObj();
            try
                value = obj.interface.ExternalBandwidth;
            catch e
                obj.interpretError(e);
            end
        end
		function set.ExternalBandwidth(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.ExternalBandwidth = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

end
