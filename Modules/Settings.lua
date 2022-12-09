--!nolint DeprecatedGlobal
--!nolint BuiltinGlobalWrite
local Settings = {}
Settings.List = {}
function Settings:get(key)
	return Settings.List[key]
end
function Settings:set(key, value)
	Settings.List[key] = value
	return true	
end
function Settings:default(list)
    for _, key in pairs(list) do
        Settings:set(key, false)
    end
    return true
end
return Settings