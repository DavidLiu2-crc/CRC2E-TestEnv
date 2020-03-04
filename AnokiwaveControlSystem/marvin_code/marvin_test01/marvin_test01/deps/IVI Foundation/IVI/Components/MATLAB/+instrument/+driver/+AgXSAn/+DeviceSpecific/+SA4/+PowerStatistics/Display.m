classdef Display < instrument.ivicom.Interface
    %DISPLAY IAgXSAnSAPowerStatisticsDisplay interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Display(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %GAUSSIANLINEENABLED Sets the Gaussian line display function between On and Off.
        GaussianLineEnabled

        %REFERENCETRACEENABLED Sets the reference trace display function between On and Off.
        ReferenceTraceEnabled

        %TEXT Write text across the top of the display.
        Text

        %XSCALE Sets/Gets the time value to change the horizontal scale.
        XScale

    end

    %% Property access methods
    methods

        %% GaussianLineEnabled property access methods
        function value = get.GaussianLineEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.GaussianLineEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.GaussianLineEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'GaussianLineEnabled');
            try
                obj.interface.GaussianLineEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% ReferenceTraceEnabled property access methods
        function value = get.ReferenceTraceEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.ReferenceTraceEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.ReferenceTraceEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'ReferenceTraceEnabled');
            try
                obj.interface.ReferenceTraceEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Text property access methods
        function value = get.Text(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Text;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Text(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarStringArg(newValue,'Text');
            try
                obj.interface.Text = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% XScale property access methods
        function value = get.XScale(obj)
            obj.checkValidObj();
            try
                value = obj.interface.XScale;
            catch e
                obj.interpretError(e);
            end
        end
		function set.XScale(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'XScale');
            try
                obj.interface.XScale = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

    %% Public Methods
    methods

        function StoreReferenceTrace(obj)
            %STOREREFERENCETRACE Copies the currently measured curve as the user-definable reference trace. The captured data will remain until the other mode is chosen.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.StoreReferenceTrace();
            catch e
                obj.interpretError(e);
            end
        end

    end

end
