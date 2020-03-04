classdef Math < instrument.ivicom.Interface
    %MATH IVI SpecAn class-compliant traces math interface
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Math(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Methods
    methods

        function Exchange(obj,Trace1,Trace2)
            %EXCHANGE This function exchanges the data arrays of two traces.
            
            obj.checkValidObj();
			error(nargchk(3,3,nargin,'struct'))
            Trace1 = obj.checkScalarStringArg(Trace1,'Trace1');
            Trace2 = obj.checkScalarStringArg(Trace2,'Trace2');
            try
                obj.interface.Exchange(char(Trace1),char(Trace2));
            catch e
                obj.interpretError(e);
            end
        end

        function Copy(obj,DestinationTrace,SourceTrace)
            %COPY This function copies one trace array to another trace array.
            
            obj.checkValidObj();
			error(nargchk(3,3,nargin,'struct'))
            DestinationTrace = obj.checkScalarStringArg(DestinationTrace,'DestinationTrace');
            SourceTrace = obj.checkScalarStringArg(SourceTrace,'SourceTrace');
            try
                obj.interface.Copy(char(DestinationTrace),char(SourceTrace));
            catch e
                obj.interpretError(e);
            end
        end

        function ConfigureFunctions(obj,Destination,Function,Operand1,Operand2,LogOffset,LogDifferenceReference)
            %CONFIGUREFUNCTIONS Turns on and configures trace math functions. Trace math functions perform mathematical operations between traces and, in some cases, user-specified offsets. When in a trace math function, the indicated function is performed during the sweep with the math function used in place of a detector.  For some of the math modes some of the parameters are not relevant. For those modes, the parameters are ignored.
            
            obj.checkValidObj();
			error(nargchk(7,7,nargin,'struct'))
            LogOffset = obj.checkScalarDoubleArg(LogOffset,'LogOffset');
            LogDifferenceReference = obj.checkScalarDoubleArg(LogDifferenceReference,'LogDifferenceReference');
            try
                obj.interface.ConfigureFunctions(int32(Destination),int32(Function),int32(Operand1),int32(Operand2),double(LogOffset),double(LogDifferenceReference));
            catch e
                obj.interpretError(e);
            end
        end

    end

end
