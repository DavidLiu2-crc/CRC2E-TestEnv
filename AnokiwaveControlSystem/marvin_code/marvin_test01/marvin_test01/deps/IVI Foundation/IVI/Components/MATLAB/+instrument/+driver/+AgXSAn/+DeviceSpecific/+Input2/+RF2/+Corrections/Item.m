classdef Item < instrument.ivicom.Interface
    %ITEM AgXSAn correction interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Item(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %ENABLED Turning the Selected Correction on allows the values in it to be applied to the data.
        Enabled

        %FREQUENCYINTERPOLATION Controls/Queries how the correction values per-bucket are calculated
        FrequencyInterpolation

        %ANTENNAUNIT Specifies the units for anntenna measurements correction data.
        AntennaUnit

        %COMMENT Sets an ASCII comment field which will be stored in an exported file.
        Comment

        %DESCRIPTION Sets an ASCII description field which will be stored in an exported file.
        Description

    end

    %% Property access methods
    methods

        %% Enabled property access methods
        function value = get.Enabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Enabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Enabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'Enabled');
            try
                obj.interface.Enabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% FrequencyInterpolation property access methods
        function value = get.FrequencyInterpolation(obj)
            obj.checkValidObj();
            try
                value = obj.interface.FrequencyInterpolation;
            catch e
                obj.interpretError(e);
            end
        end
		function set.FrequencyInterpolation(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.FrequencyInterpolation = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% AntennaUnit property access methods
        function value = get.AntennaUnit(obj)
            obj.checkValidObj();
            try
                value = obj.interface.AntennaUnit;
            catch e
                obj.interpretError(e);
            end
        end
		function set.AntennaUnit(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.AntennaUnit = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Comment property access methods
        function value = get.Comment(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Comment;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Comment(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarStringArg(newValue,'Comment');
            try
                obj.interface.Comment = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Description property access methods
        function value = get.Description(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Description;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Description(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarStringArg(newValue,'Description');
            try
                obj.interface.Description = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

    %% Public Methods
    methods

        function ConfigureData(obj,DataArray)
            %CONFIGUREDATA Replaces and Configures all existing the correction points in the specified set.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            DataArray = obj.checkVectorDoubleArg(DataArray,'DataArray');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                obj.interface.ConfigureData(double(DataArray));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function Delete(obj)
            %DELETE Deletes the specified correction set.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.Delete();
            catch e
                obj.interpretError(e);
            end
        end

        function MergeData(obj,DataArray)
            %MERGEDATA Merges new correction points into an existing set.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            DataArray = obj.checkVectorDoubleArg(DataArray,'DataArray');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                obj.interface.MergeData(double(DataArray));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = QueryData(obj)
            %QUERYDATA Queries all existing correction points in the specified set.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.QueryData();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function Copy(obj,DestinationCorrectionSet)
            %COPY Copies data from the cureently selected correction set to the destination correction set.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            DestinationCorrectionSet = obj.checkScalarInt32Arg(DestinationCorrectionSet,'DestinationCorrectionSet');
            try
                obj.interface.Copy(int32(DestinationCorrectionSet));
            catch e
                obj.interpretError(e);
            end
        end

    end

end
