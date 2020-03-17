classdef TicketResponse
    properties
    end
    methods(Static)
        function out = construct()
        %% construct
        %% Description: Construct a struct that represents the TicketResponse model with keys defined and defaults populated.
            out = struct();
            out.username = '';
            out.first = '';
            out.last = '';
        end
    end
end


