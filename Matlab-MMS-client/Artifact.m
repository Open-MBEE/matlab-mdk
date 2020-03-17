classdef Artifact
    properties
    end
    methods(Static)
        function out = construct()
        %% construct
        %% Description: Construct a struct that represents the Artifact model with keys defined and defaults populated.
            out = struct();
            out.id = '';
            out.contentType = '';
            out.checksum = '';
            out.artifactLocation = '';
            out.name = '';
        end
    end
end


