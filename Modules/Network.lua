Network = {}
Network.HS = game:GetService('HttpService')
Network.__index = Network
function Network:get(url)
    return self.HS:GetAsync(url, true)
end
function Network:post(url, body)
    return self.HS:PostAsync(url, self.HS:JSONEncode(body))
end
Network.cachedInstances = getinstances()
function Network:getRemoteEvent(name, parent, cache)
    local cache = cache or true
    local location
    if cache == true then
        location = self.cachedInstances
    else
        location = getinstances()
    end
    for i, v in pairs(location) do
        if parent and v.Parent ~= parent then
            continue
        end
        if v.Name == name then
            return v
        else
            return nil
        end
    end
end
function Network:sniff(state)
    if state == true then
        Remote2Spy = core:gModule('Remote2Spy')
    end
end
return Network