classdef Sources < instrument.ivicom.RepeatedCapability
    %SOURCES AgXSAn triggersource collection interface.
    
    %% Construction/Clean up
    methods (Hidden=true)

        function obj = Sources(interface)
            
            %% construct superclass
            obj@instrument.ivicom.RepeatedCapability(interface);
        end
        
        function delete(obj)
        end

    end
    
    %% Public Read Only Properties
    properties (SetAccess = private)

        %COUNT The number of triggersources. Read Only.
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

    end

    %% Public Methods
    methods

        function RemoveAllCustomTriggerSources(obj)
            %REMOVEALLCUSTOMTRIGGERSOURCES This function removes all of the custom trigger sources that were added using the Add Trigger Source function.
            
            obj.checkValidObj();
			error(nargchk(1,1,nargin,'struct'))
            try
                obj.interface.RemoveAllCustomTriggerSources();
            catch e
                obj.interpretError(e);
            end
        end

        function Remove(obj,SourceName)
            %REMOVE This function removes a trigger source.
            
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
            %ADD This function creates a new trigger source.
            
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
            %ITEM An interface reference pointer to the IAgXSAnTriggerSource interface which is selected by the triggersource name.
            
            obj.checkValidObj();
			error(nargchk(2,2,nargin,'struct'))
            Name = obj.checkScalarStringArg(Name,'Name');
            try
                [val] = instrument.driver.AgXSAn.DeviceSpecific.Trigger3.Sources.Item(obj.interface.Item(char(Name)));
            catch e
                obj.interpretError(e);
            end
        end

        function val = Name(obj,Index)
            %NAME The triggersource name for a given index.
            
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
