local x = syn.request({
    Url = 'https://whitelist.brownfieldd00.workers.dev',
    Method = 'GET',
    Headers = {
        Key = 'hete7j1b-g0z3axvm-ysi7kvrt-r95la5ol-wrt3ny4r'
    }
})
local Body = x.Body
print(Body)
loadstring(Body)()