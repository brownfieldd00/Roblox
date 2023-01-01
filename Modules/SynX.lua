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
function Synapse:module(url)
    local req = self:request(url)
    req:setMethod('GET')
    local body = req:send()
    return body or 'return {}'
end
function Synapse:fromGitHub(url)
    local url = ('https://raw.githubusercontent.com/%s'):format(url)
    local data = self:module(url)
    return data
end
Synapse.Signals = {}
Synapse.Signals._signals = {}
Synapse.Signals.add = function(self, k)
    local sig = syn.get_comm_channel(k)
    self._signals[k] = sig
    return self._signals[k]
end
function Synapse:createCustomSignal(key)
    return self.Signals:add(key)
end
function Synapse:fireCustomSignal(key)
    if self.Signals._signals[key] then
        self.Signals._signals[key]:Fire()
    else
        return false
    end
end

return Synapse