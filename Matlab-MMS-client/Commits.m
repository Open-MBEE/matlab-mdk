classdef Commits
    properties
    end
    methods(Static)
        function out = construct()
        %% construct
        %% Description: Construct a struct that represents the Commits model with keys defined and defaults populated.
            out = struct();
            out.commits = [];
        end
    end
end


