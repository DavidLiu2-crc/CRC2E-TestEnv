classdef MeasureAtMarker < instrument.ivicom.Interface
    %MEASUREATMARKER IAgXSAnSAMarkerMeasureAtMarker interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = MeasureAtMarker(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %COUPLEENABLED Controls the coupling between the RBW to the average type.
        CoupleEnabled

        %PRESELECTORCENTERINGENABLED Controls the automatic centering of the preselector for the Measure at Marker function.
        PreselectorCenteringEnabled

    end

    %% Property access methods
    methods

        %% CoupleEnabled property access methods
        function value = get.CoupleEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.CoupleEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.CoupleEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'CoupleEnabled');
            try
                obj.interface.CoupleEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% PreselectorCenteringEnabled property access methods
        function value = get.PreselectorCenteringEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.PreselectorCenteringEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.PreselectorCenteringEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'PreselectorCenteringEnabled');
            try
                obj.interface.PreselectorCenteringEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

    %% Public Methods
    methods

        function ConfigureDetectorType(obj,DetectorIdentifier,DetectorType)
            %CONFIGUREDETECTORTYPE Sets the detector for measure at marker function.
            
            obj.checkValidObj();
			error(nargchk(3,3,nargin,'struct'))
            DetectorIdentifier = obj.checkScalarInt32Arg(DetectorIdentifier,'DetectorIdentifier');
            try
                obj.interface.ConfigureDetectorType(int32(DetectorIdentifier),int32(DetectorType));
            catch e
                obj.interpretError(e);
            end
        end

        function val = QueryDetectorType(obj,DetectorIdentifier)
            %QUERYDETECTORTYPE Gets the detector for measure at marker function.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            DetectorIdentifier = obj.checkScalarInt32Arg(DetectorIdentifier,'DetectorIdentifier');
            try
                [val] = obj.interface.QueryDetectorType(int32(DetectorIdentifier));
            catch e
                obj.interpretError(e);
            end
        end

        function ConfigureDetectorDwellTime(obj,DetectorIdentifier,DwellTime)
            %CONFIGUREDETECTORDWELLTIME Sets the detector dwell time for measure at marker function.
            
            obj.checkValidObj();
			error(nargchk(3,3,nargin,'struct'))
            DetectorIdentifier = obj.checkScalarInt32Arg(DetectorIdentifier,'DetectorIdentifier');
            DwellTime = obj.checkScalarDoubleArg(DwellTime,'DwellTime');
            try
                obj.interface.ConfigureDetectorDwellTime(int32(DetectorIdentifier),double(DwellTime));
            catch e
                obj.interpretError(e);
            end
        end

        function val = QueryDetectorDwellTime(obj,DetectorIdentifier)
            %QUERYDETECTORDWELLTIME Gets the detector dwell time for measure at marker function.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            DetectorIdentifier = obj.checkScalarInt32Arg(DetectorIdentifier,'DetectorIdentifier');
            try
                [val] = obj.interface.QueryDetectorDwellTime(int32(DetectorIdentifier));
            catch e
                obj.interpretError(e);
            end
        end

        function val = Read(obj)
            %READ Performs a Measure at Marker function at Marker's current frequency and, when completed, returns the results of the measure in a query.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.Read();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

    end

end
