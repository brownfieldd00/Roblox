Webhook = {}
Webhook.HttpService = game:GetService("HttpService")
function Webhook.new(url)
    local webhook = {}
    webhook.url = url
    function webhook:send(content)
        return Webhook.HttpService:PostAsync(self.url, Webhook.HTTPService:JSONEncode({content = content}))
    end
    return webhook
end