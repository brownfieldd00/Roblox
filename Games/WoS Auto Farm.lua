repeat task.wait() until game:IsLoaded()
task.wait(5)
local Player = game:GetService('Players').LocalPlayer
firesignal(Player.PlayerGui.MainMenu.MainMenuFrame.ButtonsFrame.EnterGame.MouseButton1Click, {})
task.wait(2)
local function getSpells()
    local lp = Player.Character.HumanoidRootPart
    local spellBooks = {}
    local ori = lp.CFrame
    for i, v in next, workspace:GetDescendants() do
        if v:IsA('MeshPart') and v:FindFirstChild('ProximityPrompt') and v.ProximityPrompt:FindFirstChild('SpellbookScript') then
            task.wait()
            lp.CFrame = v.CFrame
            task.wait(.5)
            fireproximityprompt(v.ProximityPrompt, 7)
            task.wait(.2)
        end
    end
    lp.CFrame = ori
    task.wait(.2)
    return true
end

getSpells()
task.wait(2)
syn.queue_on_teleport('loadstring(game:HttpGet(""))()')
game:GetService('TeleportService'):Teleport(game.PlaceId, Player)