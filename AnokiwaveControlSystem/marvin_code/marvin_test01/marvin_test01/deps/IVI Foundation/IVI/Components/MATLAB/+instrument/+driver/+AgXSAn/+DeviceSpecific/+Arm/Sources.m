classdef Sources < instrument.ivicom.RepeatedCapability
    %SOURCES AgXSAn armsource collection interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Sources(interface)
            
            %% construct superclass
            obj@instrument.ivicom.RepeatedCapability(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Properties
    properties

        %ORENABLED Enables or disables the OR-summing of the arm sources.
        OrEnabled

    end

    %% Public Read Only Properties
    properties (SetAccess = private)

        %COUNT The number of armsources. Read Only.
        Count

    end

    %% Property access methods
    methods

        %% Count property access methods
        function value = get.Count(obj)
            obj.checkValidObj();
            try
                value = obj.interface.Count;
            catch e
                obj.interpretError(e);
            end
        end

        %% OrEnabled property access methods
        function value = get.OrEnabled(obj)
            obj.checkValidObj();
            try
                value = obj.interface.OrEnabled;
            catch e
                obj.interpretError(e);
            end
        end
		function set.OrEnabled(obj,newValue)
			obj.checkValidObj();
            newValue = obj.checkScalarBoolArg(newValue,'OrEnabled');
            try
                obj.interface.OrEnabled = newValue;
            catch e
                obj.interpretError(e);
            end
        end

    end

    %% Public Methods
    methods

        function RemoveAllCustomArmSources(obj)
            %REMOVEALLCUSTOMARMSOURCES This function removes all of the custom arm sources that were added using the Add Arm Source function.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.RemoveAllCustomArmSources();
            catch e
                obj.interpretError(e);
            end
        end

        function DisableAll(obj)
            %DISABLEALL Disables all arm sources.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.DisableAll();
            catch e
                obj.interpretError(e);
            end
        end

        function Remove(obj,SourceName)
            %REMOVE This function removes an arm source.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            SourceName = obj.checkScalarStringArg(SourceName,'SourceName');
            try
                obj.interface.Remove(char(SourceName));
            catch e
                obj.interpretError(e);
            end
        end

        function Add(obj,SourceName)
            %ADD Creates a new arm source.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            SourceName = obj.checkScalarStringArg(SourceName,'SourceName');
            try
                obj.interface.Add(char(SourceName));
            catch e
                obj.interpretError(e);
            end
        end

        function val = Item(obj,Name)
            %ITEM An interface reference pointer to the IAgXSAnArmSource interface which is selected by the armsource name.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            Name = obj.checkScalarStringArg(Name,'Name');
            try
                [val] = instrument.driver.AgXSAn.DeviceSpecific.Arm.Sources.Item(obj.interface.Item(char(Name)));
            catch e
                obj.interpretError(e);
            end
        end

        function val = Name(obj,Index)
            %NAME The armsource name for a given index.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            Index = obj.checkScalarInt32Arg(Index,'Index');
            try
                [val] = obj.interface.Name(int32(Index));
            catch e
                obj.interpretError(e);
            end
        end

    end

end
