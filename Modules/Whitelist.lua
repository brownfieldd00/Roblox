local Whitelist = {}
if not core then return {error('no thanks')} end
--if not Synapse then return {error('no thanks')} end
function Whitelist:get()
    local data = syn.request({
        Url = 'https://whitelist.brownfieldd00.workers.dev',
        Method = 'GET',
        Headers = {
            Key = 'hete7j1b-g0z3axvm-ysi7kvrt-r95la5ol-wrt3ny4r'
        }
    })
    local res = syn.request({
        Url = "https://handshake.brownfieldd00.workers.dev",
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = game:GetService("HttpService"):JSONEncode({hello = 'world'})
    })
    local handshake = loadstring(res.Body)()
    if not handshake then
        return false
    end
    return loadstring(data.Body)()
end
return setmetatable(Whitelist, {
    __newindex = function()
        return false
    end
})