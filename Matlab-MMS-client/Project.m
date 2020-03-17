classdef Project
    properties
    end
    methods(Static)
        function out = construct()
        %% construct
        %% Description: Construct a struct that represents the Project model with keys defined and defaults populated.
            out = struct();
            out.id = '';
            out.name = '';
            out.orgId = '';
            out.type = 'Project';
        end
    end
end


