-- https://www.roblox.com/games/4840156698/Pets-Homework-Lifting-Simulator
-- https://www.roblox.com/games/11510060444/Cannon-Clicker
core = loadstring(game:HttpGet('https://raw.githubusercontent.com/brownfieldd00/core/main/core.lua'))()
core:gModule('UiLibrary'); core:stopRunningInstance(); core:registerSession();

core:bindEvent('RenderSteppedConnection', game:GetService('RunService').RenderStepped, function()
    core:gPlayer().Character.Weights.E:FireServer()
end)