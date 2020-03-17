function UpdateDocumentation(username, basePath, project, ref, id1, id2, content1, content2, desiredFields)
    %------------------------------------------------------
    %Description: Update documentation of a presentation
    %             element.
    %
    %input Args
    %username(str): JPL username
    %password(str): JPL password (enter in text box)
    %basePath(str): https://mms.org
    %project(str): project ID
    %ref(str): ref ID
    %id(str): element ID
    %content(str): documentation 
    %desiredFields(str array): fields to update ["id"
    %"documentation"]
    %------------------------------------------------------
    
    Login(username, basePath);
   
    json1 = ElementApi.get_element(project, ref, id1);
    json2 = ElementApi.get_element(project, ref, id2);
    
    out1 = removeFields(json1, desiredFields);
    out2 = removeFields(json2, desiredFields);
    
    out1 = setfield(out1,'documentation', content1);
    out2 = setfield(out2,'documentation', content2);
    
    posted = ElementApi.post_elements(project, ref, [out1,out2]);
    
end