%-----------------------------------------------------------
%Download passcode.m from Supplementary Functions package
%-----------------------------------------------------------

function Login(username,basePath)

%-----------------------------------------------------------
%Description: Log into server
%
%input Args: 
%   basePath(str) = https://mms.org
%   username(str) = JPL username
%   passcode = JPL password (type in passcode text box)
%-----------------------------------------------------------

    LoginRequest();
    Matlab_MMS_client.setBasePath(basePath)
    out.username = username;
    out.password = passcode();
    %Matlab_MMS_client.setBasicAuth(out.username, out.password);
    tick = TicketApi.post_ticket(out);
    Matlab_MMS_client.setTicketAuth(tick.data.ticket);
    
    clear out
    
end