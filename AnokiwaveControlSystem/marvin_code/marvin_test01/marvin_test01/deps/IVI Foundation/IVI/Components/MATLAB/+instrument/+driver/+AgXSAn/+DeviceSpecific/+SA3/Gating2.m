classdef Gating2 < instrument.ivicom.Interface
    %GATING2 IAgXSAnSAGating2 interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Gating2(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %VIEWSTARTTIME Controls the time at the left edge of the Gate View.
        ViewStartTime

        %DELAY Controls the length of time from the time the gate condition goes True until the gate is turned on.
        Delay

        %ENABLED Turns the gate function on and off. When the Gate Function is on, the selected Gate Method is used along with the gate settings and the signal at the gate source to control the sweep and video system with the gate signal. Not all measurements allow every type of Gate Methods. When Gate is on, the annunciation in the Meas Bar reflects that it is on and what method is used, as seen in the 'Gate: LO' annunciator below.
        Enabled

        %LENGTH Controls the length of time that the gate is on after it opens.
        Length

        %METHOD This lets the user to choose one of the three different types of gating. Not all types of gating are available for all measurements.
        Method

        %SOURCE Any trigger settings changes made under Gate Source also affect settings under Trigger, and vice versa. However the selected Trigger Source does not have to match the Gate Source.
        Source

        %TYPE Sets the method of controlling the gating function from the gating signal. 
        Type

        %VIEW Turning on Gate View in the Swept SA measurement provides a single-window gate view display. Turning on Gate View in other measurements shows the split-screen Gate View. 
        View

        %VIEWSWEEPTIME Controls the sweep time in the Gate View window. Since this variable is used to calculate Gate Length and Gate Delay increments, it must be maintained even when not in Gate View. It is initialized when Gate View turns on and every time the Gate Method is set while Gate View is on. Not all Gate methods are available for all modes. 
        ViewSweepTime

        %HOLDOFFTIME Sets/Gets the wait time after a gate event ends before the analyzer will respond to the next gate signal.
        HoldOffTime

        %HOLDOFFTIMEAUTOENABLED Turns gate hold off time auto coupling on/off.
        HoldOffTimeAutoEnabled

        %DELAYCOMPENSATION Allows user to select/Query an RBW-dependent value by which to adjust the gate delay, to compensate for changes in the delay caused by RBW effects.
        DelayCompensation

    end

    %% Public Read Only Properties
    properties (SetAccess = private)

        %MINFAST This command queries the position of the MIN FAST line, relative to the delay reference (REF) line. Read Only.
        MinFast

    end

    %% Property access methods
    methods

        %% ViewStartTime property access methods
        function value = get.ViewStartTime(obj)
            obj.checkValidObj();
            try
                value = obj.interface.ViewStartTime;
            catch e
                obj.interpretError(e);
            end
        end
		function set.ViewStartTime(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'ViewStartTime');
            try
                obj.interface.ViewStartTime = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Delay property access methods
        function value = get.Delay(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Delay;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Delay(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'Delay');
            try
                obj.interface.Delay = newValue;
            catch e
                obj.interpretError(e);
            end
        end

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

        %% Length property access methods
        function value = get.Length(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Length;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Length(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'Length');
            try
                obj.interface.Length = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Method property access methods
        function value = get.Method(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Method;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Method(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.Method = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% MinFast property access methods
        function value = get.MinFast(obj)
            obj.checkValidObj();
            try
                value = obj.interface.MinFast;
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

        %% View property access methods
        function value = get.View(obj)
            obj.checkValidObj();
            try
                value = obj.interface.View;
            catch e
                obj.interpretError(e);
            end
        end
		function set.View(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'View');
            try
                obj.interface.View = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% ViewSweepTime property access methods
        function value = get.ViewSweepTime(obj)
            obj.checkValidObj();
            try
                value = obj.interface.ViewSweepTime;
            catch e
                obj.interpretError(e);
            end
        end
		function set.ViewSweepTime(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'ViewSweepTime');
            try
                obj.interface.ViewSweepTime = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% HoldOffTime property access methods
        function value = get.HoldOffTime(obj)
            obj.checkValidObj();
            try
                value = obj.interface.HoldOffTime;
            catch e
                obj.interpretError(e);
            end
        end
		function set.HoldOffTime(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'HoldOffTime');
            try
                obj.interface.HoldOffTime = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% HoldOffTimeAutoEnabled property access methods
        function value = get.HoldOffTimeAutoEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.HoldOffTimeAutoEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.HoldOffTimeAutoEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'HoldOffTimeAutoEnabled');
            try
                obj.interface.HoldOffTimeAutoEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% DelayCompensation property access methods
        function value = get.DelayCompensation(obj)
            obj.checkValidObj();
            try
                value = obj.interface.DelayCompensation;
            catch e
                obj.interpretError(e);
            end
        end
		function set.DelayCompensation(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.DelayCompensation = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

end
