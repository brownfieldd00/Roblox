Synapse = {}
Synapse.__index = Synapse

Synapse.debug = false

function Synapse:setDebugModeEnabled(bool)
    self.debug = bool
    return true
end

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
    if not self.debug then return warn('Debug feature.') and 'Debug mode must be on' end
    local sig = syn.get_comm_channel(k)
    self._signals[k] = sig
    return self._signals[k]
end
function Synapse:createCustomSignal(key)
    if not self.debug then return warn('Debug feature.') and 'Debug mode must be on' end
    return self.Signals:add(key)
end
function Synapse:fireCustomSignal(key)
    if not self.debug then return warn('Debug feature.') and 'Debug mode must be on' end
    if self.Signals._signals[key] then
        self.Signals._signals[key]:Fire()
    else
        return false
    end
end
function Synapse:getThreadIdentity()
    return syn.get_thread_identity()
end
function Synapse:copyClip(inp)
    return setclipboard(tostring(inp))
end
local file = {}
function file.new(path)
    local self = {}
    self.path = path
    function self:writeOverwrite(str)
        writefile(self.path, tostring(str))
        return true
    end
    function self:read()
        if isfile(self.path) then
            return readfile(self.path)
        else
            self:writeOverwrite('')
            return ''
        end
    end
    function self:append(str)
        if isfile(self.path) then
            appendfile(self.path, tostring(str))
            return true
        else
            self:writeOverwrite(tostring(str))
            return true
        end
    end
    return self
end
function Synapse.openFile(path)
    local newFile = file.new(path)
    return newFile
end
return Synapse