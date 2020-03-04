classdef List < instrument.ivicom.Interface
    %LIST IAgXSAnSAACPCarrierList interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = List(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Methods
    methods

        function returnState = ConfigureCarrierMethod(obj,State)
            %CONFIGURECARRIERMETHOD Configure the carrier configuration method settings.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            State = obj.checkVectorBoolArg(State,'State');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            byRefFlag = feature('COM_PassSafeArrayByRef');
            try
                feature('COM_SafeArraySingleDim',1);
                feature('COM_PassSafeArrayByRef',1);
                [returnState] = obj.interface.ConfigureCarrierMethod(logical(State));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                feature('COM_PassSafeArrayByRef',byRefFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
            feature('COM_PassSafeArrayByRef',byRefFlag);
        end

        function returnFrequencyDifference = ConfigureChannelSpacing(obj,FrequencyDifference)
            %CONFIGURECHANNELSPACING Sets the width of the carrier spacing. This will be the value applied to all the current slots, whether they are carriers or spaces. 
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            FrequencyDifference = obj.checkVectorDoubleArg(FrequencyDifference,'FrequencyDifference');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            byRefFlag = feature('COM_PassSafeArrayByRef');
            try
                feature('COM_SafeArraySingleDim',1);
                feature('COM_PassSafeArrayByRef',1);
                [returnFrequencyDifference] = obj.interface.ConfigureChannelSpacing(double(FrequencyDifference));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                feature('COM_PassSafeArrayByRef',byRefFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
            feature('COM_PassSafeArrayByRef',byRefFlag);
        end

        function returnState = ConfigureCouplingEnabled(obj,State)
            %CONFIGURECOUPLINGENABLED Couples carrier settings to carrier #1. The coupled parameters are Carrier Power Present, Carrier Spacing, Measurement Noise Bandwidth, Method and Filter Alpha.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            State = obj.checkVectorBoolArg(State,'State');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            byRefFlag = feature('COM_PassSafeArrayByRef');
            try
                feature('COM_SafeArraySingleDim',1);
                feature('COM_PassSafeArrayByRef',1);
                [returnState] = obj.interface.ConfigureCouplingEnabled(logical(State));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                feature('COM_PassSafeArrayByRef',byRefFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
            feature('COM_PassSafeArrayByRef',byRefFlag);
        end

        function returnBandwidth = ConfigureIntegrationBandwidth(obj,Bandwidth)
            %CONFIGUREINTEGRATIONBANDWIDTH Specifies the Measurement Noise Bandwidth used to calculate the power in the carriers. 
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            Bandwidth = obj.checkVectorDoubleArg(Bandwidth,'Bandwidth');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            byRefFlag = feature('COM_PassSafeArrayByRef');
            try
                feature('COM_SafeArraySingleDim',1);
                feature('COM_PassSafeArrayByRef',1);
                [returnBandwidth] = obj.interface.ConfigureIntegrationBandwidth(double(Bandwidth));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                feature('COM_PassSafeArrayByRef',byRefFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
            feature('COM_PassSafeArrayByRef',byRefFlag);
        end

        function returnMethod = ConfigureMethod(obj,Method)
            %CONFIGUREMETHOD Accesses the carrier configuration method settings.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            byRefFlag = feature('COM_PassSafeArrayByRef');
            try
                feature('COM_SafeArraySingleDim',1);
                feature('COM_PassSafeArrayByRef',1);
                [returnMethod] = obj.interface.ConfigureMethod(int32(Method));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                feature('COM_PassSafeArrayByRef',byRefFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
            feature('COM_PassSafeArrayByRef',byRefFlag);
        end

        function returnEnabled = ConfigurePowerPresent(obj,Enabled)
            %CONFIGUREPOWERPRESENT Configures the carriers for this measurement. It allows spaces to be inserted between carriers. Carriers with the power present parameter set to Yes are carriers, and those with the power present parameter set to No are spaces. Each carrier power present is set to Yes or No.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            byRefFlag = feature('COM_PassSafeArrayByRef');
            try
                feature('COM_SafeArraySingleDim',1);
                feature('COM_PassSafeArrayByRef',1);
                [returnEnabled] = obj.interface.ConfigurePowerPresent(int32(Enabled));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                feature('COM_PassSafeArrayByRef',byRefFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
            feature('COM_PassSafeArrayByRef',byRefFlag);
        end

        function val = QueryCarrierMethod(obj)
            %QUERYCARRIERMETHOD Queries the carrier configuration method settings.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.QueryCarrierMethod();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = QueryChannelSpacing(obj)
            %QUERYCHANNELSPACING Gets the width of the carrier spacing.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.QueryChannelSpacing();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = QueryCouplingEnabled(obj)
            %QUERYCOUPLINGENABLED Queries the state of carrier settings couplings to carrier #1. The coupled parameters are Carrier Power Preset, Carrier Spacing, Measurement Noise Bandwidth, Method and Filter Alpha.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.QueryCouplingEnabled();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = QueryIntegrationBandwidth(obj)
            %QUERYINTEGRATIONBANDWIDTH Queries the Measurement Noise Bandwidth used to calculate the power in the carriers.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.QueryIntegrationBandwidth();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = QueryMethod(obj)
            %QUERYMETHOD Queries the carrier configuration method settings.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.QueryMethod();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = QueryPowerPresent(obj)
            %QUERYPOWERPRESENT The query for this parameter returns the current values for all of the carriers. If a carrier is defined as having no power present, the power displayed will be relative to the reference carrier, otherwise the absolute power will be displayed. If user changes the carrier power present to no and that carrier is currently configured as the reference carrier, the next carrier to the left (or the right if there are no carriers to the left) will be assigned as the reference carrier. This also applies to the scenario where there are only two carriers configured as having power present and you configure only one carrier to have no power present.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.QueryPowerPresent();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

    end

end
