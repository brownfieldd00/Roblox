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
    return loadstring(data.Body)()
end
return setmetatable(Whitelist, {
    __newindex = function()
        return false
    end
})