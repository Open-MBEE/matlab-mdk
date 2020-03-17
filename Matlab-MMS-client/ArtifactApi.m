%% 
classdef ArtifactApi
    properties
    end
    methods(Static)
        function out = delete_artifact(projectId, refId, artifactId, optionalArguments)
        % delete_artifact  Delete artifact
        %
        %     HTTPResponse = delete_artifact(projectId, refId, artifactId, optionalArguments)
        %
        %     Required Argument(s):
        %         projectId (string) - project identifier
        %         refId (string) - ref identifier
        %         artifactId (string) - artifact identifier
        %     OptionalArgument(s):
        %
        %      e.g. optionalArguments = struct()
        global basePath;
        httpMethod = 'DELETE';
        queryParamsInputs = struct();
        relativePath = '/projects/{project_id}/refs/{ref_id}/artifacts/{artifact_id}';
        relativePath = strrep(relativePath, strcat('{', 'project_id', '}'), projectId);
        relativePath = strrep(relativePath, strcat('{', 'ref_id', '}'), refId);
        relativePath = strrep(relativePath, strcat('{', 'artifact_id', '}'), artifactId);
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

        function out = delete_artifacts_in_batch(projectId, refId, body, optionalArguments)
        % delete_artifacts_in_batch  Delete artifact(s) in batch
        %
        %     HTTPResponse = delete_artifacts_in_batch(projectId, refId, body, optionalArguments)
        %
        %     Required Argument(s):
        %         projectId (string) - project identifier
        %         refId (string) - ref identifier
        %         body (Artifacts) - 
        %     OptionalArgument(s):
        %
        %      e.g. optionalArguments = struct()
        global basePath;
        httpMethod = 'DELETE';
        queryParamsInputs = struct();
        relativePath = '/projects/{project_id}/refs/{ref_id}/artifacts';
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
        httpRequestArgs = struct('url', url, 'body', body, 'options', options);
        out = Matlab_MMS_client.request(httpRequestArgs);
        end

        function out = get_artifact(projectId, refId, artifactId, optionalArguments)
        % get_artifact  Get artifact
        %
        %     HTTPResponse = get_artifact(projectId, refId, artifactId, optionalArguments)
        %
        %     Required Argument(s):
        %         projectId (string) - project identifier
        %         refId (string) - ref identifier
        %         artifactId (string) - artifact identifier
        %     OptionalArgument(s):
        %         depth (double) - 
        %         extended (logical) - 
        %         commitId (string) - 
        %
        %      e.g. optionalArguments = struct('depth', depthvalue, 'extended', extendedvalue, 'commitId', commitIdvalue)
        global basePath;
        httpMethod = 'GET';
        queryParamsInputs = struct();
        relativePath = '/projects/{project_id}/refs/{ref_id}/artifacts/{artifact_id}';
        relativePath = strrep(relativePath, strcat('{', 'project_id', '}'), projectId);
        relativePath = strrep(relativePath, strcat('{', 'ref_id', '}'), refId);
        relativePath = strrep(relativePath, strcat('{', 'artifact_id', '}'), artifactId);
        if ~exist('optionalArguments')
            optionalArguments = struct();
        end
        
        if Matlab_MMS_client.isTicketAuthSet()
            queryParamsInputs = setfield(queryParamsInputs, 'alf_ticket', Matlab_MMS_client.getTicketAuth());
        end
        
        if isfield(optionalArguments, 'depth')
            queryParamsInputs = setfield(queryParamsInputs, 'depth', getfield(optionalArguments, 'depth'));
        end
        if isfield(optionalArguments, 'extended')
            queryParamsInputs = setfield(queryParamsInputs, 'extended', getfield(optionalArguments, 'extended'));
        end
        if isfield(optionalArguments, 'commitId')
            queryParamsInputs = setfield(queryParamsInputs, 'commitId', getfield(optionalArguments, 'commitId'));
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

        function out = get_artifact_history(projectId, refId, artifactId, optionalArguments)
        % get_artifact_history  Get artifact history
        %
        %     HTTPResponse = get_artifact_history(projectId, refId, artifactId, optionalArguments)
        %
        %     Required Argument(s):
        %         projectId (string) - project identifier
        %         refId (string) - ref identifier
        %         artifactId (string) - artifact identifier
        %     OptionalArgument(s):
        %
        %      e.g. optionalArguments = struct()
        global basePath;
        httpMethod = 'GET';
        queryParamsInputs = struct();
        relativePath = '/projects/{project_id}/refs/{ref_id}/artifacts/{artifact_id}/commits';
        relativePath = strrep(relativePath, strcat('{', 'project_id', '}'), projectId);
        relativePath = strrep(relativePath, strcat('{', 'ref_id', '}'), refId);
        relativePath = strrep(relativePath, strcat('{', 'artifact_id', '}'), artifactId);
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

        function out = get_artifacts(projectId, refId, optionalArguments)
        % get_artifacts  Get artifacts
        %
        %     HTTPResponse = get_artifacts(projectId, refId, optionalArguments)
        %
        %     Required Argument(s):
        %         projectId (string) - project identifier
        %         refId (string) - ref identifier
        %     OptionalArgument(s):
        %         commitId (string) - 
        %
        %      e.g. optionalArguments = struct('commitId', commitIdvalue)
        global basePath;
        httpMethod = 'GET';
        queryParamsInputs = struct();
        relativePath = '/projects/{project_id}/refs/{ref_id}/artifacts';
        relativePath = strrep(relativePath, strcat('{', 'project_id', '}'), projectId);
        relativePath = strrep(relativePath, strcat('{', 'ref_id', '}'), refId);
        if ~exist('optionalArguments')
            optionalArguments = struct();
        end
        
        if Matlab_MMS_client.isTicketAuthSet()
            queryParamsInputs = setfield(queryParamsInputs, 'alf_ticket', Matlab_MMS_client.getTicketAuth());
        end
        
        if isfield(optionalArguments, 'commitId')
            queryParamsInputs = setfield(queryParamsInputs, 'commitId', getfield(optionalArguments, 'commitId'));
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

        function out = get_artifacts_in_batch(projectId, refId, body, optionalArguments)
        % get_artifacts_in_batch  Get artifact(s) in batch
        %
        %     HTTPResponse = get_artifacts_in_batch(projectId, refId, body, optionalArguments)
        %
        %     Required Argument(s):
        %         projectId (string) - project identifier
        %         refId (string) - ref identifier
        %         body (Artifacts) - 
        %     OptionalArgument(s):
        %         commitId (string) - 
        %
        %      e.g. optionalArguments = struct('commitId', commitIdvalue)
        global basePath;
        httpMethod = 'PUT';
        queryParamsInputs = struct();
        relativePath = '/projects/{project_id}/refs/{ref_id}/artifacts';
        relativePath = strrep(relativePath, strcat('{', 'project_id', '}'), projectId);
        relativePath = strrep(relativePath, strcat('{', 'ref_id', '}'), refId);
        if ~exist('optionalArguments')
            optionalArguments = struct();
        end
        
        if Matlab_MMS_client.isTicketAuthSet()
            queryParamsInputs = setfield(queryParamsInputs, 'alf_ticket', Matlab_MMS_client.getTicketAuth());
        end
        
        if isfield(optionalArguments, 'commitId')
            queryParamsInputs = setfield(queryParamsInputs, 'commitId', getfield(optionalArguments, 'commitId'));
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

        function out = post_artifact(projectId, refId, id, file, optionalArguments)
        % post_artifact  Create and/or update artifact
        %
        %     HTTPResponse = post_artifact(projectId, refId, id, file, optionalArguments)
        %
        %     Required Argument(s):
        %         projectId (string) - project identifier
        %         refId (string) - ref identifier
        %         id (string) - 
        %         file (File) - 
        %     OptionalArgument(s):
        %         contentType (string) - When the content type cannot be automatically detected, this explicitly defined value is used.
        %         name (string) - 
        %         source (string) - 
        %         comment (string) - 
        %
        %      e.g. optionalArguments = struct('contentType', contentTypevalue, 'name', namevalue, 'source', sourcevalue, 'comment', commentvalue)
        global basePath;
        httpMethod = 'POST';
        queryParamsInputs = struct();
        relativePath = '/projects/{project_id}/refs/{ref_id}/artifacts';
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
    end
end







