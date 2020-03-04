classdef Item < instrument.ivicom.Interface
    %ITEM AgXSAnBasic WaveformTrace interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Item(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Methods
    methods

        function val = Compress(obj,Method,StartOffset,Length,RepeatOffset,RepeatLimit)
            %COMPRESS Returns compressed data for the specified trace data. The data is returned in the same units as the original trace and only works with the currently selected measurement.
            
            obj.checkValidObj();
			error(nargchk(6,6,nargin,'struct'))
            StartOffset = obj.checkScalarDoubleArg(StartOffset,'StartOffset');
            Length = obj.checkScalarDoubleArg(Length,'Length');
            RepeatOffset = obj.checkScalarDoubleArg(RepeatOffset,'RepeatOffset');
            RepeatLimit = obj.checkScalarInt32Arg(RepeatLimit,'RepeatLimit');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.Compress(int32(Method),double(StartOffset),double(Length),double(RepeatOffset),int32(RepeatLimit));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = Fetch(obj)
            %FETCH Puts selected data from the most recent measurement into the output buffer.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.Fetch();
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = Peaks(obj,Threshold,Excursion,Sort)
            %PEAKS Returns a list of peaks for the designated trace data n for the currently selected measurement. The peaks must meet the requirements of the peak threshold and excursion values.
            
            obj.checkValidObj();
			error(nargchk(4,4,nargin,'struct'))
            Threshold = obj.checkScalarDoubleArg(Threshold,'Threshold');
            Excursion = obj.checkScalarDoubleArg(Excursion,'Excursion');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.Peaks(double(Threshold),double(Excursion),int32(Sort));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = Read(obj,MaxTimeMilliseconds)
            %READ Initiates the measurement and puts valid data into the output buffer.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            MaxTimeMilliseconds = obj.checkScalarInt32Arg(MaxTimeMilliseconds,'MaxTimeMilliseconds');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.Read(int32(MaxTimeMilliseconds));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

    end

end
