function [posted] = MMSSlotWrite(server, workspaceName, site, SlotID, snapshot, newValue)

url = [server '/' 'alfresco/service/workspaces' '/' workspaceName '/' 'sites' '/' site '/' 'elements' '/' SlotID '?time=' snapshot]

%propmts dialog box for user's username and password
[user, password] = GetAuthentication();

%options1 creates weboptions to bring in the url's json as a char array so
%using strrep is possible and to export the changed json as a string
%string brings in the url's json
options1 = weboptions('Username',user,'Password',password, 'ContentType', 'text');
string = webread(url, options1)

%options2 creates weboptions to bring in the url's json as a struct array
%so transversing the json to extract the old value is possible
%structure brings in the url's json 
options2 = weboptions('Username',user,'Password',password, 'ContentType', 'json')
structure = webread(url, options2)

%doubleval transverses through the structure and changes the value from a
%double to a string so using strrep is possible
doubleval = num2str(structure.elements.specialization.value.double)

%oldValue and newValue create a unique string so strrep changes only the
%double value in the json
oldValue = ['"double": ' doubleval]
newValue = ['"double": ' newValue]
stringFixed = strrep(string, oldValue, newValue)
url2 = 'https://cae-ems-uat.jpl.nasa.gov/alfresco/service/workspaces/master/sites/thepasture/elements'
options = weboptions('Username',user,'Password',password,'MediaType','application/json','ContentType','json')
posted = webwrite(url2,stringFixed,options)
end
