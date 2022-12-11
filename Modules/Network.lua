Network = {}
Network.HS = game:GetService('HttpService')
Network.__index = Network
function Network:get(url)
    return self.HS:GetAsync(url, true)
end
function Network:post(url, body)
    return self.HS:PostAsync(url, self.HS:JSONEncode(body))
end
return Network