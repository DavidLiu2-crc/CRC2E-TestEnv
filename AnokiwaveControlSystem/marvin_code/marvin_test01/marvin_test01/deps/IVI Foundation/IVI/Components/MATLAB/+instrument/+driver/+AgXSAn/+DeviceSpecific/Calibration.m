classdef Calibration < instrument.ivicom.Interface
    %CALIBRATION IAgXSAn Calibration interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Calibration(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);

            %% Initialize properties
            try
                obj.RFPreselector = instrument.driver.AgXSAn.DeviceSpecific.Calibration.RFPreselector(obj.interface.RFPreselector);
            catch %#ok<CTCH>
            end

        end
        
        function delete(obj)
            obj.RFPreselector = [];
        end

    end
    
    %% Public Properties
    properties

        %AUTOENABLED Turns the automatic alignment routines on and off. These are run continuously, in the background at the end of each sweep. When turned on, they are run once every 5 minutes, or if the ambient temperature changes by 3 degrees.
        AutoEnabled

        %AUTOALERTMODE Sets/Gets the mode for calibration Auto Alert feature.
        AutoAlertMode

    end

    %% Public Read Only Properties
    properties (SetAccess = private)

        %RFPRESELECTOR Pointer to the IAgXSAnCalibrationRFPreselector interface. Read Only.
        RFPreselector

    end

    %% Property access methods
    methods

        %% AutoEnabled property access methods
        function value = get.AutoEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.AutoEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.AutoEnabled(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.AutoEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% AutoAlertMode property access methods
        function value = get.AutoAlertMode(obj)
            obj.checkValidObj();
            try
                value = obj.interface.AutoAlertMode;
            catch e
                obj.interpretError(e);
            end
        end
		function set.AutoAlertMode(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.AutoAlertMode = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% RFPreselector property access methods
        function value = get.RFPreselector(obj)
            obj.checkValidObj();
            if isempty(obj.RFPreselector)
                try
                    obj.RFPreselector = instrument.driver.AgXSAn.DeviceSpecific.Calibration.RFPreselector(obj.interface.RFPreselector);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.RFPreselector;
        end

    end

    %% Public Methods
    methods

        function Calibrate(obj)
            %CALIBRATE Performs an alignment of all instrument assemblies.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.Calibrate();
            catch e
                obj.interpretError(e);
            end
        end

    end

end
