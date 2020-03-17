%% 
classdef TicketApi
    properties
    end
    methods(Static)
        function out = get_ticket(ticketId, optionalArguments)
        % get_ticket  Get ticket
        %
        %     HTTPResponse = get_ticket(ticketId, optionalArguments)
        %
        %     Required Argument(s):
        %         ticketId (string) - ticket identifier
        %     OptionalArgument(s):
        %
        %      e.g. optionalArguments = struct()
        global basePath;
        httpMethod = 'GET';
        queryParamsInputs = struct();
        relativePath = '/mms/login/ticket/{ticket_id}';
        relativePath = strrep(relativePath, strcat('{', 'ticket_id', '}'), ticketId);
        if ~exist('optionalArguments')
            optionalArguments = struct();
        end
        
        if Matlab_MMS_client.isTicketAuthSet()
            queryParamsInputs = setfield(queryParamsInputs, 'alf_ticket', Matlab_MMS_client.getTicketAuth());
        end
        
        if ~exist('queryParamsInputs')
            queryParamsInputs = struct();
        end

        query = string(matlab.net.QueryParameter(queryParamsInputs));
        if ~isempty(query)
            query = strcat('?', query);
        end
        contextPath = '/alfresco/service';
        url = sprintf('%s%s%s%s', basePath, contextPath, relativePath, query);
        headers = ["Content-Type", "application/json"];
        if ~isempty(char(Matlab_MMS_client.getBasicAuth()))
            headers = [headers; "Authorization", string(Matlab_MMS_client.getBasicAuth())];
        end
        options = weboptions('HeaderFields', headers, 'MediaType', 'application/json', 'RequestMethod', httpMethod, 'Timeout', Inf('double'));
        httpRequestArgs = struct('url', url, 'options', options);
        out = Matlab_MMS_client.request(httpRequestArgs);
        end

        function out = post_ticket(body, optionalArguments)
        % post_ticket  Create ticket
        %
        %     HTTPResponse = post_ticket(body, optionalArguments)
        %
        %     Required Argument(s):
        %         body (LoginRequest) - 
        %     OptionalArgument(s):
        %
        %      e.g. optionalArguments = struct()
        global basePath;
        httpMethod = 'POST';
        queryParamsInputs = struct();
        relativePath = '/api/login';
        if ~exist('optionalArguments')
            optionalArguments = struct();
        end
        
            
        
        if ~exist('queryParamsInputs')
            queryParamsInputs = struct();
        end

        query = string(matlab.net.QueryParameter(queryParamsInputs));
        if ~isempty(query)
            query = strcat('?', query);
        end
        contextPath = '/alfresco/service';
        url = sprintf('%s%s%s%s', basePath, contextPath, relativePath, query);
        headers = ["Content-Type", "application/json"];
        options = weboptions('HeaderFields', headers, 'MediaType', 'application/json', 'RequestMethod', httpMethod, 'Timeout', Inf('double'));
        httpRequestArgs = struct('url', url, 'body', body, 'options', options);
        out = Matlab_MMS_client.request(httpRequestArgs);
        end
    end
end







