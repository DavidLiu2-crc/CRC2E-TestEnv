classdef AgXSAn < instrument.ivicom.IviSpecAn
    %AGXSAN IVI Driver for Keysight X series analyzers
    
    %% Construction/Clean up
    methods

        function obj = AgXSAn()
            
            %% construct superclass
            obj@instrument.ivicom.IviSpecAn('AgXSAn.AgXSAn');
            
            try
                deviceSpecificInterface = obj.getCOMInterface('IAgXSAn6');
            catch %#ok<CTCH>
                error('instrument:driver:driverInvalid','The interface ''IAgXSAn6'' was not found.  The driver specified may not be an IVI-COM driver.');
            end
            try
                iviDriverInterface = obj.getCOMInterface('IIviDriver');
            catch %#ok<CTCH>
                error('instrument:driver:driverInvalid','The interface ''IIviDriver'' was not found.  The driver specified may not be an IviDriver IVI-COM driver.');
            end

            %% Initialize properties
            try
                obj.DeviceSpecific = instrument.driver.AgXSAn.DeviceSpecific(deviceSpecificInterface);
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
