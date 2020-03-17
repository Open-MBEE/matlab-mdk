classdef Artifacts
    properties
    end
    methods(Static)
        function out = construct()
        %% construct
        %% Description: Construct a struct that represents the Artifacts model with keys defined and defaults populated.
            out = struct();
            out.artifacts = [];
        end
    end
end


