classdef Elements
    properties
    end
    methods(Static)
        function out = construct()
        %% construct
        %% Description: Construct a struct that represents the Elements model with keys defined and defaults populated.
            out = struct();
            out.elements = [];
            out.comment = '';
            out.source = '';
        end
    end
end


