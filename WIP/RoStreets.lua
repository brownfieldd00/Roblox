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

Melee.Parent = Player.Character 

for Data, Model in pairs(game:GetService("Workspace")["Cash_Givers"]:GetChildren()) do 
    if Model:IsA("Model") and Model.Name == "Atm" and Model:FindFirstChild("Health") and not tostring(Model:FindFirstChild("Health").Value):match("-") then 
        util:teleportToLocationPatchA(Model.Open.CFrame + Vector3.new(0, 0, 5))
        repeat task.wait() 
            mouse1click()
        until tostring(Model:FindFirstChild("Health").Value):match("-")
        repeat task.wait()
            CheckCash()
        until not CheckCash() or not Player.Character or not Player.Character:FindFirstChild("HumanoidRootPart")
    end
end 