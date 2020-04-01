function postImagefromURL(username, basePath, project, ref, name1, name2, picUrl1,picUrl2,desiredFields)
    
    login(username, basePath);
    
    pic1 = strcat('<img src="',picUrl1,'" />');
    pic2 = strcat('<img src="',picUrl2,'" />');
    
    s = struct('id','_hidden_MMS_1529082050667_32fffb1e-e0e4-40da-9e74-2f586f711818_pei','type','InstanceSpecification','name',name1,'documentation', pic1);
    t = struct('id','_hidden_MMS_1529358324856_8442b90f-4e70-4359-be1e-ff6eef6e2259_pei','type','InstanceSpecification','name',name2,'documentation', pic2);
    
    posted = MMS.ElementApi.post_elements(project,ref,[s,t]);
end