classdef Mounts
    properties
    end
    methods(Static)
        function out = construct()
        %% construct
        %% Description: Construct a struct that represents the Mounts model with keys defined and defaults populated.
            out = struct();
            out.mounts = [];
        end
    end
end


