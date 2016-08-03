function [cells] = MMSDocumentRead(server, workspaceName, site, DocumentID, snapshot)

%url creates URL where childViews are stored
url = [server '/' 'alfresco/service/workspaces' '/' workspaceName '/' 'sites' '/' site '/' 'elements' '/' DocumentID '?time=' snapshot];

%GetAuthentication prompts user for their JPL username and password
[user,password] = GetAuthentication ();

%options and reader read the JSON from the URL
options = weboptions('Username',user,'Password',password);
reader = webread(url,options);

%childView parses through the json down to childViews, then coverts the
%json from a structure to a cell so each childView can be referenced
%properly and used in url2
childView = struct2cell(reader.elements.specialization.childViews);

count = 1;
counter = 1;
thecount = 1;

%url2 webreads each childView and dispele shows the displayedElements ID's
%to later view the values and names inside the displayedElements
for j = 1:size(childView,2);
    url2 = webread([server '/' 'alfresco/service/workspaces' '/' workspaceName '/' 'sites' '/' site '/' 'elements' '/' childView{2,j}],options);
    dispele = url2.elements.specialization.displayedElements;
    
    %url3 webreads each displayedElements ID's and testvalue goes into the
    %specialization to grab the value and the PropertyName
    for k = 1:size(dispele);
        url3 = webread([server '/' 'alfresco/service/workspaces' '/' workspaceName '/' 'sites' '/' site '/' 'elements' '/' dispele{k}],options);
        testvalue = url3.elements.specialization;
            
            %tests for the structure field 'value', if it is present then
            %val finds the value and findname finds the PropertyName,
            %findOwner goes down to the 'owner' ID so later the owner of
            %each displayedElement can be found
            if isfield(testvalue, 'value');
                yes = webread([server '/' 'alfresco/service/workspaces' '/' workspaceName '/' 'sites' '/' site '/' 'elements' '/' dispele{k}],options);
                val(count) = testvalue.value.double;
                count = count+1;
                findname = testvalue.propertyType;
                url4 = webread([server '/' 'alfresco/service/workspaces' '/' workspaceName '/' 'sites' '/' site '/' 'elements' '/' findname],options);
                names = url4.elements.name;
                stringname(counter) = cellstr(names)';
                noSpacesName = ProperName(stringname);
                counter = counter + 1;
                findOwner = yes.elements.owner;
                       url5 = webread([server '/' 'alfresco/service/workspaces' '/' workspaceName '/' 'sites' '/' site '/' 'elements' '/' findOwner],options);
                       found = url5.elements.name;
                       owner(thecount) = cellstr(found);
                       thecount = thecount + 1;
                            %creates a 1xNumberOfValues cell array in the
                            %format: {Owner, Property Name, Value} this is
                            %the same format MMSDocumentRead accepts for
                            %the input "ElementTriples'
                            for l = 1:size(owner,2);
                                cells{l} = {owner{l} noSpacesName{l} val(l)};
                            end
                    
            end
    end
end

%owner_name combines the owner and Property Name
%assignin fucntion assigns ownername to the corrasponding values so that
%the properly named values may be used as variables
for n = 1:size(owner,2);
    owner_name = [owner{n} '_' noSpacesName{n}];
    assignin('base', owner_name, val(n))
    cells{n}
end

end

