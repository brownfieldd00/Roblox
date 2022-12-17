core = loadstring(game:HttpGet('https://raw.githubusercontent.com/brownfieldd00/core/main/core.lua'))()
local STE = game:GetService('ReplicatedStorage').SetTargetEvent
local UTE = STE.Parent.UnsetTargetEvent
local f
function get()
    f = core:gPlayer().Character:FindFirstChild('HumanoidRootPart')
    local massobjects = workspace.MassObjects:GetChildren()
    for i, massobject in pairs(massobjects) do
        UTE:FireServer()
        task.wait(.3)
        STE:FireServer(massobject)
        task.wait(.3)
        local k = core:gPlayer().Name .. 'MassTarget'
        local masstarget = massobject:FindFirstChild(k)
        if not masstarget then continue end
        if not masstarget:FindFirstChild('Hitbox') then continue end
        pcall(function()
            firetouchinterest(f, masstarget:FindFirstChild('Hitbox'), 0)
            task.wait(.1)
            firetouchinterest(f, masstarget:FindFirstChild('Hitbox'), 1)
        end)
        task.wait(.1)
    end
end
run = run or true
while run do
    get()
    task.wait()
end
