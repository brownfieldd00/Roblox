-- https://www.roblox.com/games/5620664339/RoStreets
util = loadstring(game:HttpGet('https://raw.githubusercontent.com/brownfieldd00/unwrapper/main/source.lua'))()

local Player = game:GetService("Players").LocalPlayer
local Melee = Player.Backpack:FindFirstChild("Melee") or Player.Character:FindFirstChild("Melee")

local function CheckCash()
    local FoundCash
    for _,v in pairs(game:GetService("Workspace"):GetChildren()) do 
        if v:IsA("Part") and v.Name == "Money" and v:FindFirstChild("ClickDetector") and (Player.Character:FindFirstChild("HumanoidRootPart").Position - v.Position).Magnitude <= 15 then 
           fireclickdetector(v.ClickDetector)
           FoundCash = true 
        end
    end
    return FoundCash
end
local function getATMs()
    for i, v in pairs(workspace.Cash_Givers:GetChildren()) do
        if v:IsA('Model') and v.Name == 'Atm' and v:FindFirstChild('Health').Value > 0 and v:FindFirstChild('Screen') then
            util:teleportToLocationPatchA(v.Open.CFrame + Vector3.new(0, 10, 0), 0.1)
            Player.Character.Humanoid:MoveTo(v:FindFirstChild('Screen').Position)
            Player.Character.HumanoidRootPart.CFrame = CFrame.lookAt(Player.Character.HumanoidRootPart.Position, v:FindFirstChild('Screen').Position)
            task.wait(1)
            Player.Character.HumanoidRootPart.Anchored = true
            repeat task.wait() 
                mouse1click()
            until v:FindFirstChild('Health').Value <= 0 
            repeat task.wait()
                CheckCash()
            until not CheckCash() or not Player.Character or not Player.Character:FindFirstChild("HumanoidRootPart")
        end
    end
    return true
end
Melee.Parent = Player.Character

while true do
    task.wait()
    getATMs()
end