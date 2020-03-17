classdef Documents
    properties
    end
    methods(Static)
        function out = construct()
        %% construct
        %% Description: Construct a struct that represents the Documents model with keys defined and defaults populated.
            out = struct();
            out.documents = [];
        end
    end
end


