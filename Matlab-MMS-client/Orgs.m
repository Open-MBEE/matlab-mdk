classdef Orgs
    properties
    end
    methods(Static)
        function out = construct()
        %% construct
        %% Description: Construct a struct that represents the Orgs model with keys defined and defaults populated.
            out = struct();
            out.orgs = [];
        end
    end
end


