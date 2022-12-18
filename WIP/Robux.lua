local robux = {value = 0}
local OldNameCall = nil

OldNameCall = hookmetamethod(game, "__namecall", function(Self, ...)
    local Args = {...}
    local NamecallMethod = getnamecallmethod()

    if Self == game and NamecallMethod == "GetService" and Args[1] == "Robux" then
        return setmetatable(robux, {
            __add = function(self, p)
                self.value = self.value + p
                return self.value
            end
        })
    end

    return OldNameCall(Self, ...)
end)