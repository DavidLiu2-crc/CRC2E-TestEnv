classdef DeviceSpecific < instrument.ivicom.Interface
    %DEVICESPECIFIC IAgXSAnBasic2 interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = DeviceSpecific(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);

            %% Initialize properties
            try
                obj.Spectrum2 = instrument.driver.AgXSAnBasic.DeviceSpecific.Spectrum2(obj.interface.Spectrum2);
            catch %#ok<CTCH>
            end

            try
                obj.Waveform2 = instrument.driver.AgXSAnBasic.DeviceSpecific.Waveform2(obj.interface.Waveform2);
            catch %#ok<CTCH>
            end

            try
                obj.Trigger2 = instrument.driver.AgXSAnBasic.DeviceSpecific.Trigger2(obj.interface.Trigger2);
            catch %#ok<CTCH>
            end

            try
                obj.Input2 = instrument.driver.AgXSAnBasic.DeviceSpecific.Input2(obj.interface.Input2);
            catch %#ok<CTCH>
            end

            try
                obj.Status = instrument.driver.AgXSAnBasic.DeviceSpecific.Status(obj.interface.Status);
            catch %#ok<CTCH>
            end

            try
                obj.System = instrument.driver.AgXSAnBasic.DeviceSpecific.System(obj.interface.System);
            catch %#ok<CTCH>
            end

            try
                obj.Frequency = instrument.driver.AgXSAnBasic.DeviceSpecific.Frequency(obj.interface.Frequency);
            catch %#ok<CTCH>
            end

            try
                obj.Input = instrument.driver.AgXSAnBasic.DeviceSpecific.Input(obj.interface.Input);
            catch %#ok<CTCH>
            end

            try
                obj.Spectrum = instrument.driver.AgXSAnBasic.DeviceSpecific.Spectrum(obj.interface.Spectrum);
            catch %#ok<CTCH>
            end

            try
                obj.Trigger = instrument.driver.AgXSAnBasic.DeviceSpecific.Trigger(obj.interface.Trigger);
            catch %#ok<CTCH>
            end

            try
                obj.Waveform = instrument.driver.AgXSAnBasic.DeviceSpecific.Waveform(obj.interface.Waveform);
            catch %#ok<CTCH>
            end

            try
                obj.DriverOperation = instrument.driver.AgXSAnBasic.DeviceSpecific.DriverOperation(obj.interface.DriverOperation);
            catch %#ok<CTCH>
            end

            try
                obj.Identity = instrument.driver.AgXSAnBasic.DeviceSpecific.Identity(obj.interface.Identity);
            catch %#ok<CTCH>
            end

            try
                obj.Utility = instrument.driver.AgXSAnBasic.DeviceSpecific.Utility(obj.interface.Utility);
            catch %#ok<CTCH>
            end

        end
        
        function delete(obj)
            obj.Spectrum2 = [];
            obj.Waveform2 = [];
            obj.Trigger2 = [];
            obj.Input2 = [];
            obj.Status = [];
            obj.System = [];
            obj.Frequency = [];
            obj.Input = [];
            obj.Spectrum = [];
            obj.Trigger = [];
            obj.Waveform = [];
            obj.DriverOperation = [];
            obj.Identity = [];
            obj.Utility = [];
        end

    end
    
    %% Public Read Only Properties
    properties (SetAccess = private)

        %SPECTRUM2 Pointer to the IAgXSAnBasicSpectrum interface. Read Only.
        Spectrum2

        %WAVEFORM2 Pointer to the IAgXSAnBasicWaveform interface. Read Only.
        Waveform2

        %TRIGGER2 Pointer to the IAgXSAnBasicTrigger interface. Read Only.
        Trigger2

        %INPUT2 Pointer to the IAgXSAnBasicInput interface. Read Only.
        Input2

        %STATUS Pointer to the IAgXSAnBasic2Status interface. Read Only.
        Status

        %SYSTEM Pointer to the IAgXSAnBasic2System interface. Read Only.
        System

        %FREQUENCY Pointer to the IAgXSAnBasicFrequency interface. Read Only.
        Frequency

        %INPUT Pointer to the IAgXSAnBasicInput interface. Read Only.
        Input

        %SPECTRUM Pointer to the IAgXSAnBasicSpectrum interface. Read Only.
        Spectrum

        %TRIGGER Pointer to the IAgXSAnBasicTrigger interface. Read Only.
        Trigger

        %WAVEFORM Pointer to the IAgXSAnBasicWaveform interface. Read Only.
        Waveform

        %DRIVEROPERATION Pointer to the IIviDriverOperation interface Read Only.
        DriverOperation

        %IDENTITY Pointer to the IIviDriverIdentity interface Read Only.
        Identity

        %UTILITY Pointer to the IIviDriverUtility interface Read Only.
        Utility

        %INITIALIZED Initialized is True between a successful call to the Initialize method and a successful call to the Close method, and False at all other times. Read Only.
        Initialized

    end

    %% Property access methods
    methods

        %% Spectrum2 property access methods
        function value = get.Spectrum2(obj)
            obj.checkValidObj();
            if isempty(obj.Spectrum2)
                try
                    obj.Spectrum2 = instrument.driver.AgXSAnBasic.DeviceSpecific.Spectrum2(obj.interface.Spectrum2);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Spectrum2;
        end

        %% Waveform2 property access methods
        function value = get.Waveform2(obj)
            obj.checkValidObj();
            if isempty(obj.Waveform2)
                try
                    obj.Waveform2 = instrument.driver.AgXSAnBasic.DeviceSpecific.Waveform2(obj.interface.Waveform2);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Waveform2;
        end

        %% Trigger2 property access methods
        function value = get.Trigger2(obj)
            obj.checkValidObj();
            if isempty(obj.Trigger2)
                try
                    obj.Trigger2 = instrument.driver.AgXSAnBasic.DeviceSpecific.Trigger2(obj.interface.Trigger2);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Trigger2;
        end

        %% Input2 property access methods
        function value = get.Input2(obj)
            obj.checkValidObj();
            if isempty(obj.Input2)
                try
                    obj.Input2 = instrument.driver.AgXSAnBasic.DeviceSpecific.Input2(obj.interface.Input2);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Input2;
        end

        %% Status property access methods
        function value = get.Status(obj)
            obj.checkValidObj();
            if isempty(obj.Status)
                try
                    obj.Status = instrument.driver.AgXSAnBasic.DeviceSpecific.Status(obj.interface.Status);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Status;
        end

        %% System property access methods
        function value = get.System(obj)
            obj.checkValidObj();
            if isempty(obj.System)
                try
                    obj.System = instrument.driver.AgXSAnBasic.DeviceSpecific.System(obj.interface.System);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.System;
        end

        %% Frequency property access methods
        function value = get.Frequency(obj)
            obj.checkValidObj();
            if isempty(obj.Frequency)
                try
                    obj.Frequency = instrument.driver.AgXSAnBasic.DeviceSpecific.Frequency(obj.interface.Frequency);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Frequency;
        end

        %% Input property access methods
        function value = get.Input(obj)
            obj.checkValidObj();
            if isempty(obj.Input)
                try
                    obj.Input = instrument.driver.AgXSAnBasic.DeviceSpecific.Input(obj.interface.Input);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Input;
        end

        %% Spectrum property access methods
        function value = get.Spectrum(obj)
            obj.checkValidObj();
            if isempty(obj.Spectrum)
                try
                    obj.Spectrum = instrument.driver.AgXSAnBasic.DeviceSpecific.Spectrum(obj.interface.Spectrum);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Spectrum;
        end

        %% Trigger property access methods
        function value = get.Trigger(obj)
            obj.checkValidObj();
            if isempty(obj.Trigger)
                try
                    obj.Trigger = instrument.driver.AgXSAnBasic.DeviceSpecific.Trigger(obj.interface.Trigger);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Trigger;
        end

        %% Waveform property access methods
        function value = get.Waveform(obj)
            obj.checkValidObj();
            if isempty(obj.Waveform)
                try
                    obj.Waveform = instrument.driver.AgXSAnBasic.DeviceSpecific.Waveform(obj.interface.Waveform);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Waveform;
        end

        %% DriverOperation property access methods
        function value = get.DriverOperation(obj)
            obj.checkValidObj();
            if isempty(obj.DriverOperation)
                try
                    obj.DriverOperation = instrument.driver.AgXSAnBasic.DeviceSpecific.DriverOperation(obj.interface.DriverOperation);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.DriverOperation;
        end

        %% Identity property access methods
        function value = get.Identity(obj)
            obj.checkValidObj();
            if isempty(obj.Identity)
                try
                    obj.Identity = instrument.driver.AgXSAnBasic.DeviceSpecific.Identity(obj.interface.Identity);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Identity;
        end

        %% Utility property access methods
        function value = get.Utility(obj)
            obj.checkValidObj();
            if isempty(obj.Utility)
                try
                    obj.Utility = instrument.driver.AgXSAnBasic.DeviceSpecific.Utility(obj.interface.Utility);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Utility;
        end

        %% Initialized property access methods
        function value = get.Initialized(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Initialized;
            catch e
                obj.interpretError(e);
            end
        end

    end

    %% Public Methods
    methods

        function Initialize(obj,ResourceName,IdQuery,Reset,OptionString)
            %INITIALIZE Opens the I/O session to the instrument.  Driver methods and properties that access the instrument are only accessible after Initialize is called.  Initialize optionally performs a Reset and queries the instrument to validate the instrument model.
            
            obj.checkValidObj();
			error(nargchk(5,5,nargin,'struct'))
            ResourceName = obj.checkScalarStringArg(ResourceName,'ResourceName');
            IdQuery = obj.checkScalarBoolArg(IdQuery,'IdQuery');
            Reset = obj.checkScalarBoolArg(Reset,'Reset');
            OptionString = obj.checkScalarStringArg(OptionString,'OptionString');
            try
                obj.interface.Initialize(char(ResourceName),logical(IdQuery),logical(Reset),char(OptionString));
            catch e
                obj.interpretError(e);
            end
        end

        function Close(obj)
            %CLOSE Closes the I/O session to the instrument.  Driver methods and properties that access the instrument are not accessible after Close is called.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.Close();
            catch e
                obj.interpretError(e);
            end
        end

    end

end
