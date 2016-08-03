function [value] = MMSSlotRead(server, workspaceName, site, SlotID, timestamp)

%url creates the URL where the element information is stored
url = [server '/' 'alfresco/service/workspaces' '/' workspaceName '/' 'sites' '/' site '/' 'elements' '/' SlotID '?time=' timestamp];

%GetAuthentcication prompts user for JPL username and password
[user,password] = GetAuthentication ();

%options and reader read the JSON from the URL
options = weboptions('Username',user,'Password',password);
reader = webread(url,options);

%value parses through the JSON to output the value
value = reader.elements.specialization.value.double
end