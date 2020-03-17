classdef Commit
    properties
    end
    methods(Static)
        function out = construct()
        %% construct
        %% Description: Construct a struct that represents the Commit model with keys defined and defaults populated.
            out = struct();
            out.id = '';
        end
    end
end


