-- https://www.roblox.com/games/9292879820/Grass-Cutting-Incremental
core = loadstring(game:HttpGet('https://raw.githubusercontent.com/brownfieldd00/core/main/core.lua'))()
core:gModule('UiLibrary'); local antiAfk = core:gModule('AntiAfk');  Settings = core:gModule('Settings')
core:stopRunningInstance(); core:registerSession();
local MainWindow = library:AddWindow('Grass Cutting Incr. GUI - github.com/brownfieldd00')
local MainTab = MainWindow:AddTab('Automation')
local function getgrass()
    local list = {}
    for i, v in pairs(workspace.GrassObjects:GetChildren()) do
        if v and v.Identifier.Value ~= 'magic' then
            table.insert(list, v)
        end
    end
    return list
end
local function getClosestGrass()
    local function closest(list)
        local char = core:gPlayer().Character.HumanoidRootPart.Position
        local closestPart = char
        local closestDist = math.huge
        for i, v in pairs(list) do
            if (char - v.Position).Magnitude < closestDist then
                closestPart = v
            end
        end
        return closestPart
    end
    return closest(getgrass())
end

Settings:set('auto_collect', false)
MainTab:AddLabel('Very unstable. Will break if you walk. lmfao')
local CollectSwitch = MainTab:AddSwitch('Auto Collect', function(state)
    Settings:set('auto_collect', state)
end)
MainTab:AddLabel('More features will be added in the future')
MainTab:AddLabel('Contact KXWISH#7254 for suggestions')


run = run or true
localScript = coroutine.wrap(function()
    while run do
        task.wait()
        if Settings:get('auto_collect') then
            core:gPlayer().Character.Humanoid:MoveTo(getClosestGrass().Position)
            core:gPlayer().Character.Humanoid.MoveToFinished:Wait()
        end
    end
end)()