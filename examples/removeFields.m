function out = removeFields(structure, desiredFields)
    
    fields = fieldnames(structure.elements);
    out = struct();

    for i = 1:length(desiredFields)
        for j = 1:length(fields)
            if strcmp(desiredFields(i), string(fields(j)))
                out = setfield(out,desiredFields(i), structure.elements.(desiredFields(i)));
            end
        end
    end
    
end
