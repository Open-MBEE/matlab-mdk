%% 
classdef OrgApi
    properties
    end
    methods(Static)
        function out = delete_org(orgId, optionalArguments)
        % delete_org  Delete org
        %
        %     HTTPResponse = delete_org(orgId, optionalArguments)
        %
        %     Required Argument(s):
        %         orgId (string) - org identifier
        %     OptionalArgument(s):
        %
        %      e.g. optionalArguments = struct()
        global basePath;
        httpMethod = 'DELETE';
        queryParamsInputs = struct();
        relativePath = '/orgs/{org_id}';
        relativePath = strrep(relativePath, strcat('{', 'org_id', '}'), orgId);
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

        function out = get_org(orgId, optionalArguments)
        % get_org  Get org
        %
        %     HTTPResponse = get_org(orgId, optionalArguments)
        %
        %     Required Argument(s):
        %         orgId (string) - org identifier
        %     OptionalArgument(s):
        %
        %      e.g. optionalArguments = struct()
        global basePath;
        httpMethod = 'GET';
        queryParamsInputs = struct();
        relativePath = '/orgs/{org_id}';
        relativePath = strrep(relativePath, strcat('{', 'org_id', '}'), orgId);
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

        function out = get_orgs(optionalArguments)
        % get_orgs  Get all orgs
        %
        %     HTTPResponse = get_orgs(optionalArguments)
        %
        %     Required Argument(s):
        %     OptionalArgument(s):
        %
        %      e.g. optionalArguments = struct()
        global basePath;
        httpMethod = 'GET';
        queryParamsInputs = struct();
        relativePath = '/orgs';
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

        function out = post_orgs(body, optionalArguments)
        % post_orgs  Create and/or update org(s)
        %
        %     HTTPResponse = post_orgs(body, optionalArguments)
        %
        %     Required Argument(s):
        %         body (Orgs) - 
        %     OptionalArgument(s):
        %
        %      e.g. optionalArguments = struct()
        global basePath;
        httpMethod = 'POST';
        queryParamsInputs = struct();
        relativePath = '/orgs';
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
        httpRequestArgs = struct('url', url, 'body', body, 'options', options);
        out = Matlab_MMS_client.request(httpRequestArgs);
        end
    end
end







