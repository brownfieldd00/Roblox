core = loadstring(game:HttpGet('https://raw.githubusercontent.com/brownfieldd00/core/main/core.lua'))()
core:gModule('UiLibrary'); core:stopRunningInstance(); core:registerSession();
library = library or {}
library.__index = library
run = run or true
localScript = coroutine.wrap(function()
    local should = false
    local window = library:AddWindow('Go Back On Death GUI | github.com/brownfieldd00')
    local tab = window:AddTab('Toggle')
    local switch = tab:AddSwitch('Go back on death', function(state)
        should = state
    end)
    local player = core:gPlayer()
    local last = player.Character.HumanoidRootPart.CFrame
    local event = player.CharacterAdded:Connect(function(char)
        if should then
            -- char:WaitForChild('HumanoidRootPart').CFrame = last
            -- temporary fix. might revert.
            core:cTween(char:WaitForChild('HumanoidRootPart'), {
                CFrame = last
            }, 2)
        end
    end)
    while run do
        task.wait(.5)
        local hrp = player.Character:FindFirstChild('HumanoidRootPart')
        if hrp then
            last = hrp.CFrame
        end
    end
    event:Disconnect()
end)()