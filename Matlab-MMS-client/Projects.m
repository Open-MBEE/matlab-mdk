classdef Projects
    properties
    end
    methods(Static)
        function out = construct()
        %% construct
        %% Description: Construct a struct that represents the Projects model with keys defined and defaults populated.
            out = struct();
            out.projects = [];
        end
    end
end


