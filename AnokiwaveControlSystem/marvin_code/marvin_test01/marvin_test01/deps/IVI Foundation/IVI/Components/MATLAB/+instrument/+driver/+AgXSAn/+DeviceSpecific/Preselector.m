classdef Preselector < instrument.ivicom.Interface
    %PRESELECTOR IVI SpecAn class-compliant preselector interface
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Preselector(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %ADJUST Allows user-defined adjustment of the preselector frequency to optimize its response on the signal of interest.
        Adjust

        %MWENABLED Enables/Disables the microwave preselector.
        MWEnabled

        %MWPATH Sets/Gets properties of the microwave preselector.
        MWPath

    end

    %% Property access methods
    methods

        %% Adjust property access methods
        function value = get.Adjust(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Adjust;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Adjust(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'Adjust');
            try
                obj.interface.Adjust = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% MWEnabled property access methods
        function value = get.MWEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.MWEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.MWEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'MWEnabled');
            try
                obj.interface.MWEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% MWPath property access methods
        function value = get.MWPath(obj)
            obj.checkValidObj();
            try
                value = obj.interface.MWPath;
            catch e
                obj.interpretError(e);
            end
        end
		function set.MWPath(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.MWPath = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

    %% Public Methods
    methods

        function Peak(obj)
            %PEAK This function adjusts the preselector to obtain the maximum readings for the current start and stop frequency.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.Peak();
            catch e
                obj.interpretError(e);
            end
        end

    end

end
