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
local function hit()
    util:spoof(Player:GetMouse().Button1Down, {x = 0, y = 0})
    task.wait(.1)
    return true
end
--TODO: autofarm lol
