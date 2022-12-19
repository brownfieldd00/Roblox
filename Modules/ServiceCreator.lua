local Service = {}
local proxy = newproxy(true)
local mt = getmetatable(proxy)

local CreatedServices = {_services={}}
function CreatedServices:add(service)
    self._services[#self + 1] = service
end

function Service:Create(name_string)
    local service = {}
    service.Name = name_string
    CreatedServices:add(service)
    return service
end

OldNameCall = hookmetamethod(game, "__namecall", function(Self, ...)
    local Args = {...}
    local NamecallMethod = getnamecallmethod()

    for i, v in pairs(CreatedServices._services) do
        if Self == game and NamecallMethod == "GetService" and Args[1] == v.Name then
            return v
        end
    end

    return OldNameCall(Self, ...)
end)

return setmetatable(Service, mt)