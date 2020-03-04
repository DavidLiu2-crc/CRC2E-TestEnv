classdef List < instrument.ivicom.Interface
    %LIST IAgXSAnSAACPOffsetList interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = List(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);

            %% Initialize properties
            try
                obj.Bandwidth = instrument.driver.AgXSAn.DeviceSpecific.SA3.ACP.Offset.List.Bandwidth(obj.interface.Bandwidth);
            catch %#ok<CTCH>
            end

            try
                obj.Filter = instrument.driver.AgXSAn.DeviceSpecific.SA3.ACP.Offset.List.Filter(obj.interface.Filter);
            catch %#ok<CTCH>
            end

        end
        
        function delete(obj)
            obj.Bandwidth = [];
            obj.Filter = [];
        end

    end
    
    %% Public Read Only Properties
    properties (SetAccess = private)

        %BANDWIDTH Pointer to IAgXSAnSAACPOffsetListBandwidth interface. Read Only.
        Bandwidth

        %FILTER Pointer to IAgXSAnSAACPOffsetListFilter interface. Read Only.
        Filter

    end

    %% Property access methods
    methods

        %% Bandwidth property access methods
        function value = get.Bandwidth(obj)
            obj.checkValidObj();
            if isempty(obj.Bandwidth)
                try
                    obj.Bandwidth = instrument.driver.AgXSAn.DeviceSpecific.SA3.ACP.Offset.List.Bandwidth(obj.interface.Bandwidth);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Bandwidth;
        end

        %% Filter property access methods
        function value = get.Filter(obj)
            obj.checkValidObj();
            if isempty(obj.Filter)
                try
                    obj.Filter = instrument.driver.AgXSAn.DeviceSpecific.SA3.ACP.Offset.List.Filter(obj.interface.Filter);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Filter;
        end

    end

    %% Public Methods
    methods

        function ConfigureAbsoluteLimit(obj,Limit)
            %CONFIGUREABSOLUTELIMIT Sets an absolute limit value, which sets the absolute amplitude levels to test against for each of the custom offsets. The list must contain six (6) entries. If there is more than one offset, the offset closest to the carrier channel is the first one in the list.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            Limit = obj.checkVectorDoubleArg(Limit,'Limit');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                obj.interface.ConfigureAbsoluteLimit(double(Limit));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function ConfigureEnabled(obj,State)
            %CONFIGUREENABLED Turns On or Off the offsets. Turning the offset has the same effect as setting the frequency of the offset to 0 Hz.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            State = obj.checkVectorBoolArg(State,'State');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                obj.interface.ConfigureEnabled(logical(State));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function ConfigureFrequency(obj,FrequencyDifference)
            %CONFIGUREFREQUENCY Sets the frequency difference from the center of the main channel to the center of the offset.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            FrequencyDifference = obj.checkVectorDoubleArg(FrequencyDifference,'FrequencyDifference');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                obj.interface.ConfigureFrequency(double(FrequencyDifference));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function ConfigureLowerLimit(obj,Limit)
            %CONFIGURELOWERLIMIT Sets the limit for the upper segment of the specified offset pair.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            Limit = obj.checkVectorDoubleArg(Limit,'Limit');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                obj.interface.ConfigureLowerLimit(double(Limit));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function ConfigureRelativeLimitCarrier(obj,Limit)
            %CONFIGURERELATIVELIMITCARRIER Specifies a relative limit value for the carrier level.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            Limit = obj.checkVectorDoubleArg(Limit,'Limit');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                obj.interface.ConfigureRelativeLimitCarrier(double(Limit));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function ConfigureRelativeLimitPSD(obj,Limit)
            %CONFIGURERELATIVELIMITPSD Specifies a relative limit value for the level of the power spectral density. This sets the amplitude levels to test against for any custom offsets. The amplitude level is relative to the power spectral density. If multiple offsets are available, the list contains six (6) entries. The offset closest to the carrier channel is the first one in the list.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            Limit = obj.checkVectorDoubleArg(Limit,'Limit');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                obj.interface.ConfigureRelativeLimitPSD(double(Limit));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function ConfigureSidebandSelection(obj,Sideband)
            %CONFIGURESIDEBANDSELECTION Enables the user to turn off (not use) specific offsets.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                obj.interface.ConfigureSidebandSelection(int32(Sideband));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function ConfigureTest(obj,Type)
            %CONFIGURETEST Enables user to select one of the logic for the fail conditions between the measurement results and the test limits. 
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                obj.interface.ConfigureTest(int32(Type));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function ConfigureUpperLimit(obj,Limit)
            %CONFIGUREUPPERLIMIT Sets the limit for the upper segment of the specified offset pair.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            Limit = obj.checkVectorDoubleArg(Limit,'Limit');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                obj.interface.ConfigureUpperLimit(double(Limit));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = QueryAbsoluteLimit(obj)
            %QUERYABSOLUTELIMIT Gets an absolute limit value.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.QueryAbsoluteLimit();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = QueryEnabled(obj)
            %QUERYENABLED Queries the state (On or Off) of the offsets.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.QueryEnabled();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = QueryFrequency(obj)
            %QUERYFREQUENCY Gets the frequency difference from the center of the main channel to the center of the offset.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.QueryFrequency();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = QueryLowerLimit(obj)
            %QUERYLOWERLIMIT Gets the limit for the upper segment of the specified offset pair.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.QueryLowerLimit();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = QueryRelativeLimitCarrier(obj)
            %QUERYRELATIVELIMITCARRIER Gets a relative limit value for the carrier level.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.QueryRelativeLimitCarrier();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = QueryRelativeLimitPSD(obj)
            %QUERYRELATIVELIMITPSD Gets a relative limit value for the level of the power spectral density.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.QueryRelativeLimitPSD();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = QuerySidebandSelection(obj)
            %QUERYSIDEBANDSELECTION Gets specific offsets.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.QuerySidebandSelection();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = QueryTest(obj)
            %QUERYTEST Gets the logic for the fail conditions between the measurement results and the test limits. 
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.QueryTest();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = QueryUpperLimit(obj)
            %QUERYUPPERLIMIT Gets the limit for the upper segment of the specified offset pair.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.QueryUpperLimit();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

    end

end
