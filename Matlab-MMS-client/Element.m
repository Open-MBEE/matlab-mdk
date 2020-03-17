classdef Element
    properties
    end
    methods(Static)
        function out = construct()
        %% construct
        %% Description: Construct a struct that represents the Element model with keys defined and defaults populated.
            out = struct();
            out.id = '';
            out.name = '';
        end
    end
end


