classdef Matlab_MMS_client
   properties
   end
   methods(Static)

       % Set basic authentication method named Basic.
       function setBasicAuth(username, password)
           auth_str = matlab.net.base64encode(strcat(username, ':', password));
           setenv(upper('Matlab-MMS-client_Basic_Auth'), char(strcat("Basic ", auth_str)));
       end

       function out = getBasicAuth()
           out = getenv(upper('Matlab-MMS-client_Basic_Auth'));
       end

       function out = isBasicAuthSet()
           out = ~isempty(getenv(upper('Matlab-MMS-client_Basic_Auth'))) || getenv(upper('Matlab-MMS-client_Basic_Auth')) ~= "";
       end

       % Set apiKey authentication method named Ticket.
       function setTicketAuth(ticket)
           setenv(upper('Matlab-MMS-client_Ticket_Auth'), char(ticket));
       end

       function out = getTicketAuth()
           out = getenv(upper('Matlab-MMS-client_Ticket_Auth'));
       end

       function out = isTicketAuthSet()
           out = ~isempty(getenv(upper('Matlab-MMS-client_Ticket_Auth'))) || getenv(upper('Matlab-MMS-client_Ticket_Auth')) ~= "";
       end

       function setBasePath(pathInput)
           global basePath;
           basePath = pathInput;
       end

       function out = getBasePath()
           global basePath;
           out = basePath;
       end
       
       function out = request(httpRequestArgs)
           if strcmp(upper(httpRequestArgs.options.RequestMethod), upper('GET'))
               out = webread(httpRequestArgs.url, httpRequestArgs.options);
           else
               bodyJsonString = [];
               if isfield(httpRequestArgs, 'body')
                   bodyJsonString = jsonencode(httpRequestArgs.body);
                   bodyJsonString = strrep(bodyJsonString, '"x_', '"_');
               end
              
               out = webwrite(httpRequestArgs.url, bodyJsonString, httpRequestArgs.options);
           end
       end
   end
end