classdef Trigger2 < instrument.ivicom.Interface
    %TRIGGER2 IAgXSAnBasicTrigger2 interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Trigger2(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);

            %% Initialize properties
            try
                obj.Frame2 = instrument.driver.AgXSAnBasic.DeviceSpecific.Trigger2.Frame2(obj.interface.Frame2);
            catch %#ok<CTCH>
            end

            try
                obj.IDemodulated = instrument.driver.AgXSAnBasic.DeviceSpecific.Trigger2.IDemodulated(obj.interface.IDemodulated);
            catch %#ok<CTCH>
            end

            try
                obj.IQMagnitude = instrument.driver.AgXSAnBasic.DeviceSpecific.Trigger2.IQMagnitude(obj.interface.IQMagnitude);
            catch %#ok<CTCH>
            end

            try
                obj.InputI = instrument.driver.AgXSAnBasic.DeviceSpecific.Trigger2.InputI(obj.interface.InputI);
            catch %#ok<CTCH>
            end

            try
                obj.InputQ = instrument.driver.AgXSAnBasic.DeviceSpecific.Trigger2.InputQ(obj.interface.InputQ);
            catch %#ok<CTCH>
            end

            try
                obj.QDemodulated = instrument.driver.AgXSAnBasic.DeviceSpecific.Trigger2.QDemodulated(obj.interface.QDemodulated);
            catch %#ok<CTCH>
            end

            try
                obj.RFBurst2 = instrument.driver.AgXSAnBasic.DeviceSpecific.Trigger2.RFBurst2(obj.interface.RFBurst2);
            catch %#ok<CTCH>
            end

            try
                obj.Line = instrument.driver.AgXSAnBasic.DeviceSpecific.Trigger2.Line(obj.interface.Line);
            catch %#ok<CTCH>
            end

            try
                obj.AIQMagnitude = instrument.driver.AgXSAnBasic.DeviceSpecific.Trigger2.AIQMagnitude(obj.interface.AIQMagnitude);
            catch %#ok<CTCH>
            end

            try
                obj.External3 = instrument.driver.AgXSAnBasic.DeviceSpecific.Trigger2.External3(obj.interface.External3);
            catch %#ok<CTCH>
            end

            try
                obj.External2Ex = instrument.driver.AgXSAnBasic.DeviceSpecific.Trigger2.External2Ex(obj.interface.External2Ex);
            catch %#ok<CTCH>
            end

            try
                obj.ExternalEx = instrument.driver.AgXSAnBasic.DeviceSpecific.Trigger2.ExternalEx(obj.interface.ExternalEx);
            catch %#ok<CTCH>
            end

            try
                obj.Auto = instrument.driver.AgXSAnBasic.DeviceSpecific.Trigger2.Auto(obj.interface.Auto);
            catch %#ok<CTCH>
            end

            try
                obj.External = instrument.driver.AgXSAnBasic.DeviceSpecific.Trigger2.External(obj.interface.External);
            catch %#ok<CTCH>
            end

            try
                obj.External2 = instrument.driver.AgXSAnBasic.DeviceSpecific.Trigger2.External2(obj.interface.External2);
            catch %#ok<CTCH>
            end

            try
                obj.Frame = instrument.driver.AgXSAnBasic.DeviceSpecific.Trigger2.Frame(obj.interface.Frame);
            catch %#ok<CTCH>
            end

            try
                obj.IF = instrument.driver.AgXSAnBasic.DeviceSpecific.Trigger2.IF(obj.interface.IF);
            catch %#ok<CTCH>
            end

            try
                obj.RFBurst = instrument.driver.AgXSAnBasic.DeviceSpecific.Trigger2.RFBurst(obj.interface.RFBurst);
            catch %#ok<CTCH>
            end

        end
        
        function delete(obj)
            obj.Frame2 = [];
            obj.IDemodulated = [];
            obj.IQMagnitude = [];
            obj.InputI = [];
            obj.InputQ = [];
            obj.QDemodulated = [];
            obj.RFBurst2 = [];
            obj.Line = [];
            obj.AIQMagnitude = [];
            obj.External3 = [];
            obj.External2Ex = [];
            obj.ExternalEx = [];
            obj.Auto = [];
            obj.External = [];
            obj.External2 = [];
            obj.Frame = [];
            obj.IF = [];
            obj.RFBurst = [];
        end

    end
    
    %% Public Properties
    properties

        %HOLDOFFTYPE Enables to set the Trigger Holdoff Type.
        HoldoffType

        %HOLDOFFENABLED Enable or disable holdoff time state.
        HoldoffEnabled

        %HOLDOFF The holdoff time between triggers. After a trigger, another trigger will not be allowed until the holdoff time expires.
        Holdoff

        %SWEEPMODECONTINUOUSENABLED Selects whether a trigger is continuously initiated or not. Each trigger initiates a single, complete, measurement operation.
        SweepModeContinuousEnabled

    end

    %% Public Read Only Properties
    properties (SetAccess = private)

        %FRAME2 Pointer to the IAgXSAnBasicTriggerFrame interface. Read Only.
        Frame2

        %IDEMODULATED Pointer to the IAgXSAnBasicTrigger2IDemodulated interface. Read Only.
        IDemodulated

        %IQMAGNITUDE Pointer to the IAgXSAnBasicTrigger2IQMagnitude interface. Read Only.
        IQMagnitude

        %INPUTI Pointer to the IAgXSAnBasicTrigger2InputI interface. Read Only.
        InputI

        %INPUTQ Pointer to the IAgXSAnBasicTrigger2InputQ interface. Read Only.
        InputQ

        %QDEMODULATED Pointer to the IAgXSAnBasicTrigger2QDemodulated interface. Read Only.
        QDemodulated

        %RFBURST2 Pointer to the IAgXSAnBasicTriggerRFBurst interface. Read Only.
        RFBurst2

        %LINE Pointer to the IAgXSAnBasicTrigger2Line interface. Read Only.
        Line

        %AIQMAGNITUDE Pointer to the IAgXSAnBasicTrigger2AIQMagnitude interface. Read Only.
        AIQMagnitude

        %EXTERNAL3 Pointer to the IAgXSAnBasicTrigger2External3 interface. Read Only.
        External3

        %EXTERNAL2EX Pointer to the IAgXSAnBasicTrigger2External2Ex interface. Read Only.
        External2Ex

        %EXTERNALEX Pointer to the IAgXSAnBasicTrigger2ExternalEx interface. Read Only.
        ExternalEx

        %AUTO Pointer to the IAgXSAnBasicTriggerAuto interface. Read Only.
        Auto

        %EXTERNAL Pointer to the IAgXSAnBasicTriggerExternal interface. Read Only.
        External

        %EXTERNAL2 Pointer to the IAgXSAnBasicTriggerExternal2 interface. Read Only.
        External2

        %FRAME Pointer to the IAgXSAnBasicTriggerFrame interface. Read Only.
        Frame

        %IF Pointer to the IAgXSAnBasicTriggerIF interface. Read Only.
        IF

        %RFBURST Pointer to the IAgXSAnBasicTriggerRFBurst interface. Read Only.
        RFBurst

    end

    %% Property access methods
    methods

        %% Frame2 property access methods
        function value = get.Frame2(obj)
            obj.checkValidObj();
            if isempty(obj.Frame2)
                try
                    obj.Frame2 = instrument.driver.AgXSAnBasic.DeviceSpecific.Trigger2.Frame2(obj.interface.Frame2);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Frame2;
        end

        %% IDemodulated property access methods
        function value = get.IDemodulated(obj)
            obj.checkValidObj();
            if isempty(obj.IDemodulated)
                try
                    obj.IDemodulated = instrument.driver.AgXSAnBasic.DeviceSpecific.Trigger2.IDemodulated(obj.interface.IDemodulated);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.IDemodulated;
        end

        %% IQMagnitude property access methods
        function value = get.IQMagnitude(obj)
            obj.checkValidObj();
            if isempty(obj.IQMagnitude)
                try
                    obj.IQMagnitude = instrument.driver.AgXSAnBasic.DeviceSpecific.Trigger2.IQMagnitude(obj.interface.IQMagnitude);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.IQMagnitude;
        end

        %% InputI property access methods
        function value = get.InputI(obj)
            obj.checkValidObj();
            if isempty(obj.InputI)
                try
                    obj.InputI = instrument.driver.AgXSAnBasic.DeviceSpecific.Trigger2.InputI(obj.interface.InputI);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.InputI;
        end

        %% InputQ property access methods
        function value = get.InputQ(obj)
            obj.checkValidObj();
            if isempty(obj.InputQ)
                try
                    obj.InputQ = instrument.driver.AgXSAnBasic.DeviceSpecific.Trigger2.InputQ(obj.interface.InputQ);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.InputQ;
        end

        %% QDemodulated property access methods
        function value = get.QDemodulated(obj)
            obj.checkValidObj();
            if isempty(obj.QDemodulated)
                try
                    obj.QDemodulated = instrument.driver.AgXSAnBasic.DeviceSpecific.Trigger2.QDemodulated(obj.interface.QDemodulated);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.QDemodulated;
        end

        %% RFBurst2 property access methods
        function value = get.RFBurst2(obj)
            obj.checkValidObj();
            if isempty(obj.RFBurst2)
                try
                    obj.RFBurst2 = instrument.driver.AgXSAnBasic.DeviceSpecific.Trigger2.RFBurst2(obj.interface.RFBurst2);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.RFBurst2;
        end

        %% HoldoffType property access methods
        function value = get.HoldoffType(obj)
            obj.checkValidObj();
            try
                value = obj.interface.HoldoffType;
            catch e
                obj.interpretError(e);
            end
        end
		function set.HoldoffType(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.HoldoffType = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% HoldoffEnabled property access methods
        function value = get.HoldoffEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.HoldoffEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.HoldoffEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'HoldoffEnabled');
            try
                obj.interface.HoldoffEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Line property access methods
        function value = get.Line(obj)
            obj.checkValidObj();
            if isempty(obj.Line)
                try
                    obj.Line = instrument.driver.AgXSAnBasic.DeviceSpecific.Trigger2.Line(obj.interface.Line);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Line;
        end

        %% AIQMagnitude property access methods
        function value = get.AIQMagnitude(obj)
            obj.checkValidObj();
            if isempty(obj.AIQMagnitude)
                try
                    obj.AIQMagnitude = instrument.driver.AgXSAnBasic.DeviceSpecific.Trigger2.AIQMagnitude(obj.interface.AIQMagnitude);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.AIQMagnitude;
        end

        %% External3 property access methods
        function value = get.External3(obj)
            obj.checkValidObj();
            if isempty(obj.External3)
                try
                    obj.External3 = instrument.driver.AgXSAnBasic.DeviceSpecific.Trigger2.External3(obj.interface.External3);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.External3;
        end

        %% External2Ex property access methods
        function value = get.External2Ex(obj)
            obj.checkValidObj();
            if isempty(obj.External2Ex)
                try
                    obj.External2Ex = instrument.driver.AgXSAnBasic.DeviceSpecific.Trigger2.External2Ex(obj.interface.External2Ex);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.External2Ex;
        end

        %% ExternalEx property access methods
        function value = get.ExternalEx(obj)
            obj.checkValidObj();
            if isempty(obj.ExternalEx)
                try
                    obj.ExternalEx = instrument.driver.AgXSAnBasic.DeviceSpecific.Trigger2.ExternalEx(obj.interface.ExternalEx);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.ExternalEx;
        end

        %% Auto property access methods
        function value = get.Auto(obj)
            obj.checkValidObj();
            if isempty(obj.Auto)
                try
                    obj.Auto = instrument.driver.AgXSAnBasic.DeviceSpecific.Trigger2.Auto(obj.interface.Auto);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Auto;
        end

        %% External property access methods
        function value = get.External(obj)
            obj.checkValidObj();
            if isempty(obj.External)
                try
                    obj.External = instrument.driver.AgXSAnBasic.DeviceSpecific.Trigger2.External(obj.interface.External);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.External;
        end

        %% External2 property access methods
        function value = get.External2(obj)
            obj.checkValidObj();
            if isempty(obj.External2)
                try
                    obj.External2 = instrument.driver.AgXSAnBasic.DeviceSpecific.Trigger2.External2(obj.interface.External2);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.External2;
        end

        %% Frame property access methods
        function value = get.Frame(obj)
            obj.checkValidObj();
            if isempty(obj.Frame)
                try
                    obj.Frame = instrument.driver.AgXSAnBasic.DeviceSpecific.Trigger2.Frame(obj.interface.Frame);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Frame;
        end

        %% Holdoff property access methods
        function value = get.Holdoff(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Holdoff;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Holdoff(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'Holdoff');
            try
                obj.interface.Holdoff = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% IF property access methods
        function value = get.IF(obj)
            obj.checkValidObj();
            if isempty(obj.IF)
                try
                    obj.IF = instrument.driver.AgXSAnBasic.DeviceSpecific.Trigger2.IF(obj.interface.IF);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.IF;
        end

        %% RFBurst property access methods
        function value = get.RFBurst(obj)
            obj.checkValidObj();
            if isempty(obj.RFBurst)
                try
                    obj.RFBurst = instrument.driver.AgXSAnBasic.DeviceSpecific.Trigger2.RFBurst(obj.interface.RFBurst);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.RFBurst;
        end

        %% SweepModeContinuousEnabled property access methods
        function value = get.SweepModeContinuousEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.SweepModeContinuousEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.SweepModeContinuousEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'SweepModeContinuousEnabled');
            try
                obj.interface.SweepModeContinuousEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

    %% Public Methods
    methods

        function SetOutput(obj,RearTriggerNo,TriggerType)
            %SETOUTPUT Returns the type of output signal that will be output from the rear panel Trigger 1 Out connector.
            
            obj.checkValidObj();
			error(nargchk(3,3,nargin,'struct'))
            RearTriggerNo = obj.checkScalarInt32Arg(RearTriggerNo,'RearTriggerNo');
            try
                obj.interface.SetOutput(int32(RearTriggerNo),int32(TriggerType));
            catch e
                obj.interpretError(e);
            end
        end

        function SetOutputPolarity(obj,RearTriggerNo,Polarity)
            %SETOUTPUTPOLARITY Sets the output to the Trig 1 Out connector to trigger on either the positive or negative polarity.
            
            obj.checkValidObj();
			error(nargchk(3,3,nargin,'struct'))
            RearTriggerNo = obj.checkScalarInt32Arg(RearTriggerNo,'RearTriggerNo');
            try
                obj.interface.SetOutputPolarity(int32(RearTriggerNo),int32(Polarity));
            catch e
                obj.interpretError(e);
            end
        end

        function val = GetOutput(obj,RearTriggerNo)
            %GETOUTPUT Returns the type of output signal that will be output from the rear panel Trigger 1 Out connector.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            RearTriggerNo = obj.checkScalarInt32Arg(RearTriggerNo,'RearTriggerNo');
            try
                [val] = obj.interface.GetOutput(int32(RearTriggerNo));
            catch e
                obj.interpretError(e);
            end
        end

        function val = GetOutputPolarity(obj,RearTriggerNo)
            %GETOUTPUTPOLARITY Returns the output to the Trigger 1 Out connector to trigger on either the positive or negative polarity.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            RearTriggerNo = obj.checkScalarInt32Arg(RearTriggerNo,'RearTriggerNo');
            try
                [val] = obj.interface.GetOutputPolarity(int32(RearTriggerNo));
            catch e
                obj.interpretError(e);
            end
        end

    end

end
