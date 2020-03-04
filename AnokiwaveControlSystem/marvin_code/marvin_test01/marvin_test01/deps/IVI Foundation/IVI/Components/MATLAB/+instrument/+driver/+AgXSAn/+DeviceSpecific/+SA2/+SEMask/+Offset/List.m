classdef List < instrument.ivicom.Interface
    %LIST IAgXSAnSASEMaskOffsetList interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = List(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);

            %% Initialize properties
            try
                obj.Bandwidth = instrument.driver.AgXSAn.DeviceSpecific.SA2.SEMask.Offset.List.Bandwidth(obj.interface.Bandwidth);
            catch %#ok<CTCH>
            end

            try
                obj.Start = instrument.driver.AgXSAn.DeviceSpecific.SA2.SEMask.Offset.List.Start(obj.interface.Start);
            catch %#ok<CTCH>
            end

            try
                obj.Stop = instrument.driver.AgXSAn.DeviceSpecific.SA2.SEMask.Offset.List.Stop(obj.interface.Stop);
            catch %#ok<CTCH>
            end

        end
        
        function delete(obj)
            obj.Bandwidth = [];
            obj.Start = [];
            obj.Stop = [];
        end

    end
    
    %% Public Read Only Properties
    properties (SetAccess = private)

        %BANDWIDTH Pointer to IAgXSAnSASEMaskOffsetListBandwidth interface. Read Only.
        Bandwidth

        %START Pointer to IAgXSAnSASEMaskOffsetListStart interface. Read Only.
        Start

        %STOP Pointer to IAgXSAnSASEMaskOffsetListStop interface. Read Only.
        Stop

    end

    %% Property access methods
    methods

        %% Bandwidth property access methods
        function value = get.Bandwidth(obj)
            obj.checkValidObj();
            if isempty(obj.Bandwidth)
                try
                    obj.Bandwidth = instrument.driver.AgXSAn.DeviceSpecific.SA2.SEMask.Offset.List.Bandwidth(obj.interface.Bandwidth);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Bandwidth;
        end

        %% Start property access methods
        function value = get.Start(obj)
            obj.checkValidObj();
            if isempty(obj.Start)
                try
                    obj.Start = instrument.driver.AgXSAn.DeviceSpecific.SA2.SEMask.Offset.List.Start(obj.interface.Start);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Start;
        end

        %% Stop property access methods
        function value = get.Stop(obj)
            obj.checkValidObj();
            if isempty(obj.Stop)
                try
                    obj.Stop = instrument.driver.AgXSAn.DeviceSpecific.SA2.SEMask.Offset.List.Stop(obj.interface.Stop);
                catch e
                    obj.interpretError(e);
                end
            end
            value = obj.Stop;
        end

    end

    %% Public Methods
    methods

        function ConfigureEnabled(obj,State)
            %CONFIGUREENABLED Turns On or Off the offsets. 
            
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

        function ConfigureRelativeAttenuation(obj,AttenuationValue)
            %CONFIGURERELATIVEATTENUATION Sets the attenuation value used to adjust the relative level limits ranging.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            AttenuationValue = obj.checkVectorDoubleArg(AttenuationValue,'AttenuationValue');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                obj.interface.ConfigureRelativeAttenuation(double(AttenuationValue));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = QueryRelativeAttenuation(obj)
            %QUERYRELATIVEATTENUATION Gets the attenuation value used to adjust the relative level limits ranging.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.QueryRelativeAttenuation();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function ConfigureSweepTime(obj,SweepTime)
            %CONFIGURESWEEPTIME Specifies the sweep time for the currently selected offset.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            SweepTime = obj.checkVectorDoubleArg(SweepTime,'SweepTime');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                obj.interface.ConfigureSweepTime(double(SweepTime));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = QuerySweepTime(obj)
            %QUERYSWEEPTIME Queries the sweep time for the currently selected offset.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.QuerySweepTime();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function ConfigureSweepTimeAutoEnabled(obj,State)
            %CONFIGURESWEEPTIMEAUTOENABLED Enables/Disables automatic setting up of sweep time for each offset.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            State = obj.checkVectorBoolArg(State,'State');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                obj.interface.ConfigureSweepTimeAutoEnabled(logical(State));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = QuerySweepTimeAutoEnabled(obj)
            %QUERYSWEEPTIMEAUTOENABLED Queries the state of function that automatic sets up of sweep time for each offset.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.QuerySweepTimeAutoEnabled();
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

    end

end
