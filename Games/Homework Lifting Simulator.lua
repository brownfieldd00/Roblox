-- https://www.roblox.com/games/4840156698/Pets-Homework-Lifting-Simulator
util = loadstring(game:HttpGet('https://raw.githubusercontent.com/brownfieldd00/unwrapper/main/source.lua'))()

game:GetService('RunService').RenderStepped:Connect(function()
    util:executeNow(function() game:GetService('Players').LocalPlayer.Character.Weights.E:FireServer() end)
end)