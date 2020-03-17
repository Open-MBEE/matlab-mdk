classdef LoginResponseData
    properties
    end
    methods(Static)
        function out = construct()
        %% construct
        %% Description: Construct a struct that represents the LoginResponseData model with keys defined and defaults populated.
            out = struct();
            out.ticket = '';
        end
    end
end


