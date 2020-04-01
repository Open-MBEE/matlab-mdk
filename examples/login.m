function login(username,basePath)

%-----------------------------------------------------------
%Description: Log into server
%
%input Args: 
%   basePath(str) = https://mms.org
%   username(str) = JPL username
%   passcode = JPL password (type in passcode text box)
%-----------------------------------------------------------

    MMS.setBasePath(basePath)
    out.username = username;
    out.password = passcode();
    %MMS.setBasicAuth(out.username, out.password);
    ticket = MMS.TicketApi.post_ticket(out);
    MMS.setTicketAuth(ticket.data.ticket);
    
    clear out
    
end