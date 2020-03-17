classdef Ref
    properties
    end
    methods(Static)
        function out = construct()
        %% construct
        %% Description: Construct a struct that represents the Ref model with keys defined and defaults populated.
            out = struct();
            out.id = '';
            out.name = '';
            out.parentRefId = '';
            out.type = 'Branch';
        end
    end
end


