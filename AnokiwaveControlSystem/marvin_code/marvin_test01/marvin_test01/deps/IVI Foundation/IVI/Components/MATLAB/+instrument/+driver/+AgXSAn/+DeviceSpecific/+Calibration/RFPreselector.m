classdef RFPreselector < instrument.ivicom.Interface
    %RFPRESELECTOR IAgXSAnCalibrationRFPreselector interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = RFPreselector(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %AUTOALERTENABLED Enables/disables the display of RF Preselector alignment required message on the status line.
        AutoAlertEnabled

    end

    %% Property access methods
    methods

        %% AutoAlertEnabled property access methods
        function value = get.AutoAlertEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.AutoAlertEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.AutoAlertEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'AutoAlertEnabled');
            try
                obj.interface.AutoAlertEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

    %% Public Methods
    methods

        function CalibrateConductedBand(obj)
            %CALIBRATECONDUCTEDBAND Invokes the alignment of the RF Preselector on Conducted band, 20Hz to 30MHz
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.CalibrateConductedBand();
            catch e
                obj.interpretError(e);
            end
        end

        function CalibrateRadiatedBand(obj)
            %CALIBRATERADIATEDBAND Invokes the alignment of the RF Preselector on Radiated band, 30MHz to 3.6GHz.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.CalibrateRadiatedBand();
            catch e
                obj.interpretError(e);
            end
        end

        function CalibrateFullBand(obj)
            %CALIBRATEFULLBAND Invoke the alignment of the RF Preselector on both Conducted and Radiated bands, 20Hz to 3.6GHz.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.CalibrateFullBand();
            catch e
                obj.interpretError(e);
            end
        end

        function val = QueryAlignConductedBandTimestamp(obj)
            %QUERYALIGNCONDUCTEDBANDTIMESTAMP Gets the date and time the last successful Align Now, 20 Hz ? 30MHz was executed. The date is separated from the time by a semi-colon character.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                [val] = obj.interface.QueryAlignConductedBandTimestamp();
            catch e
                obj.interpretError(e);
            end
        end

        function val = QueryAlignRadiatedBandTimestamp(obj)
            %QUERYALIGNRADIATEDBANDTIMESTAMP Gets the date and time the last successful Align Now, 30 MHz ? 3.6GHz was executed. The date is separated from the time by a semi-colon character.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                [val] = obj.interface.QueryAlignRadiatedBandTimestamp();
            catch e
                obj.interpretError(e);
            end
        end

        function val = QueryAlignConductedBandTemprature(obj)
            %QUERYALIGNCONDUCTEDBANDTEMPRATURE Gets the temprature in degrees Centigrade at which the last successful Align Now, 20 Hz ? 30 MHz was executed.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                [val] = obj.interface.QueryAlignConductedBandTemprature();
            catch e
                obj.interpretError(e);
            end
        end

        function val = QueryAlignRadiatedBandTemprature(obj)
            %QUERYALIGNRADIATEDBANDTEMPRATURE Gets the temprature in degrees Centigrade at which the last successful Align Now, 30 MHz ? 3.6 GHz was executed.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                [val] = obj.interface.QueryAlignRadiatedBandTemprature();
            catch e
                obj.interpretError(e);
            end
        end

    end

end
