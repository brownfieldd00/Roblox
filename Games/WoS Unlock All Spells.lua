local Player = game:GetService('Players').LocalPlayer
local lp = Player.Character.HumanoidRootPart
local ori = lp.CFrame
for i, v in next, workspace:GetDescendants() do
    if v:IsA('MeshPart') and v:FindFirstChild('ProximityPrompt') and v.ProximityPrompt:FindFirstChild('SpellbookScript') then
        task.wait()
        Player.Character.HumanoidRootPart.CFrame = v.CFrame
        task.wait(.6)
        fireproximityprompt(v.ProximityPrompt, 7)
        task.wait(1)
    end
end
lp.CFrame = ori