-- https://www.roblox.com/games/4522347649/FREE-ADMIN
core = loadstring(game:HttpGet('https://raw.githubusercontent.com/brownfieldd00/core/main/core.lua'))()
core:gModule('UiLibrary'); core:stopRunningInstance(); core:registerSession();
-- Compatibility
library = library or {}
fireclickdetector = fireclickdetector or function()
    core:gPlayer():Kick('Unsupported executor.')
    return
end
local MainWindow = library:AddWindow('[FREE ADMIN] GUI - github.com/brownfieldd00')
local MainTab = MainWindow:AddTab('Cool stuff')
local Button1 = MainTab:AddButton('spawn all gears (slow down server)', function()
    for i, v in pairs(workspace:GetDescendants()) do
        if v:IsA('ClickDetector') and v.Parent:FindFirstChildOfClass('NumberValue') then
            fireclickdetector(v, 3)
        end
    end
end)