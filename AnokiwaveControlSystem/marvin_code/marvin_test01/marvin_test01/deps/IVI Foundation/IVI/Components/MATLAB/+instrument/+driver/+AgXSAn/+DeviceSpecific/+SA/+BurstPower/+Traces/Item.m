classdef Item < instrument.ivicom.Interface
    %ITEM AgXSAn trace interface.
    
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

        function val = Read(obj,MaxTime)
            %READ Initiates the measurement and puts valid data into the output buffer.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            MaxTime = obj.checkScalarInt32Arg(MaxTime,'MaxTime');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.Read(int32(MaxTime));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

        function val = ReadSignal(obj,MaxTime,Frequency,Amplitude)
            %READSIGNAL Initiates the measurement and puts valid data into the output buffer.
            
            obj.checkValidObj();
			error(nargchk(4,4,nargin,'struct'))
            MaxTime = obj.checkScalarInt32Arg(MaxTime,'MaxTime');
            Frequency = obj.checkScalarDoubleArg(Frequency,'Frequency');
            Amplitude = obj.checkScalarDoubleArg(Amplitude,'Amplitude');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.ReadSignal(int32(MaxTime),double(Frequency),double(Amplitude));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

    end

end
