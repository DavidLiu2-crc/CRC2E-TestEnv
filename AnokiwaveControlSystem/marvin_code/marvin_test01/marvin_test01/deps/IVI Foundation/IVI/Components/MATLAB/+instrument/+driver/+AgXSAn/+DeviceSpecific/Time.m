classdef Time < instrument.ivicom.Interface
    %TIME LxiSync time interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Time(interface)
            
            %% construct superclass
            obj@instrument.ivicom.Interface(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Read Only Properties
    properties (SetAccess = private)

        %ISMASTER Indicates if this device is the 1588 master. Read Only.
        IsMaster

        %ISSYNCHRONIZED Indicates if the device is synchronized. Read Only.
        IsSynchronized

    end

    %% Property access methods
    methods

        %% IsMaster property access methods
        function value = get.IsMaster(obj)
            obj.checkValidObj();
            try
                value = obj.interface.IsMaster;
            catch e
                obj.interpretError(e);
            end
        end

        %% IsSynchronized property access methods
        function value = get.IsSynchronized(obj)
            obj.checkValidObj();
            try
                value = obj.interface.IsSynchronized;
            catch e
                obj.interpretError(e);
            end
        end

    end

    %% Public Methods
    methods

        function [returnTimeSeconds,returnTimeFractional] = GetSystemTime(obj)
            %GETSYSTEMTIME This function retrieves the current 1588 time.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                [returnTimeSeconds,returnTimeFractional] = obj.interface.GetSystemTime(double(0),double(0));
            catch e
                obj.interpretError(e);
            end
        end

    end

end
