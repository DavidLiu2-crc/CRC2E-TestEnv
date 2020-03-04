classdef RangeTable < instrument.ivicom.Interface
    %RANGETABLE IAgXSAnSAHarmonicDistortionRangeTable interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = RangeTable(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);

            %% Initialize properties
            try
                obj.Bandwidth = instrument.driver.AgXSAn.DeviceSpecific.SA.HarmonicDistortion.RangeTable.Bandwidth(obj.interface.Bandwidth);
            catch %#ok<CTCH>
            end

        end
        
        function delete(obj)
            obj.Bandwidth = [];
        end

    end
    
    %% Public Properties
    properties

        %ENABLED Enables/Disables the range table.
        Enabled

    end

    %% Public Read Only Properties
    properties (SetAccess = private)

        %BANDWIDTH Pointer to IAgXSAnSAHarmonicDistortionRangeTableBandwidth interface. Read Only.
        Bandwidth

    end

    %% Property access methods
    methods

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

        %% Bandwidth property access methods
        function value = get.Bandwidth(obj)
            obj.checkValidObj();
            if isempty(obj.Bandwidth)
                try
                    obj.Bandwidth = instrument.driver.AgXSAn.DeviceSpecific.SA.HarmonicDistortion.RangeTable.Bandwidth(obj.interface.Bandwidth);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Bandwidth;
        end

    end

    %% Public Methods
    methods

        function AutoFill(obj)
            %AUTOFILL Automatically sets up the range table based on the first entry in the range table.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.AutoFill();
            catch e
                obj.interpretError(e);
            end
        end

        function ConfigureSweepTime(obj,SweepTime)
            %CONFIGURESWEEPTIME Sets the dwell time for the specified harmonic. In zero-span, the auto mode strikes a balance between measurement speed and accuracy; increasing the dwell time will reduce measurement speed while increasing accuracy.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            SweepTime = obj.checkVectorDoubleArg(SweepTime,'SweepTime');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                obj.interface.ConfigureSweepTime(double(SweepTime));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function ConfigureSweepTimeAutoEnabled(obj,State)
            %CONFIGURESWEEPTIMEAUTOENABLED Enables/Disables automatic setting up of harmonics sweep time.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            State = obj.checkVectorBoolArg(State,'State');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                obj.interface.ConfigureSweepTimeAutoEnabled(logical(State));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = QuerySweepTime(obj)
            %QUERYSWEEPTIME Queries the dwell time for the harmonics.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.QuerySweepTime();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = QuerySweepTimeAutoEnabled(obj)
            %QUERYSWEEPTIMEAUTOENABLED Queries the state of function that automatic sets up of sweep time of the harmonics.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.QuerySweepTimeAutoEnabled();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function ConfigureFrequency(obj,Frequency)
            %CONFIGUREFREQUENCY Sets the frequency of the harmonics.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            Frequency = obj.checkVectorDoubleArg(Frequency,'Frequency');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                obj.interface.ConfigureFrequency(double(Frequency));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = QueryFrequency(obj)
            %QUERYFREQUENCY Queries the frequency of the harmonics.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.QueryFrequency();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function ConfigureToneEnabled(obj,State)
            %CONFIGURETONEENABLED Sets whether a particular harmonic is measured (on) or not measured (off).
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            State = obj.checkVectorBoolArg(State,'State');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                obj.interface.ConfigureToneEnabled(logical(State));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = QueryToneEnabled(obj)
            %QUERYTONEENABLED Queries whether a particular harmonic is measured (on) or not measured (off).
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.QueryToneEnabled();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function ConfigureSpan(obj,Span)
            %CONFIGURESPAN This sets the span of the selected harmonic measurement. For maximum accuracy, zero-span is preferred. If non-zero-span is chosen, the measured value will be the results of the measurement at the center frequency.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            Span = obj.checkVectorDoubleArg(Span,'Span');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                obj.interface.ConfigureSpan(double(Span));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = QuerySpan(obj)
            %QUERYSPAN Gets the span of the selected harmonic measurement.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.QuerySpan();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

    end

end
