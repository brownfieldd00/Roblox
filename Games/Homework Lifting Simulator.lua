-- https://www.roblox.com/games/4840156698/Pets-Homework-Lifting-Simulator
game:GetService('RunService').RenderStepped:Connect(function()
    pcall(function()
       game.Players.LocalPlayer.Character.Weights.E:FireServer()
       game.Players.LocalPlayer.Character.Weights.E:FireServer()
    end) 
end)