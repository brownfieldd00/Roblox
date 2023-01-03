-- https://www.roblox.com/games/9811932338
local p = game:GetService('Players').LocalPlayer
local ori = p.Character.HumanoidRootPart.CFrame
for i, v in next, workspace.FastTravelLocations["The Floo Network"]:GetChildren() do
    p.Character.HumanoidRootPart.CFrame = v.CFrame
    task.wait(.5)
    fireproximityprompt(v.ProximityPrompt, 7)
    task.wait(.2)
end
p.Character.HumanoidRootPart.CFrame = ori