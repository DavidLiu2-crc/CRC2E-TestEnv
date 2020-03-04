classdef Acquisition < instrument.ivicom.Interface
    %ACQUISITION IVI SpecAn class-compliant acquisition interface
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Acquisition(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);

            %% Initialize properties
            try
                obj.ADC = instrument.driver.AgXSAn.DeviceSpecific.Acquisition.ADC(obj.interface.ADC);
            catch %#ok<CTCH>
            end

        end
        
        function delete(obj)
            obj.ADC = [];
        end

    end
    
    %% Public Properties
    properties

        %CONTINUOUSSWEEPMODEENABLED Turns continuous sweep on/off.
        ContinuousSweepModeEnabled

        %NUMBEROFSWEEPS The terminal count number N for Average, Max Hold and Min Hold trace types. This number is anintegral part of how the average trace is calculated.
        NumberOfSweeps

        %DETECTORTYPEAUTOENABLED Turns automatic selection of detector type on/off.
        DetectorTypeAutoEnabled

        %DETECTORTYPE Specifies/Queries the detector type used to capture and process the signal.
        DetectorType

        %VERTICALSCALE The vertical scale for the display and for remote data readout.
        VerticalScale

    end

    %% Public Read Only Properties
    properties (SetAccess = private)

        %ADC Pointer to IAgXSAnAcquisitionADC interface. Read Only.
        ADC

    end

    %% Property access methods
    methods

        %% ContinuousSweepModeEnabled property access methods
        function value = get.ContinuousSweepModeEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.ContinuousSweepModeEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.ContinuousSweepModeEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'ContinuousSweepModeEnabled');
            try
                obj.interface.ContinuousSweepModeEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% NumberOfSweeps property access methods
        function value = get.NumberOfSweeps(obj)
            obj.checkValidObj();
            try
                value = obj.interface.NumberOfSweeps;
            catch e
                obj.interpretError(e);
            end
        end
		function set.NumberOfSweeps(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarInt32Arg(newValue,'NumberOfSweeps');
            try
                obj.interface.NumberOfSweeps = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% DetectorTypeAutoEnabled property access methods
        function value = get.DetectorTypeAutoEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.DetectorTypeAutoEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.DetectorTypeAutoEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'DetectorTypeAutoEnabled');
            try
                obj.interface.DetectorTypeAutoEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% DetectorType property access methods
        function value = get.DetectorType(obj)
            obj.checkValidObj();
            try
                value = obj.interface.DetectorType;
            catch e
                obj.interpretError(e);
            end
        end
		function set.DetectorType(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.DetectorType = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% VerticalScale property access methods
        function value = get.VerticalScale(obj)
            obj.checkValidObj();
            try
                value = obj.interface.VerticalScale;
            catch e
                obj.interpretError(e);
            end
        end
		function set.VerticalScale(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.VerticalScale = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% ADC property access methods
        function value = get.ADC(obj)
            obj.checkValidObj();
            if isempty(obj.ADC)
                try
                    obj.ADC = instrument.driver.AgXSAn.DeviceSpecific.Acquisition.ADC(obj.interface.ADC);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.ADC;
        end

    end

    %% Public Methods
    methods

        function Configure(obj,ContinuousSweepMode,NumberOfSweeps,DetectorTypeAuto,DetectorType,VerticalScale)
            %CONFIGURE This function configures the acquisition attributes of the IviSpecAn.
            
            obj.checkValidObj();
			error(nargchk(6,6,nargin,'struct'))
            ContinuousSweepMode = obj.checkScalarBoolArg(ContinuousSweepMode,'ContinuousSweepMode');
            NumberOfSweeps = obj.checkScalarInt32Arg(NumberOfSweeps,'NumberOfSweeps');
            DetectorTypeAuto = obj.checkScalarBoolArg(DetectorTypeAuto,'DetectorTypeAuto');
            try
                obj.interface.Configure(logical(ContinuousSweepMode),int32(NumberOfSweeps),logical(DetectorTypeAuto),int32(DetectorType),int32(VerticalScale));
            catch e
                obj.interpretError(e);
            end
        end

        function val = GetDetectorTrace(obj,TraceNo)
            %GETDETECTORTRACE Gets the detector type for the selected trace.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            TraceNo = obj.checkScalarInt32Arg(TraceNo,'TraceNo');
            try
                [val] = obj.interface.GetDetectorTrace(int32(TraceNo));
            catch e
                obj.interpretError(e);
            end
        end

        function val = GetDetectorTraceAutoEnabled(obj,TraceNo)
            %GETDETECTORTRACEAUTOENABLED Queries if the detector selection mode for the currently selected trace is set to Auto.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            TraceNo = obj.checkScalarInt32Arg(TraceNo,'TraceNo');
            try
                [val] = obj.interface.GetDetectorTraceAutoEnabled(int32(TraceNo));
            catch e
                obj.interpretError(e);
            end
        end

        function SetDetectorTrace(obj,TraceNo,DetectorType)
            %SETDETECTORTRACE Selects a detector. The detector selected is then applied to the selected trace.
            
            obj.checkValidObj();
			error(nargchk(3,3,nargin,'struct'))
            TraceNo = obj.checkScalarInt32Arg(TraceNo,'TraceNo');
            try
                obj.interface.SetDetectorTrace(int32(TraceNo),int32(DetectorType));
            catch e
                obj.interpretError(e);
            end
        end

        function SetDetectorTraceAutoEnabled(obj,TraceNo,Auto)
            %SETDETECTORTRACEAUTOENABLED Sets the detector for the currently selected trace to Auto. This will immediately apply the auto rules to determine a new detector value.
            
            obj.checkValidObj();
			error(nargchk(3,3,nargin,'struct'))
            TraceNo = obj.checkScalarInt32Arg(TraceNo,'TraceNo');
            Auto = obj.checkScalarBoolArg(Auto,'Auto');
            try
                obj.interface.SetDetectorTraceAutoEnabled(int32(TraceNo),logical(Auto));
            catch e
                obj.interpretError(e);
            end
        end

    end

end
