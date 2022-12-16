local HttpService = game:GetService('HttpService')
local Whitelist = {}
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