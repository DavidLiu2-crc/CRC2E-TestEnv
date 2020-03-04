classdef FastCapture < instrument.ivicom.Interface
    %FASTCAPTURE IAgXSAnBasicSpectrumTracesFastCapture interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = FastCapture(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %LENGTH The length of the Fast Capture in samples (points). This is constrained to be an even number.
        Length

        %WORDLENGTH Allows choice of internal fast capture word length. Shorter word length allows twice the time length to be captured, at the cost of quantization noise.
        WordLength

        %BLOCKSIZE The block size for the Fast Capture transfer in samples (points).  This is the number of points that will be returned from the Capture buffer by the Fetch method. This is constrained to be an even number.
        BlockSize

        %POINTER The pointer position for the Fast Capture transfer in samples (points).
        Pointer

    end

    %% Property access methods
    methods

        %% Length property access methods
        function value = get.Length(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Length;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Length(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarInt32Arg(newValue,'Length');
            try
                obj.interface.Length = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% WordLength property access methods
        function value = get.WordLength(obj)
            obj.checkValidObj();
            try
                value = obj.interface.WordLength;
            catch e
                obj.interpretError(e);
            end
        end
		function set.WordLength(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.WordLength = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% BlockSize property access methods
        function value = get.BlockSize(obj)
            obj.checkValidObj();
            try
                value = obj.interface.BlockSize;
            catch e
                obj.interpretError(e);
            end
        end
		function set.BlockSize(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarInt32Arg(newValue,'BlockSize');
            try
                obj.interface.BlockSize = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Pointer property access methods
        function value = get.Pointer(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Pointer;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Pointer(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarInt32Arg(newValue,'Pointer');
            try
                obj.interface.Pointer = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

    %% Public Methods
    methods

        function Abort(obj)
            %ABORT Aborts the current fast capture, clears the buffer, resets the Fast Capture pointer, and sets the sweep to pause.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.Abort();
            catch e
                obj.interpretError(e);
            end
        end

        function val = Fetch(obj)
            %FETCH Transfers the block of data starting at the pointer.  The number of samples transferred is set with the BlockSize property. The pointer is incremented by the block size after the fetch.
            
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

        function Initiate(obj)
            %INITIATE Waits for the sweep to trigger and then captures the fast capture data. Sweep is then set to pause. The amount of data captured is controlled by the Fast Capture Length property.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.Initiate();
            catch e
                obj.interpretError(e);
            end
        end

        function val = Read(obj,Length,BlockSize)
            %READ Initiate and returns the block of data.
            
            obj.checkValidObj();
			error(nargchk(3,3,nargin,'struct'))
            Length = obj.checkScalarInt32Arg(Length,'Length');
            BlockSize = obj.checkScalarInt32Arg(BlockSize,'BlockSize');
            singleDimFlag = feature('COM_SafeArraySingleDim');
            try
                feature('COM_SafeArraySingleDim',1);
                [val] = obj.interface.Read(int32(Length),int32(BlockSize));
            catch e
                feature('COM_SafeArraySingleDim',singleDimFlag);
                obj.interpretError(e);
            end
            feature('COM_SafeArraySingleDim',singleDimFlag);
        end

    end

end
