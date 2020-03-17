%% 
classdef ElementApi
    properties
    end
    methods(Static)
        function out = delete_element(projectId, refId, elementId, optionalArguments)
        % delete_element  Delete element
        %
        %     HTTPResponse = delete_element(projectId, refId, elementId, optionalArguments)
        %
        %     Required Argument(s):
        %         projectId (string) - project identifier
        %         refId (string) - ref identifier
        %         elementId (string) - element identifier
        %     OptionalArgument(s):
        %
        %      e.g. optionalArguments = struct()
        global basePath;
        httpMethod = 'DELETE';
        queryParamsInputs = struct();
        relativePath = '/projects/{project_id}/refs/{ref_id}/elements/{element_id}';
        relativePath = strrep(relativePath, strcat('{', 'project_id', '}'), projectId);
        relativePath = strrep(relativePath, strcat('{', 'ref_id', '}'), refId);
        relativePath = strrep(relativePath, strcat('{', 'element_id', '}'), elementId);
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

        function out = delete_elements_in_batch(projectId, refId, body, optionalArguments)
        % delete_elements_in_batch  Delete element(s) in batch
        %
        %     HTTPResponse = delete_elements_in_batch(projectId, refId, body, optionalArguments)
        %
        %     Required Argument(s):
        %         projectId (string) - project identifier
        %         refId (string) - ref identifier
        %         body (Elements) - 
        %     OptionalArgument(s):
        %
        %      e.g. optionalArguments = struct()
        global basePath;
        httpMethod = 'DELETE';
        queryParamsInputs = struct();
        relativePath = '/projects/{project_id}/refs/{ref_id}/elements';
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

        function out = get_element(projectId, refId, elementId, optionalArguments)
        % get_element  Get element
        %
        %     HTTPResponse = get_element(projectId, refId, elementId, optionalArguments)
        %
        %     Required Argument(s):
        %         projectId (string) - project identifier
        %         refId (string) - ref identifier
        %         elementId (string) - element identifier
        %     OptionalArgument(s):
        %         depth (double) - 
        %         extended (logical) - 
        %         commitId (string) - 
        %
        %      e.g. optionalArguments = struct('depth', depthvalue, 'extended', extendedvalue, 'commitId', commitIdvalue)
        global basePath;
        httpMethod = 'GET';
        queryParamsInputs = struct();
        relativePath = '/projects/{project_id}/refs/{ref_id}/elements/{element_id}';
        relativePath = strrep(relativePath, strcat('{', 'project_id', '}'), projectId);
        relativePath = strrep(relativePath, strcat('{', 'ref_id', '}'), refId);
        relativePath = strrep(relativePath, strcat('{', 'element_id', '}'), elementId);
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

        function out = get_element_history(projectId, refId, elementId, optionalArguments)
        % get_element_history  Get element history
        %
        %     HTTPResponse = get_element_history(projectId, refId, elementId, optionalArguments)
        %
        %     Required Argument(s):
        %         projectId (string) - project identifier
        %         refId (string) - ref identifier
        %         elementId (string) - element identifier
        %     OptionalArgument(s):
        %
        %      e.g. optionalArguments = struct()
        global basePath;
        httpMethod = 'GET';
        queryParamsInputs = struct();
        relativePath = '/projects/{project_id}/refs/{ref_id}/elements/{element_id}/commits';
        relativePath = strrep(relativePath, strcat('{', 'project_id', '}'), projectId);
        relativePath = strrep(relativePath, strcat('{', 'ref_id', '}'), refId);
        relativePath = strrep(relativePath, strcat('{', 'element_id', '}'), elementId);
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

        function out = get_elements(projectId, refId, optionalArguments)
        % get_elements  Get elements
        %
        %     HTTPResponse = get_elements(projectId, refId, optionalArguments)
        %
        %     Required Argument(s):
        %         projectId (string) - project identifier
        %         refId (string) - ref identifier
        %     OptionalArgument(s):
        %         extended (logical) - 
        %         commitId (string) - 
        %
        %      e.g. optionalArguments = struct('extended', extendedvalue, 'commitId', commitIdvalue)
        global basePath;
        httpMethod = 'GET';
        queryParamsInputs = struct();
        relativePath = '/projects/{project_id}/refs/{ref_id}/elements';
        relativePath = strrep(relativePath, strcat('{', 'project_id', '}'), projectId);
        relativePath = strrep(relativePath, strcat('{', 'ref_id', '}'), refId);
        if ~exist('optionalArguments')
            optionalArguments = struct();
        end
        
        if Matlab_MMS_client.isTicketAuthSet()
            queryParamsInputs = setfield(queryParamsInputs, 'alf_ticket', Matlab_MMS_client.getTicketAuth());
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

        function out = get_elements_in_batch(projectId, refId, body, optionalArguments)
        % get_elements_in_batch  Get element(s) in batch
        %
        %     HTTPResponse = get_elements_in_batch(projectId, refId, body, optionalArguments)
        %
        %     Required Argument(s):
        %         projectId (string) - project identifier
        %         refId (string) - ref identifier
        %         body (Elements) - 
        %     OptionalArgument(s):
        %         depth (double) - 
        %         extended (logical) - 
        %         commitId (string) - 
        %
        %      e.g. optionalArguments = struct('depth', depthvalue, 'extended', extendedvalue, 'commitId', commitIdvalue)
        global basePath;
        httpMethod = 'PUT';
        queryParamsInputs = struct();
        relativePath = '/projects/{project_id}/refs/{ref_id}/elements';
        relativePath = strrep(relativePath, strcat('{', 'project_id', '}'), projectId);
        relativePath = strrep(relativePath, strcat('{', 'ref_id', '}'), refId);
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
        httpRequestArgs = struct('url', url, 'body', body, 'options', options);
        out = Matlab_MMS_client.request(httpRequestArgs);
        end

        function out = post_elements(projectId, refId, body, optionalArguments)
        % post_elements  Create and/or update element(s)
        %
        %     HTTPResponse = post_elements(projectId, refId, body, optionalArguments)
        %
        %     Required Argument(s):
        %         projectId (string) - project identifier
        %         refId (string) - ref identifier
        %         body (Elements) - [e1,e2,e3]
        %     OptionalArgument(s):
        %
        %      e.g. optionalArguments = struct()
        global basePath;
        httpMethod = 'POST';
        queryParamsInputs = struct();
        relativePath = '/projects/{project_id}/refs/{ref_id}/elements';
        relativePath = strrep(relativePath, strcat('{', 'project_id', '}'), projectId);
        relativePath = strrep(relativePath, strcat('{', 'ref_id', '}'), refId);
        elems2post = Utils.getObjStruct(body, "elements");
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
        httpRequestArgs = struct('url', url, 'body', elems2post, 'options', options);
        out = Matlab_MMS_client.request(httpRequestArgs);
        end
    end
end