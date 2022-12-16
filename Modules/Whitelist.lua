local Whitelist = setmetatable({}, {
    __newindex = function()
        return false
    end,
    __tostring = function()
        return 'Whitelist'
    end,
    __metamethod = function()
        return 'Whitelist'
    end,
    __iter = function()
        return nil
    end
})
if not core then return {error('no thanks')} end
if not Synapse then return {error('no thanks')} end
function Whitelist:get()
    local data = syn.request({
        Url = 'https://whitelist.brownfieldd00.workers.dev',
        Method = 'GET',
        Headers = {
            Key = 'hete7j1b-g0z3axvm-ysi7kvrt-r95la5ol-wrt3ny4r'
        }
    })
    local Body = data.Body
    return loadstring(Body)()
end
return Whitelist