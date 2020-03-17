classdef Utils
  properties
    basePath
  end
  methods(Static)
    function out = wrapObj(objList, type)
      % Wrap a list of  object struct(s). This function is added to counter the two Matlab's jsonecode/decode behavior 1) It drops " [] " when the list of value only has one element. 2) If the key name starts with an " _ ", it prepends an " x " as in "x_"

      jsonString = jsonencode(objList);
      jsonString = strrep(jsonString, '"x_', '"_');
      objects = sprintf('{"%s":%s}', type, jsonString);
      out = objects
    end

    function ret = getObjStruct(objList, type)
        ret = jsondecode(wrapObj(objList, type));
    end

    function out = getIdList(ids, type)
      objIds = {};

      for i = 1:length(ids)
        objIds{i,1} = struct('id', ids(i));
      end

      out = Utils.wrapObj(objIds, type);
    end

    function ret = getIdsStruct(idList, type)
        ret = jsondecode(getIdList(idList, type));
    end

  end
end

function out = getIdList(ids, type)
  objIds = {};

  for i = 1:length(ids)
    objIds{i,1} = struct('id', ids(i));
  end

  out = Utils.wrapObj(ids, type);
end

function out = wrapObj(objList, type)
  % Wrap a list of  object struct(s). This function is added to counter the two Matlab's jsonecode/decode behavior 1) It drops " [] " when the list of value only has one element. 2) If the key name starts with an " _ ", it prepends an " x " as in "x_"

  jsonString = jsonencode(objList);
  jsonString = strrep(jsonString, '"x_', '"_');
  objects = sprintf('{"%s":%s}', type, jsonString);
  out = objects;
end