function [posted]= MMSDocumentWrite(server, workspaceName, site, documentID, snapshot, ElementTriples)
%format for ElementTriples: 
%{{'owner1', PropertyName1','value1'},{'ownerN','PropertyNameN', 'ValueN'}}

%reader reads the MMS webpage and imports the json as a strutcture,
%childView sort the document json down to childViews, the
%childViews ID's lead to displayedElements
url = [server '/' 'alfresco/service/workspaces' '/' workspaceName '/' 'sites' '/' site '/' 'elements' '/' documentID, '?time=' snapshot]

thatcounter = 1;
thiscounter = 1;
counter = 1;
thecount = 1;

[user,password] = GetAuthentication ();
options = weboptions('Username',user,'Password',password, 'ContentType', 'json');
options_2 = weboptions('Username',user,'Password',password, 'ContentType', 'text');
reader = webread(url,options);
childView = struct2cell(reader.elements.specialization.childViews);


%url2 webreads each childView and dispele shows the displayedElements ID's
%so they can later be accessed through webread
for j = 1:size(childView,2);
    url2 = webread([server '/' 'alfresco/service/workspaces' '/' workspaceName '/' 'sites' '/' site '/' 'elements' '/' childView{2,j}],options);
    viewSpecs = jump(url2);
    dispele = viewSpecs.displayedElements;
    
    %url3 webreads each displayedElements ID's and testvalue goes into the
    %specialization so the reoccurring ID's can be sorted out
    for k = 1:size(dispele);
        url3 = webread([server '/' 'alfresco/service/workspaces' '/' workspaceName '/' 'sites' '/' site '/' 'elements' '/' dispele{k}],options);
        url3_2 = webread([server '/' 'alfresco/service/workspaces' '/' workspaceName '/' 'sites' '/' site '/' 'elements' '/' dispele{k}],options_2);
        testvalue = url3.elements.specialization;
        
            %tests for the structure field 'value', if it is present then
            %'yes' pulls each displayedElement's JSON and stores it in a 
            %findname finds the value's name
            if isfield(testvalue, 'value');
                dispeleVAL = url3;
                dispeleVALstr = url3_2;
                storedSTRUCT(thiscounter) = {dispeleVAL};
                storedSTRING(thatcounter) = {dispeleVALstr};
                thatcounter = thatcounter + 1;
                thiscounter = thiscounter + 1;
                findname = testvalue.propertyType;
                url4 = webread([server '/' 'alfresco/service/workspaces' '/' workspaceName '/' 'sites' '/' site '/' 'elements' '/' findname],options);
                names = url4.elements.name;
                stringname(counter) = cellstr(names)';
                counter = counter + 1;
                noSpacesName = ProperName(stringname);
                findOwner = dispeleVAL.elements.owner;
                
                    %tests for the structure name 'double' if present will test for the field 'name', if present will find the owner's name for the value  
                url5 = webread([server '/' 'alfresco/service/workspaces' '/' workspaceName '/' 'sites' '/' site '/' 'elements' '/' findOwner],options);
                found = url5.elements.name;
                owner(thecount) = cellstr(found);
                thecount = thecount + 1;
                            %creates a 1xNumberOfValues cell array in the
                            %format: Owner, Property Name, Value 
             end
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
    %rename mimicks ownername so the container will recognize the names
    rename = cellstr([ElementTriples{1,i}{1,1} '_' ElementTriples{1,i}{1,2}])
    str2change = storage(rename{1})
    structVal = dictionary(rename{1})

    %doubleVal converts the json's double value to a string so that it can
    %later be used in a string replace
    doubleVal = num2str(structVal.elements.specialization.value.double)

    %oldValue and newValue create strings that are specific to the section
    %where the values need to be switched
    oldValue = ['"double": ' doubleVal]
    newValue = ['"double": ' ElementTriples{1,i}{1,3}]
    FixedString = strrep(str2change, oldValue, newValue)
    urlpost = [server '/' 'alfresco/service/workspaces' '/' workspaceName '/' 'sites' '/' site '/' 'elements']
    options = weboptions('Username',user,'Password',password,'MediaType','application/json')
    posted = webwrite(urlpost,FixedString,options)
end

end
