Synapse = {}
Synapse.__index = Synapse

function Synapse:checkExploit()
    if not fireproximityprompt or not firesignal then
        core:gPlayer():Kick('Unsupported exploit.')
        return false
    else
        return true
    end
end

function Synapse:request(url)
    local request = {}
    request.url = url
    function request:setMethod(m)
        self.method = m
    end
    function request:setHeader(name, value)
        rawset(self.headers, name, value)
    end
    function request:send()
        local data = syn.request({
            Url = self.url,
            Method = self.method,
            Headers = self.headers
        })
        return data.Body or ''
    end
    return request
end

return Synapse