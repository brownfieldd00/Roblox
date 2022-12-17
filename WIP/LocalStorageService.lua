local LocalStorageService = {}
local OldNameCall = nil
LocalStorageService._keys = {}

function LocalStorageService:SetKey(key, value)
    self._keys[key] = value
    return true
end
function LocalStorageService:GetKey(key)
    return self._keys[key]
end

OldNameCall = hookmetamethod(game, "__namecall", function(Self, ...)
    local Args = {...}
    local NamecallMethod = getnamecallmethod()

    if Self == game and NamecallMethod == "GetService" and Args[1] == "LocalStorageService" then
        return LocalStorageService
    end

    return OldNameCall(Self, ...)
end)