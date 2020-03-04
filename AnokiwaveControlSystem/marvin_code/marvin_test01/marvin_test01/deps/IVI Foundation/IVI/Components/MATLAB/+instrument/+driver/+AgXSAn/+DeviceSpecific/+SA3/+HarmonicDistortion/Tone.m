classdef Tone < instrument.ivicom.Interface
    %TONE IAgXSAnSAHarmonicDistortionTone interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Tone(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);

            %% Initialize properties
            try
                obj.Bandwidth = instrument.driver.AgXSAn.DeviceSpecific.SA3.HarmonicDistortion.Tone.Bandwidth(obj.interface.Bandwidth);
            catch %#ok<CTCH>
            end

        end
        
        function delete(obj)
            obj.Bandwidth = [];
        end

    end
    
    %% Public Read Only Properties
    properties (SetAccess = private)

        %BANDWIDTH Pointer to IAgXSAnSAHarmonicDistortionToneBandwidth interface. Read Only.
        Bandwidth

    end

    %% Property access methods
    methods

        %% Bandwidth property access methods
        function value = get.Bandwidth(obj)
            obj.checkValidObj();
            if isempty(obj.Bandwidth)
                try
                    obj.Bandwidth = instrument.driver.AgXSAn.DeviceSpecific.SA3.HarmonicDistortion.Tone.Bandwidth(obj.interface.Bandwidth);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Bandwidth;
        end

    end

    %% Public Methods
    methods

        function ConfigureEnabled(obj,HarmonicNumber,State)
            %CONFIGUREENABLED Sets whether the selected harmonic is measured (on) or not measured (off).
            
            obj.checkValidObj();
			error(nargchk(3,3,nargin,'struct'))
            HarmonicNumber = obj.checkScalarInt32Arg(HarmonicNumber,'HarmonicNumber');
            State = obj.checkScalarBoolArg(State,'State');
            try
                obj.interface.ConfigureEnabled(int32(HarmonicNumber),logical(State));
            catch e
                obj.interpretError(e);
            end
        end

        function val = QueryEnabled(obj,HarmonicNumber)
            %QUERYENABLED Gets whether the selected harmonic is measured (on) or not measured (off).
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            HarmonicNumber = obj.checkScalarInt32Arg(HarmonicNumber,'HarmonicNumber');
            try
                [val] = obj.interface.QueryEnabled(int32(HarmonicNumber));
            catch e
                obj.interpretError(e);
            end
        end

        function ConfigureSweepTime(obj,HarmonicNumber,SweepTime)
            %CONFIGURESWEEPTIME Sets the dwell time for the specified harmonic
            
            obj.checkValidObj();
			error(nargchk(3,3,nargin,'struct'))
            HarmonicNumber = obj.checkScalarInt32Arg(HarmonicNumber,'HarmonicNumber');
            SweepTime = obj.checkScalarDoubleArg(SweepTime,'SweepTime');
            try
                obj.interface.ConfigureSweepTime(int32(HarmonicNumber),double(SweepTime));
            catch e
                obj.interpretError(e);
            end
        end

        function val = QuerySweepTime(obj,HarmonicNumber)
            %QUERYSWEEPTIME Gets the dwell time for the specified harmonic
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            HarmonicNumber = obj.checkScalarInt32Arg(HarmonicNumber,'HarmonicNumber');
            try
                [val] = obj.interface.QuerySweepTime(int32(HarmonicNumber));
            catch e
                obj.interpretError(e);
            end
        end

        function ConfigureSweepTimeAutoEnabled(obj,HarmonicNumber,State)
            %CONFIGURESWEEPTIMEAUTOENABLED Sets whether the selected harmonic sweep time is set automatically or manually.
            
            obj.checkValidObj();
			error(nargchk(3,3,nargin,'struct'))
            HarmonicNumber = obj.checkScalarInt32Arg(HarmonicNumber,'HarmonicNumber');
            State = obj.checkScalarBoolArg(State,'State');
            try
                obj.interface.ConfigureSweepTimeAutoEnabled(int32(HarmonicNumber),logical(State));
            catch e
                obj.interpretError(e);
            end
        end

        function val = QuerySweepTimeAutoEnabled(obj,HarmonicNumber)
            %QUERYSWEEPTIMEAUTOENABLED Gets whether the selected harmonic sweep time is set automatically or manually.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            HarmonicNumber = obj.checkScalarInt32Arg(HarmonicNumber,'HarmonicNumber');
            try
                [val] = obj.interface.QuerySweepTimeAutoEnabled(int32(HarmonicNumber));
            catch e
                obj.interpretError(e);
            end
        end

        function ConfigureSpan(obj,HarmonicNumber,Span)
            %CONFIGURESPAN Sets the span of the selected harmonic measurement.
            
            obj.checkValidObj();
			error(nargchk(3,3,nargin,'struct'))
            HarmonicNumber = obj.checkScalarInt32Arg(HarmonicNumber,'HarmonicNumber');
            Span = obj.checkScalarDoubleArg(Span,'Span');
            try
                obj.interface.ConfigureSpan(int32(HarmonicNumber),double(Span));
            catch e
                obj.interpretError(e);
            end
        end

        function val = QuerySpan(obj,HarmonicNumber)
            %QUERYSPAN Gets the span of the selected harmonic measurement.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            HarmonicNumber = obj.checkScalarInt32Arg(HarmonicNumber,'HarmonicNumber');
            try
                [val] = obj.interface.QuerySpan(int32(HarmonicNumber));
            catch e
                obj.interpretError(e);
            end
        end

        function ConfigureFrequency(obj,HarmonicNumber,Frequency)
            %CONFIGUREFREQUENCY Sets the frequency of the selected harmonic.
            
            obj.checkValidObj();
			error(nargchk(3,3,nargin,'struct'))
            HarmonicNumber = obj.checkScalarInt32Arg(HarmonicNumber,'HarmonicNumber');
            Frequency = obj.checkScalarDoubleArg(Frequency,'Frequency');
            try
                obj.interface.ConfigureFrequency(int32(HarmonicNumber),double(Frequency));
            catch e
                obj.interpretError(e);
            end
        end

        function val = QueryFrequency(obj,HarmonicNumber)
            %QUERYFREQUENCY Gets the frequency of the selected harmonic.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            HarmonicNumber = obj.checkScalarInt32Arg(HarmonicNumber,'HarmonicNumber');
            try
                [val] = obj.interface.QueryFrequency(int32(HarmonicNumber));
            catch e
                obj.interpretError(e);
            end
        end

    end

end
