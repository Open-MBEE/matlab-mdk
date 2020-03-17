%% 
classdef OtherApi
    properties
    end
    methods(Static)
        function out = get_documents(projectId, refId, optionalArguments)
        % get_documents  Get documents
        %
        %     HTTPResponse = get_documents(projectId, refId, optionalArguments)
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
        relativePath = '/projects/{project_id}/refs/{ref_id}/documents';
        relativePath = strrep(relativePath, strcat('{', 'project_id', '}'), projectId);
        relativePath = strrep(relativePath, strcat('{', 'ref_id', '}'), refId);
        if ~exist('optionalArguments')
            optionalArguments = struct();
        end
        
        if Matlab-MMS-client.isTicketAuthSet()
            queryParamsInputs = setfield(queryParamsInputs, 'alf_ticket', Matlab-MMS-client.getTicketAuth());
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
        if ~isempty(char(Matlab-MMS-client.getBasicAuth()))
            headers = [headers; "Authorization", string(Matlab-MMS-client.getBasicAuth())];
        end
        options = weboptions('HeaderFields', headers, 'MediaType', 'application/json', 'RequestMethod', httpMethod, 'Timeout', Inf('double'));
        httpRequestArgs = struct('url', url, 'options', options);
        out = Matlab-MMS-client.request(httpRequestArgs);
        end

        function out = get_groups(projectId, refId, optionalArguments)
        % get_groups  Get groups
        %
        %     HTTPResponse = get_groups(projectId, refId, optionalArguments)
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
        relativePath = '/projects/{project_id}/refs/{ref_id}/groups';
        relativePath = strrep(relativePath, strcat('{', 'project_id', '}'), projectId);
        relativePath = strrep(relativePath, strcat('{', 'ref_id', '}'), refId);
        if ~exist('optionalArguments')
            optionalArguments = struct();
        end
        
        if Matlab-MMS-client.isTicketAuthSet()
            queryParamsInputs = setfield(queryParamsInputs, 'alf_ticket', Matlab-MMS-client.getTicketAuth());
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
        if ~isempty(char(Matlab-MMS-client.getBasicAuth()))
            headers = [headers; "Authorization", string(Matlab-MMS-client.getBasicAuth())];
        end
        options = weboptions('HeaderFields', headers, 'MediaType', 'application/json', 'RequestMethod', httpMethod, 'Timeout', Inf('double'));
        httpRequestArgs = struct('url', url, 'options', options);
        out = Matlab_MMS_client.request(httpRequestArgs);
        end

        function out = get_mounts(projectId, refId, optionalArguments)
        % get_mounts  Get mounts
        %
        %     HTTPResponse = get_mounts(projectId, refId, optionalArguments)
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
        relativePath = '/projects/{project_id}/refs/{ref_id}/mounts';
        relativePath = strrep(relativePath, strcat('{', 'project_id', '}'), projectId);
        relativePath = strrep(relativePath, strcat('{', 'ref_id', '}'), refId);
        if ~exist('optionalArguments')
            optionalArguments = struct();
        end
        
        if Matlab-MMS-client.isTicketAuthSet()
            queryParamsInputs = setfield(queryParamsInputs, 'alf_ticket', Matlab-MMS-client.getTicketAuth());
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
        if ~isempty(char(Matlab-MMS-client.getBasicAuth()))
            headers = [headers; "Authorization", string(Matlab-MMS-client.getBasicAuth())];
        end
        options = weboptions('HeaderFields', headers, 'MediaType', 'application/json', 'RequestMethod', httpMethod, 'Timeout', Inf('double'));
        httpRequestArgs = struct('url', url, 'options', options);
        out = Matlab_MMS_client.request(httpRequestArgs);
        end
    end
end







