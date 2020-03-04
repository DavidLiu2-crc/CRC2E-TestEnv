classdef Bandwidth < instrument.ivicom.Interface
    %BANDWIDTH AgXSAnBasic SpectrumBandwidth interface.
    
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

        %ACQUISITION The digital IF Bandwidth.
        Acquisition

        %ACQUISITIONAUTOENABLED Select auto or manual control of the pre-FFT BW.
        AcquisitionAutoEnabled

        %ACQUISITIONSHAPE Allows you to select the type of IF filter (post ADC, digital filter) that is used.
        AcquisitionShape

        %RESOLUTION The resolution bandwidth for the FFT. This is the bandwidth used for resolving the FFT measurement.
        Resolution

        %RESOLUTIONAUTOENABLED Enable or disable the auto selection of resolution bandwidth for the FFT.
        ResolutionAutoEnabled

    end

    %% Property access methods
    methods

        %% Acquisition property access methods
        function value = get.Acquisition(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Acquisition;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Acquisition(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'Acquisition');
            try
                obj.interface.Acquisition = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% AcquisitionAutoEnabled property access methods
        function value = get.AcquisitionAutoEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.AcquisitionAutoEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.AcquisitionAutoEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'AcquisitionAutoEnabled');
            try
                obj.interface.AcquisitionAutoEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% AcquisitionShape property access methods
        function value = get.AcquisitionShape(obj)
            obj.checkValidObj();
            try
                value = obj.interface.AcquisitionShape;
            catch e
                obj.interpretError(e);
            end
        end
		function set.AcquisitionShape(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.AcquisitionShape = newValue;
            catch e
                obj.interpretError(e);
            end
        end

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

        %% ResolutionAutoEnabled property access methods
        function value = get.ResolutionAutoEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.ResolutionAutoEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.ResolutionAutoEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'ResolutionAutoEnabled');
            try
                obj.interface.ResolutionAutoEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

end
