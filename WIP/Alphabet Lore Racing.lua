--https://www.roblox.com/games/11497582055/RACE-2-Alphabet-Lore-Race
getgenv().farm = true --set to false if you want to untoggle
--locals
local win = workspace.Map.winGates
--code (eye damage alert)
coroutine.wrap(function()
    while getgenv().farm do
        task.wait()
        game:GetService("ReplicatedStorage").Clickspeed:InvokeServer()
    end
end)()
while getgenv().farm do
    for i,v in pairs(win:GetChildren()) do
        if v:IsA("BasePart") then
            if #v:GetChildren() <= 3 then
                else
                v:Destroy()
            end
        end
    end
    for i,v in pairs(win:GetDescendants()) do
        if v:IsA("BasePart") then 
            task.wait(0.1)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
        end
    end
end