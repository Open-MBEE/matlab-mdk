classdef LoginRequest
    properties
    end
    methods(Static)
        function out = construct()
        %% construct
        %% Description: Construct a struct that represents the LoginRequest model with keys defined and defaults populated.
            out = struct();
            out.username = '';
            out.password = '';
        end
    end
end


