function UpdateName(username, basePath, project, ref, id1, id2, newName1, newName2, desiredFields)
    
    %------------------------------------------------------
    %Description: Update name of an element
    %
    %input Args
    %username(str): JPL username
    %password(str): JPL password (enter in text box)
    %basePath(str): mms.org
    %project(str): project ID
    %ref(str): ref ID
    %id(str): element ID
    %content(str): documentation 
    %desiredFields(str array): fields to update["id"
    %"name"]
    %------------------------------------------------------
    Login(username, basePath);
   
    json1 = ElementApi.get_element(project, ref, id1);
    json2 = ElementApi.get_element(project, ref, id2);
    
    out1 = removeFields(json1, desiredFields);
    out2 = removeFields(json2, desiredFields);
    
    out1 = setfield(out1,'name', newName1);
    out2 = setfield(out2,'name', newName2);
    
    posted = ElementApi.post_elements(project, ref, [out1,out2])
end