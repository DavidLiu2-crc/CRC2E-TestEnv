classdef FFT < instrument.ivicom.Interface
    %FFT AgXSAnBasic SpectrumFFT interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = FFT(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %LENGTH The FFT length. This value is only used if length control is set to manual. The value must be greater than or equal to the window length value. Any amount greater than the window length is implemented by zero-padding.
        Length

        %LENGTHAUTO Enables or disables the auto selection of the FFT and window lengths.
        LengthAuto

        %RBWPOINTS Specifies the minimum number of data points that are used inside the resolution bandwidth.
        RBWPoints

        %WINDOW The FFT window type.
        Window

        %WINDOWLENGTH The FFT window length.
        WindowLength

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

        %% LengthAuto property access methods
        function value = get.LengthAuto(obj)
            obj.checkValidObj();
            try
                value = obj.interface.LengthAuto;
            catch e
                obj.interpretError(e);
            end
        end
		function set.LengthAuto(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'LengthAuto');
            try
                obj.interface.LengthAuto = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% RBWPoints property access methods
        function value = get.RBWPoints(obj)
            obj.checkValidObj();
            try
                value = obj.interface.RBWPoints;
            catch e
                obj.interpretError(e);
            end
        end
		function set.RBWPoints(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarDoubleArg(newValue,'RBWPoints');
            try
                obj.interface.RBWPoints = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% Window property access methods
        function value = get.Window(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Window;
            catch e
                obj.interpretError(e);
            end
        end
		function set.Window(obj,newValue)
			obj.checkValidObj();
            try
                obj.interface.Window = newValue;
            catch e
                obj.interpretError(e);
            end
        end

        %% WindowLength property access methods
        function value = get.WindowLength(obj)
            obj.checkValidObj();
            try
                value = obj.interface.WindowLength;
            catch e
                obj.interpretError(e);
            end
        end
		function set.WindowLength(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarInt32Arg(newValue,'WindowLength');
            try
                obj.interface.WindowLength = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

end
