function [posted]= MMSViewWrite(server, workspaceName, site, ViewID, snapshot, ElementTriples)
%format for ElementTriples: 
%{{'owner1', PropertyName1','value1'},{'ownerN','PropertyNameN', 'ValueN'}}

thatcounter = 1;
thiscounter = 1;
counter = 1;
thecount = 1;

[user,password] = GetAuthentication ();
options = weboptions('Username',user,'Password',password, 'ContentType', 'json');
options_2 = weboptions('Username',user,'Password',password, 'ContentType', 'text');

%url webreads the viewID provided and dispele shows the displayedElements ID's

    url = webread([server '/' 'alfresco/service/workspaces' '/' workspaceName '/' 'sites' '/' site '/' 'elements' '/' ViewID '?time=' snapshot],options);
    viewSpecs = jump(url);
    dispele = viewSpecs.displayedElements;
    
    %url3 webreads each displayedElements ID's and testvalue goes into the
    %specialization
    for k = 1:size(dispele);
        url2 = webread([server '/' 'alfresco/service/workspaces' '/' workspaceName '/' 'sites' '/' site '/' 'elements' '/' dispele{k}],options);
        url2_2 = webread([server '/' 'alfresco/service/workspaces' '/' workspaceName '/' 'sites' '/' site '/' 'elements' '/' dispele{k}],options_2);
        testvalue = url2.elements.specialization;
        
            %tests for the structure field 'value', if it is present then
            %'yes' pulls each displayedElement's JSON and stores it in a 
            %findname finds the value's name
            if isfield(testvalue, 'value');
                dispeleVAL = url2;
                dispeleVALstr = url2_2;
                storedSTRUCT(thiscounter) = {dispeleVAL};
                storedSTRING(thatcounter) = {dispeleVALstr};
                thatcounter = thatcounter + 1;
                thiscounter = thiscounter + 1;
                findname = testvalue.propertyType;
                url3 = webread([server '/' 'alfresco/service/workspaces' '/' workspaceName '/' 'sites' '/' site '/' 'elements' '/' findname],options);
                names = url3.elements.name;
                stringname(counter) = cellstr(names)';
                counter = counter + 1;
                noSpacesName = ProperName(stringname);
                findOwner = dispeleVAL.elements.owner;
                
                %tests for the structure name 'double' if present will test for the field 'name', if present will find the owner's name for the value  
                url4 = webread([server '/' 'alfresco/service/workspaces' '/' workspaceName '/' 'sites' '/' site '/' 'elements' '/' findOwner],options);
                found = url4.elements.name;
                owner(thecount) = cellstr(found);
                thecount = thecount + 1;
                            %creates a 1xNumberOfValues cell array in the
                            %format: Owner, Property Name, Value 
             end
    end
    
%'owner_PropName' creates char arrays of the owner_PropertyName
%'ownername' stores the char arrays in a cell array

countess = 1;
for n = 1:size(owner,2);
    owner_PropName = [owner{n} '_' noSpacesName{n}];
    ownername{countess} = [owner_PropName];
    countess = countess +1;
end

%'ownername's are defined by their 'storedJSON'
dictionary = containers.Map(ownername, storedSTRUCT);
storage = containers.Map(ownername, storedSTRING)'

for i = 1:size(ElementTriples,2)
    rename = cellstr([ElementTriples{1,i}{1,1} '_' ElementTriples{1,i}{1,2}])
    str2change = storage(rename{1})
    structVal = dictionary(rename{1})
    doubleVal = num2str(structVal.elements.specialization.value.double)
    oldValue = ['"double": ' doubleVal]
    newValue = ['"double": ' ElementTriples{1,i}{1,3}]
    FixedString = strrep(str2change, oldValue, newValue)
    urlpost = [server '/' 'alfresco/service/workspaces' '/' workspaceName '/' 'sites' '/' site '/' 'elements']
    options = weboptions('Username',user,'Password',password,'MediaType','application/json')
    posted = webwrite(urlpost,FixedString,options)
end

end
