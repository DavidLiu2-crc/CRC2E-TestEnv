classdef Corrections < instrument.ivicom.RepeatedCapability
    %CORRECTIONS AgXSAn correction collection interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Corrections(interface)
            
            %% construct superclass
            obj@instrument.ivicom.RepeatedCapability(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %ALLENABLED Applies amplitude corrections which are marked as ON to the measured data. If this is set to OFF, then no amplitude correction sets will be used, regardless of their individual on/off settings.
        AllEnabled

        %IMPEDANCE Sets the input impedance for unit conversions.
        Impedance

        %BASESTATIONGAIN Sets/Gets an external attenuation value for Base Transceiver Station tests.
        BaseStationGain

        %EXTERNALGAIN Compensates for external gain/loss. The gain is subtracted from the amplitude readout so that the displayed signal level represents the signal level at the input of the external device.
        ExternalGain

        %MOBILESTATIONGAIN Sets an external gain/attenuation value for MS (Mobile Station) tests.
        MobileStationGain

        %NOISEFLOOREXTENSTIONENABLED Turns on the Noise Floor Extension function.
        NoiseFloorExtenstionEnabled

    end

    %% Public Read Only Properties
    properties (SetAccess = private)

        %COUNT The number of corrections. Read Only.
        Count

    end

    %% Property access methods
    methods

        %% Count property access methods
        function value = get.Count(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Count;
            catch e
                obj.interpretError(e);
            end
        end

        %% AllEnabled property access methods
        function value = get.AllEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.AllEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.AllEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'AllEnabled');
            try
                obj.interface.AllEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Impedance property access methods
        function value = get.Impedance(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Impedance;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Impedance(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.Impedance = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% BaseStationGain property access methods
        function value = get.BaseStationGain(obj)
            obj.checkValidObj();
            try
                value = obj.interface.BaseStationGain;
            catch e
                obj.interpretError(e);
            end
        end
		function set.BaseStationGain(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'BaseStationGain');
            try
                obj.interface.BaseStationGain = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% ExternalGain property access methods
        function value = get.ExternalGain(obj)
            obj.checkValidObj();
            try
                value = obj.interface.ExternalGain;
            catch e
                obj.interpretError(e);
            end
        end
		function set.ExternalGain(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'ExternalGain');
            try
                obj.interface.ExternalGain = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% MobileStationGain property access methods
        function value = get.MobileStationGain(obj)
            obj.checkValidObj();
            try
                value = obj.interface.MobileStationGain;
            catch e
                obj.interpretError(e);
            end
        end
		function set.MobileStationGain(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'MobileStationGain');
            try
                obj.interface.MobileStationGain = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% NoiseFloorExtenstionEnabled property access methods
        function value = get.NoiseFloorExtenstionEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.NoiseFloorExtenstionEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.NoiseFloorExtenstionEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'NoiseFloorExtenstionEnabled');
            try
                obj.interface.NoiseFloorExtenstionEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

    %% Public Methods
    methods

        function DeleteAll(obj)
            %DELETEALL Erases all correction values for all 4 Amplitude Correction sets.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.DeleteAll();
            catch e
                obj.interpretError(e);
            end
        end

        function val = Item(obj,Name)
            %ITEM An interface reference pointer to the IAgXSAnInputRFCorrection interface which is selected by the correction name.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            Name = obj.checkScalarStringArg(Name,'Name');
            try
                [val] = instrument.driver.AgXSAn.DeviceSpecific.Input2.RF.Corrections.Item(obj.interface.Item(char(Name)));
            catch e
                obj.interpretError(e);
            end
        end

        function val = Name(obj,Index)
            %NAME The correction name for a given index.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            Index = obj.checkScalarInt32Arg(Index,'Index');
            try
                [val] = obj.interface.Name(int32(Index));
            catch e
                obj.interpretError(e);
            end
        end

    end

end
