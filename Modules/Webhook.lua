Webhook = {}
Webhook.__index = Webhook
Webhook.HttpService = game:GetService("HttpService")
function Webhook.new(url)
    local webhook = {}
    webhook.__index = webhook
    webhook.url = url
    function webhook:send(content)
        return Webhook.HttpService:PostAsync(self.url, Webhook.HTTPService:JSONEncode({content = content}))
    end
    return webhook
end