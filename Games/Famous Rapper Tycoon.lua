-- https://www.roblox.com/games/11596351062/prove-mom-wrong-by-being-a-famous-rapper-tycoon
util = loadstring(game:HttpGet('https://raw.githubusercontent.com/brownfieldd00/unwrapper/main/source.lua'))()
if getgenv()['11596351062'] then getgenv()['11596351062'].stop() end
util:loadUiLibrary()
local Tycoons = util:Get('Workspace').Tycoons
local NPCs = util:Get('Workspace').NPCS
local function getClientTycoon()
    for i, v in pairs(Tycoons:GetChildren()) do
        if v:FindFirstChild('TycoonOwner') then
            if v:FindFirstChild('TycoonOwner').Value == util:getLocalPlayer().Name then
                return v
            end
        end
    end
end
local function getNPCs()
    local list = {}
    for i, v in pairs(NPCs:GetChildren()) do
        if v:IsA('Model') then
            table.insert(list, v)
        end
    end
    return list
end
local function interactWorkers()
    local tycoon = getClientTycoon()
    local items = tycoon.Items:GetDescendants()
    for i, item in pairs(items) do
        if item:IsA('ProximityPrompt') then
            fireproximityprompt(item)
        end
    end
    return true
end
Game, Settings = util:loadModule('Game'), util:loadModule('Settings')
local CDs = util:Get('ReplicatedStorage').Events.CDs
Settings:default({'auto_record', 'auto_sell', 'auto_collect', 'auto_interact'})
local set = {}
local run = true
function set.stop()
    run = false
end

local MainWindow = library:AddWindow('Famous Rapper Tycoon GUI - github.com/brownfieldd00')
local MainTab = MainWindow:AddTab('Auto Settings')
local AutoCD = MainTab:AddSwitch('Auto record CDS', function(state)
    Settings:set('auto_record', state)
    return true 
end)
local AutoSell = MainTab:AddSwitch('Auto sell CDS', function(state)
    Settings:set('auto_sell', state)
    return true 
end)
local AutoCollect = MainTab:AddSwitch('Auto collect CDS', function(state)
    Settings:set('auto_collect', state)
    return true 
end)
local AutoInteract = MainTab:AddSwitch('Auto interact with worker', function(state)
    Settings:set('auto_interact', state)
    return true 
end)

getgenv()['11596351062'] = set
localScript = coroutine.wrap(function()
    local long = 0
    local cycle = 0
    while run == true do
        task.wait(); cycle = cycle + 1; long = long + 1;
        if Settings:get('auto_record') == true and cycle == 1 then 
            util:fire(CDs, util:getLocalPlayer())
        end
        if Settings:get('auto_sell') == true and cycle == 50 then
            for i, v in pairs(getNPCs()) do
                fireproximityprompt(v.Torso.ProximityPrompt, math.random(1, 8))
            end
        end
        if Settings:get('auto_collect') and cycle == 75 then
            for i, v in pairs(getClientTycoon().StaticItems.CDCollect:GetDescendants()) do
                if v:IsA('ProximityPrompt') then
                    fireproximityprompt(v, math.random(1, 8))
                end
            end
        end
        if Settings:get('auto_interact') and cycle == 100 then
            interactWorkers()
        end
        if cycle >= 100 then cycle = 0 end
        if long >= 1000 then long = 0 end
    end
end)()