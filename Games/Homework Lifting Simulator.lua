-- https://www.roblox.com/games/4840156698/Pets-Homework-Lifting-Simulator
util = loadstring(game:HttpGet('https://raw.githubusercontent.com/brownfieldd00/unwrapper/main/source.lua'))()

game:GetService('RunService').RenderStepped:Connect(function()
    local found = util:getLocalPlayer().Character:FindFirstChild('Weights') or nil
    if found then
        util:fire(found)
    end
end)