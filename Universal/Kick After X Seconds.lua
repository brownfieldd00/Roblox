local until_number = 18 * 60;
local whitelist = {
    'username',
    'another username'
}
local function isWhitelisted(p)
    local status = false
    for i, v in pairs(whitelist) do
        if v == p.Name then
            status = true
            break
        end
    end
    return status
end
coroutine.wrap(function()
    task.wait(until_number);
    local player = game:GetService('Players').LocalPlayer
    if not isWhitelisted(player) then
        player:Kick('Long enough.');
    end
end)();