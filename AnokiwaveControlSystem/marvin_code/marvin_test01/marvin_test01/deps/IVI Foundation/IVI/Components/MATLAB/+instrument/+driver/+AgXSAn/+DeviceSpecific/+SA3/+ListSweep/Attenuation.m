classdef Attenuation < instrument.ivicom.Interface
    %ATTENUATION IAgXSAnSAListSweepAttenuation interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Attenuation(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Read Only Properties
    properties (SetAccess = private)

        %ELECTRONICPOINTS This command defines a list of analyzer electronic attenuator settings at which the measurements are made. Read Only.
        ElectronicPoints

        %MECHANICALPOINTS This command defines a list of analyzer mechanical attenuator settings at which the measurements are made. Read Only.
        MechanicalPoints

    end

    %% Property access methods
    methods

        %% ElectronicPoints property access methods
        function value = get.ElectronicPoints(obj)
            obj.checkValidObj();
            try
                value = obj.interface.ElectronicPoints;
            catch e
                obj.interpretError(e);
            end
        end

        %% MechanicalPoints property access methods
        function value = get.MechanicalPoints(obj)
            obj.checkValidObj();
            try
                value = obj.interface.MechanicalPoints;
            catch e
                obj.interpretError(e);
            end
        end

    end

    %% Public Methods
    methods

        function ConfigureElectronic(obj,Power)
            %CONFIGUREELECTRONIC Specifies the electronic attenuation applied to the RF input signal path.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            Power = obj.checkVectorDoubleArg(Power,'Power');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                obj.interface.ConfigureElectronic(double(Power));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function ConfigureMechanical(obj,Power)
            %CONFIGUREMECHANICAL Specifies the attenuation applied to the RF input signal path.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            Power = obj.checkVectorDoubleArg(Power,'Power');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                obj.interface.ConfigureMechanical(double(Power));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = QueryElectronic(obj)
            %QUERYELECTRONIC Queries the electronic attenuation applied to the RF input signal path.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.QueryElectronic();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = QueryMechanical(obj)
            %QUERYMECHANICAL Queries the attenuation applied to the RF input signal path.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.QueryMechanical();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

    end

end
