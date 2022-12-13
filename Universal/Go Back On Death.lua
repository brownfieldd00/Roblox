core = loadstring(game:HttpGet('https://raw.githubusercontent.com/brownfieldd00/core/main/core.lua'))()
core:gModule('UiLibrary'); core:stopRunningInstance(); core:registerSession();
library = library or {}
library.__index = library
run = run or true
dead = false
localScript = coroutine.wrap(function()
    local should = false
    local window = library:AddWindow('Go Back On Death GUI | github.com/brownfieldd00')
    local tab = window:AddTab('Toggle')
    local switch = tab:AddSwitch('Go back on death', function(state)
        should = state
    end)
    local should_anchor = false
    local should_tween = false
    local anchorSwitch = tab:AddSwitch('Anchor after teleport', function(state)
        should_anchor = state
    end)
    local tweenSwitch = tab:AddSwitch('Use Tween (bypass some ACs)', function(state)
        should_tween = state
    end)
    local player = core:gPlayer()
    local last = player.Character.HumanoidRootPart.CFrame
    local event = player.CharacterAdded:Connect(function(char)
        local Humanoid = char:WaitForChild('Humanoid')
        local HRP = char:WaitForChild('HumanoidRootPart')
        dead = false
        Humanoid.Died:Connect(function()
            dead = true
        end)
        if should then
            if should_tween then
                core:cTween(HRP, {
                    CFrame = last
                }, 2)
            else
                HRP.CFrame = last
            end
            if should_anchor then
                HRP.Anchored = true
                task.wait(4)
                HRP.Anchored = false
            end
        end
    end)
    while run do
        task.wait(.5)
        local hrp = player.Character:FindFirstChild('HumanoidRootPart')
        if hrp and not dead then
            last = hrp.CFrame
        end
    end
    event:Disconnect()
end)()