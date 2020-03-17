%% 
classdef RefApi
    properties
    end
    methods(Static)
        function out = delete_ref(projectId, refId, optionalArguments)
        % delete_ref  Delete ref
        %
        %     HTTPResponse = delete_ref(projectId, refId, optionalArguments)
        %
        %     Required Argument(s):
        %         projectId (string) - project identifier
        %         refId (string) - ref identifier
        %     OptionalArgument(s):
        %
        %      e.g. optionalArguments = struct()
        global basePath;
        httpMethod = 'DELETE';
        queryParamsInputs = struct();
        relativePath = '/projects/{project_id}/refs/{ref_id}';
        relativePath = strrep(relativePath, strcat('{', 'project_id', '}'), projectId);
        relativePath = strrep(relativePath, strcat('{', 'ref_id', '}'), refId);
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

        function out = get_ref(projectId, refId, optionalArguments)
        % get_ref  Get ref
        %
        %     HTTPResponse = get_ref(projectId, refId, optionalArguments)
        %
        %     Required Argument(s):
        %         projectId (string) - project identifier
        %         refId (string) - ref identifier
        %     OptionalArgument(s):
        %
        %      e.g. optionalArguments = struct()
        global basePath;
        httpMethod = 'GET';
        queryParamsInputs = struct();
        relativePath = '/projects/{project_id}/refs/{ref_id}';
        relativePath = strrep(relativePath, strcat('{', 'project_id', '}'), projectId);
        relativePath = strrep(relativePath, strcat('{', 'ref_id', '}'), refId);
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

        function out = get_ref_history(projectId, refId, optionalArguments)
        % get_ref_history  Get ref history
        %
        %     HTTPResponse = get_ref_history(projectId, refId, optionalArguments)
        %
        %     Required Argument(s):
        %         projectId (string) - project identifier
        %         refId (string) - ref identifier
        %     OptionalArgument(s):
        %
        %      e.g. optionalArguments = struct()
        global basePath;
        httpMethod = 'GET';
        queryParamsInputs = struct();
        relativePath = '/projects/{project_id}/refs/{ref_id}/commits';
        relativePath = strrep(relativePath, strcat('{', 'project_id', '}'), projectId);
        relativePath = strrep(relativePath, strcat('{', 'ref_id', '}'), refId);
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

        function out = get_refs(projectId, optionalArguments)
        % get_refs  Get all refs in project
        %
        %     HTTPResponse = get_refs(projectId, optionalArguments)
        %
        %     Required Argument(s):
        %         projectId (string) - project identifier
        %     OptionalArgument(s):
        %
        %      e.g. optionalArguments = struct()
        global basePath;
        httpMethod = 'GET';
        queryParamsInputs = struct();
        relativePath = '/projects/{project_id}/refs';
        relativePath = strrep(relativePath, strcat('{', 'project_id', '}'), projectId);
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

        function out = post_refs(projectId, body, optionalArguments)
        % post_refs  Create and/or update ref(s)
        %
        %     HTTPResponse = post_refs(projectId, body, optionalArguments)
        %
        %     Required Argument(s):
        %         projectId (string) - project identifier
        %         body (Refs) - 
        %     OptionalArgument(s):
        %
        %      e.g. optionalArguments = struct()
        global basePath;
        httpMethod = 'POST';
        queryParamsInputs = struct();
        relativePath = '/projects/{project_id}/refs';
        relativePath = strrep(relativePath, strcat('{', 'project_id', '}'), projectId);
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







