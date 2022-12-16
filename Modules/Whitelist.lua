local Whitelist = {}
Whitelist.code = ''
if not core then return {error('no thanks')} end
--if not Synapse then return {error('no thanks')} end
function Whitelist:get()
    local data = syn.request({
        Url = 'https://whitelist.brownfieldd00.workers.dev',
        Method = 'GET',
        Headers = {Key = self.code}
    })
    return loadstring(data.Body)()
end
function Whitelist:setCode(newCode)
    self.code = newCode
    return true
end
return setmetatable(Whitelist, {
    __newindex = function()
        return false
    end
})