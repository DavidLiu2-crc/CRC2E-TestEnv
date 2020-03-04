classdef Carrier < instrument.ivicom.Interface
    %CARRIER IAgXSAn SAACPCarrier interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Carrier(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);

            %% Initialize properties
            try
                obj.List = instrument.driver.AgXSAn.DeviceSpecific.SA3.ACP2.Carrier.List(obj.interface.List);
            catch %#ok<CTCH>
            end

        end
        
        function delete(obj)
            obj.List = [];
        end

    end
    
    %% Public Properties
    properties

        %COUNT The number of carriers to be measured.
        Count

        %CPSD The power spectral density in the carrier (main channel) that is used to compute the relative power spectral density values for the offsets when Meas Type is set to PSD Ref.
        CPSD

        %REFERENCEFREQUENCY The reference carrier frequency.
        ReferenceFrequency

        %REFERENCEFREQUENCYAUTOENABLED Sets the reference carrier frequency to Auto/Manual.
        ReferenceFrequencyAutoEnabled

        %REFERENCELEVEL The multi-carrier power reference.
        ReferenceLevel

        %REFERENCELEVELAUTOENABLED Sets the reference carrier power to Auto/Manual.
        ReferenceLevelAutoEnabled

        %REFERENCENUMBER The reference carrier. Relative power measurements are made from the reference carrier.
        ReferenceNumber

        %REFERENCENUMBERAUTOENABLED Sets the reference carrier selection to Auto/Manual.
        ReferenceNumberAutoEnabled

    end

    %% Public Read Only Properties
    properties (SetAccess = private)

        %LIST Pointer to IAgXSAnSAACPCarrierList interface. Read Only.
        List

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
		function set.Count(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarInt32Arg(newValue,'Count');
            try
                obj.interface.Count = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% CPSD property access methods
        function value = get.CPSD(obj)
            obj.checkValidObj();
            try
                value = obj.interface.CPSD;
            catch e
                obj.interpretError(e);
            end
        end
		function set.CPSD(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'CPSD');
            try
                obj.interface.CPSD = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% ReferenceFrequency property access methods
        function value = get.ReferenceFrequency(obj)
            obj.checkValidObj();
            try
                value = obj.interface.ReferenceFrequency;
            catch e
                obj.interpretError(e);
            end
        end
		function set.ReferenceFrequency(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'ReferenceFrequency');
            try
                obj.interface.ReferenceFrequency = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% ReferenceFrequencyAutoEnabled property access methods
        function value = get.ReferenceFrequencyAutoEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.ReferenceFrequencyAutoEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.ReferenceFrequencyAutoEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'ReferenceFrequencyAutoEnabled');
            try
                obj.interface.ReferenceFrequencyAutoEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% ReferenceLevel property access methods
        function value = get.ReferenceLevel(obj)
            obj.checkValidObj();
            try
                value = obj.interface.ReferenceLevel;
            catch e
                obj.interpretError(e);
            end
        end
		function set.ReferenceLevel(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'ReferenceLevel');
            try
                obj.interface.ReferenceLevel = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% ReferenceLevelAutoEnabled property access methods
        function value = get.ReferenceLevelAutoEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.ReferenceLevelAutoEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.ReferenceLevelAutoEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'ReferenceLevelAutoEnabled');
            try
                obj.interface.ReferenceLevelAutoEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% ReferenceNumber property access methods
        function value = get.ReferenceNumber(obj)
            obj.checkValidObj();
            try
                value = obj.interface.ReferenceNumber;
            catch e
                obj.interpretError(e);
            end
        end
		function set.ReferenceNumber(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarInt32Arg(newValue,'ReferenceNumber');
            try
                obj.interface.ReferenceNumber = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% ReferenceNumberAutoEnabled property access methods
        function value = get.ReferenceNumberAutoEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.ReferenceNumberAutoEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.ReferenceNumberAutoEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'ReferenceNumberAutoEnabled');
            try
                obj.interface.ReferenceNumberAutoEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% List property access methods
        function value = get.List(obj)
            obj.checkValidObj();
            if isempty(obj.List)
                try
                    obj.List = instrument.driver.AgXSAn.DeviceSpecific.SA3.ACP2.Carrier.List(obj.interface.List);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.List;
        end

    end

end
