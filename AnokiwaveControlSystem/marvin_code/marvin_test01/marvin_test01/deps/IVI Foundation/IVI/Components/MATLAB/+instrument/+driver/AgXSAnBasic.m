classdef AgXSAnBasic < instrument.ivicom.IviDriver
    %AGXSANBASIC IQ Analyzer Basic measurement application for the AgXSAn host driver
    
    %% Construction/Clean up
    methods

        function obj = AgXSAnBasic()
            
            %% construct superclass
            obj@instrument.ivicom.IviDriver('AgXSAnBasic.AgXSAnBasic');
            
            try
                deviceSpecificInterface = obj.getCOMInterface('IAgXSAnBasic2');
            catch %#ok<CTCH>
                error('instrument:driver:driverInvalid','The interface ''IAgXSAnBasic2'' was not found.  The driver specified may not be an IVI-COM driver.');
            end
            try
                iviDriverInterface = obj.getCOMInterface('IIviDriver');
            catch %#ok<CTCH>
                error('instrument:driver:driverInvalid','The interface ''IIviDriver'' was not found.  The driver specified may not be an IviDriver IVI-COM driver.');
            end

            %% Initialize properties
            try
                obj.DeviceSpecific = instrument.driver.AgXSAnBasic.DeviceSpecific(deviceSpecificInterface);
                obj.IviDriver = instrument.ivicom.IviDriver(iviDriverInterface);
            catch %#ok<CTCH>
            end

        end

    end
    
    %% Public Read Only Properties
    properties (SetAccess = private)

        %DEVICESPECIFIC Device Specific interface for the IVI-COM driver
        %Read Only.
        DeviceSpecific

        %IVIDRIVER IviDriver interface for the IVI-COM driver
        %Read Only.
        IviDriver

    end

end
