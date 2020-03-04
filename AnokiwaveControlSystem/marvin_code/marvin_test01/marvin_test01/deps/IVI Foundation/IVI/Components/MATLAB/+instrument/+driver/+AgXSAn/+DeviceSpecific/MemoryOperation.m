classdef MemoryOperation < instrument.ivicom.Interface
    %MEMORYOPERATION IAgXSAnMemoryOperation interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = MemoryOperation(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %SCREENIMAGETHEME Specifies the theme to be used when saving the screen image.
        ScreenImageTheme

    end

    %% Property access methods
    methods

        %% ScreenImageTheme property access methods
        function value = get.ScreenImageTheme(obj)
            obj.checkValidObj();
            try
                value = obj.interface.ScreenImageTheme;
            catch e
                obj.interpretError(e);
            end
        end
		function set.ScreenImageTheme(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.ScreenImageTheme = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

    %% Public Methods
    methods

        function val = QueryDirectoryCatalog(obj,DirectoryPath)
            %QUERYDIRECTORYCATALOG Query disk usage information (drive capacity, free space available) and obtain a list of files and directories in a specified directory.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            DirectoryPath = obj.checkScalarStringArg(DirectoryPath,'DirectoryPath');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.QueryDirectoryCatalog(char(DirectoryPath));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function SetStorageDirectory(obj,DirectoryPath)
            %SETSTORAGEDIRECTORY Changes the default directory for a mass memory file system.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            DirectoryPath = obj.checkScalarStringArg(DirectoryPath,'DirectoryPath');
            try
                obj.interface.SetStorageDirectory(char(DirectoryPath));
            catch e
                obj.interpretError(e);
            end
        end

        function val = QueryStorageDirectory(obj)
            %QUERYSTORAGEDIRECTORY Queries the default directory for a mass memory file system.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                [val] = obj.interface.QueryStorageDirectory();
            catch e
                obj.interpretError(e);
            end
        end

        function Copy(obj,SourcePath,DestinationPath)
            %COPY Copies an existing file to a new file or an existing directory to a new directory.
            
            obj.checkValidObj();
			error(nargchk(3,3,nargin,'struct'))
            SourcePath = obj.checkScalarStringArg(SourcePath,'SourcePath');
            DestinationPath = obj.checkScalarStringArg(DestinationPath,'DestinationPath');
            try
                obj.interface.Copy(char(SourcePath),char(DestinationPath));
            catch e
                obj.interpretError(e);
            end
        end

        function Delete(obj,Filename)
            %DELETE Removes a file from the specified directory.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            Filename = obj.checkScalarStringArg(Filename,'Filename');
            try
                obj.interface.Delete(char(Filename));
            catch e
                obj.interpretError(e);
            end
        end

        function LoadCorrectionFileData(obj,CorrectionIdentifier,Filename)
            %LOADCORRECTIONFILEDATA Recalls a saved correction set into the specified, currently active set.
            
            obj.checkValidObj();
			error(nargchk(3,3,nargin,'struct'))
            CorrectionIdentifier = obj.checkScalarInt32Arg(CorrectionIdentifier,'CorrectionIdentifier');
            Filename = obj.checkScalarStringArg(Filename,'Filename');
            try
                obj.interface.LoadCorrectionFileData(int32(CorrectionIdentifier),char(Filename));
            catch e
                obj.interpretError(e);
            end
        end

        function LoadLimitFileData(obj,LimitLineIdentifier,Filename)
            %LOADLIMITFILEDATA Recalls a saved Limit data into the specified, currently active set.
            
            obj.checkValidObj();
			error(nargchk(3,3,nargin,'struct'))
            LimitLineIdentifier = obj.checkScalarInt32Arg(LimitLineIdentifier,'LimitLineIdentifier');
            Filename = obj.checkScalarStringArg(Filename,'Filename');
            try
                obj.interface.LoadLimitFileData(int32(LimitLineIdentifier),char(Filename));
            catch e
                obj.interpretError(e);
            end
        end

        function RecallState(obj,Filename)
            %RECALLSTATE Loads the State from the saved state file.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            Filename = obj.checkScalarStringArg(Filename,'Filename');
            try
                obj.interface.RecallState(char(Filename));
            catch e
                obj.interpretError(e);
            end
        end

        function RecallTraceFromTraceFile(obj,TraceNumber,Filename)
            %RECALLTRACEFROMTRACEFILE Restores the trace data in saved trace file to specified trace.
            
            obj.checkValidObj();
			error(nargchk(3,3,nargin,'struct'))
            TraceNumber = obj.checkScalarInt32Arg(TraceNumber,'TraceNumber');
            Filename = obj.checkScalarStringArg(Filename,'Filename');
            try
                obj.interface.RecallTraceFromTraceFile(int32(TraceNumber),char(Filename));
            catch e
                obj.interpretError(e);
            end
        end

        function RecallTraceFromRegister(obj,TraceNumber,RegisterIdentifier)
            %RECALLTRACEFROMREGISTER Restores the trace data in register to specified trace.
            
            obj.checkValidObj();
			error(nargchk(3,3,nargin,'struct'))
            TraceNumber = obj.checkScalarInt32Arg(TraceNumber,'TraceNumber');
            RegisterIdentifier = obj.checkScalarInt32Arg(RegisterIdentifier,'RegisterIdentifier');
            try
                obj.interface.RecallTraceFromRegister(int32(TraceNumber),int32(RegisterIdentifier));
            catch e
                obj.interpretError(e);
            end
        end

        function CreateStorageDirectory(obj,DirectoryPath)
            %CREATESTORAGEDIRECTORY Creates a new directory.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            DirectoryPath = obj.checkScalarStringArg(DirectoryPath,'DirectoryPath');
            try
                obj.interface.CreateStorageDirectory(char(DirectoryPath));
            catch e
                obj.interpretError(e);
            end
        end

        function Move(obj,SourcePath,DestinationPath)
            %MOVE Moves an existing file to a new file or an existing directory to a new directory.
            
            obj.checkValidObj();
			error(nargchk(3,3,nargin,'struct'))
            SourcePath = obj.checkScalarStringArg(SourcePath,'SourcePath');
            DestinationPath = obj.checkScalarStringArg(DestinationPath,'DestinationPath');
            try
                obj.interface.Move(char(SourcePath),char(DestinationPath));
            catch e
                obj.interpretError(e);
            end
        end

        function RemoveStorageDirectory(obj,DirectoryPath)
            %REMOVESTORAGEDIRECTORY Removes a directory.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            DirectoryPath = obj.checkScalarStringArg(DirectoryPath,'DirectoryPath');
            try
                obj.interface.RemoveStorageDirectory(char(DirectoryPath));
            catch e
                obj.interpretError(e);
            end
        end

        function StoreCorrectionDataToFile(obj,CorrectionIdentifier,Filename)
            %STORECORRECTIONDATATOFILE Exports correction data to file.
            
            obj.checkValidObj();
			error(nargchk(3,3,nargin,'struct'))
            CorrectionIdentifier = obj.checkScalarInt32Arg(CorrectionIdentifier,'CorrectionIdentifier');
            Filename = obj.checkScalarStringArg(Filename,'Filename');
            try
                obj.interface.StoreCorrectionDataToFile(int32(CorrectionIdentifier),char(Filename));
            catch e
                obj.interpretError(e);
            end
        end

        function StoreLimitDataToFile(obj,LimitLineIdentifier,Filename)
            %STORELIMITDATATOFILE Exports Limit data to file.
            
            obj.checkValidObj();
			error(nargchk(3,3,nargin,'struct'))
            LimitLineIdentifier = obj.checkScalarInt32Arg(LimitLineIdentifier,'LimitLineIdentifier');
            Filename = obj.checkScalarStringArg(Filename,'Filename');
            try
                obj.interface.StoreLimitDataToFile(int32(LimitLineIdentifier),char(Filename));
            catch e
                obj.interpretError(e);
            end
        end

        function StoreMeasurementResultsToFile(obj,Filename)
            %STOREMEASUREMENTRESULTSTOFILE Exports marker table values as data to file.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            Filename = obj.checkScalarStringArg(Filename,'Filename');
            try
                obj.interface.StoreMeasurementResultsToFile(char(Filename));
            catch e
                obj.interpretError(e);
            end
        end

        function StoreMarkerTableToFile(obj,Filename)
            %STOREMARKERTABLETOFILE Exports correction data to file.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            Filename = obj.checkScalarStringArg(Filename,'Filename');
            try
                obj.interface.StoreMarkerTableToFile(char(Filename));
            catch e
                obj.interpretError(e);
            end
        end

        function StorePeakTableToFile(obj,Filename)
            %STOREPEAKTABLETOFILE Exports peak table values as data to file.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            Filename = obj.checkScalarStringArg(Filename,'Filename');
            try
                obj.interface.StorePeakTableToFile(char(Filename));
            catch e
                obj.interpretError(e);
            end
        end

        function StoreScreenImageToFile(obj,Filename)
            %STORESCREENIMAGETOFILE Exports the current screen image to file.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            Filename = obj.checkScalarStringArg(Filename,'Filename');
            try
                obj.interface.StoreScreenImageToFile(char(Filename));
            catch e
                obj.interpretError(e);
            end
        end

        function StoreState(obj,Filename)
            %STORESTATE Exports current state to file.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            Filename = obj.checkScalarStringArg(Filename,'Filename');
            try
                obj.interface.StoreState(char(Filename));
            catch e
                obj.interpretError(e);
            end
        end

        function StoreTraceToTraceFile(obj,TraceNumber,Filename)
            %STORETRACETOTRACEFILE Exports trace data to file.
            
            obj.checkValidObj();
			error(nargchk(3,3,nargin,'struct'))
            TraceNumber = obj.checkScalarInt32Arg(TraceNumber,'TraceNumber');
            Filename = obj.checkScalarStringArg(Filename,'Filename');
            try
                obj.interface.StoreTraceToTraceFile(int32(TraceNumber),char(Filename));
            catch e
                obj.interpretError(e);
            end
        end

        function StoreTraceToRegister(obj,TraceNumber,RegisterIdentifier)
            %STORETRACETOREGISTER Exports trace data to register.
            
            obj.checkValidObj();
			error(nargchk(3,3,nargin,'struct'))
            TraceNumber = obj.checkScalarInt32Arg(TraceNumber,'TraceNumber');
            RegisterIdentifier = obj.checkScalarInt32Arg(RegisterIdentifier,'RegisterIdentifier');
            try
                obj.interface.StoreTraceToRegister(int32(TraceNumber),int32(RegisterIdentifier));
            catch e
                obj.interpretError(e);
            end
        end

    end

end
