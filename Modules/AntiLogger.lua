-- Credits where it's due: sufi#1337 | remaster by me obviously. AntiLogger:Hook() is the actual part sufi made. only added a check
local AntiLogger = {}
AntiLogger.Delete = false
AntiLogger.State = false
local localPlayer = game:GetService'Players'.LocalPlayer
request = http_request or request or HttpPost or syn.request or http.request
local filename = string.format('log %s %s', localPlayer.UserId, tick()..'.txt')
AntiLogger.Hook = nil
function AntiLogger:setShouldDeleteWebhook(state)
    self.Delete = state
    return true
end
function AntiLogger:Hook()
    local oldreq
    oldreq = hookfunction(request, function(data)
        if self.State then
            if string.find(tostring(string.lower(data.Url)), 'webhooks') or string.find(tostring(string.lower(data.Url), 'websec')) then
                rconsolename('Made by sufi#1337')
                rconsoleprint('@@RED@@')
                rconsoleprint(('Webhook blocked from firing. WebHook: %s'):format(data.Url..'\n'))
                rconsoleprint(('Method: %s'):format(data.Method..'\n'))
                if data.Body then rconsoleprint(('Data Sent: %s'):format(data.Body..'\n')) else rconsoleprint('Data Sent: NaN') end
                rconsoleprint('@@YELLOW@@')
                if DeleteWebhook then
                    rconsoleinfo(('Webhook deleted.\nDump file created as %s'):format(filename))
                    writefile(filename, ('Webhook: %s\nMethod: %s\nData Sent: %s'):format(data.Url, data.Method, data.Body or 'NaN'))
                else
                    rconsoleinfo(('Dump file created as %s'):format(filename))
                    writefile(filename, ('Webhook: %s\nMethod: %s\nData Sent: %s'):format(data.Url, data.Method, data.Body or 'NaN'))
                end
                if DeleteWebhook then
                    data.Method = 'DELETE'
                    return oldreq(data)
                else
                    return
                end
            end
        end
        return self.Hook(data)
    end)
    return oldreq
end
function AntiLogger:SetState(bool)
    self.State = bool
    if self.State and not self.Hook then
        self.Hook = self:Hook() -- actually hook the function for the first time
    end
    return true
end

return AntiLogger