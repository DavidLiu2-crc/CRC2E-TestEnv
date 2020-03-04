classdef HardCopy < instrument.ivicom.Interface
    %HARDCOPY IAgXSAn HardCopy interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = HardCopy(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Methods
    methods

        function Print(obj)
            %PRINT Print display to printer on parrallel port
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.Print();
            catch e
                obj.interpretError(e);
            end
        end

    end

end
