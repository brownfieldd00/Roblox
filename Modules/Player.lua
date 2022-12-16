Player = {}
Player.LocalPlayer = game:GetService('Players').LocalPlayer
Player.NC = game:GetService("NetworkClient")

function Player:getLocalService(service_name)
	return game:GetService(service_name)
end
function Player:getCharacter()
	return self.LocalPlayer.Character or self.LocalPlayer.CharacterAdded:Wait()
end
function Player:getHumanoidRootPart()
	return Player:getCharacter():FindFirstChild('HumanoidRootPart')
end
function Player:getHumanoid(max)
	local max = max or 3
	return self:getCharacter():WaitForChild('Humanoid', max)
end
function Player:setOutgoingKBPS(input_int)
	return self.NC:SetOutgoingKBPSLimit(input_int)
end
function Player:getItemInsidePlayerGuiWithName(input_string)
	for i, v in pairs(self.LocalPlayer.PlayerGui:GetChildren()) do
		if v.Name == input_string then
			return v
		end
	end
	return nil
end
function Player:getBackpackToolWithName(input_string)
	for i, v in pairs(self.LocalPlayer.Backpack:GetChildren()) do
		if v.Name == input_string then
			return v
		end
	end
	return nil
end
function Player:disableLocalScriptFromName(input_string)
	for i, v in pairs(self.LocalPlayer.PlayerGui:GetChildren()) do
		if v:IsA('Script') and v.Name == input_string then
			v.Disabled = true
			return v
		end
	end
	return nil
end
function Player:disableLocalScript(input_script)
	input_script.Disabled = true
	return true
end
function Player:teleportToPosition(input_vector3)
	self:getHumanoidRootPart().CFrame = CFrame.new(input_vector3)
	return true
end
function Player:teleportToCFrame(input_cframe)
	self:getHumanoidRootPart().CFrame = input_cframe
	return true
end
function Player:findPlayerFromName(input_string)
	for i, player in pairs(self.Players:GetPlayers()) do
		if player.Name:lower():sub(1, #input_string) == input_string:lower() then
			return player
		end
	end
	return nil
end
function Player:leaveManually()
	local VIM = game:GetService("VirtualInputManager")
    VIM:SendKeyEvent(true, Enum.KeyCode.Escape, false, nil)
    task.wait(.1)
    VIM:SendKeyEvent(true, Enum.KeyCode.L, false, nil)
    task.wait(.1)
    VIM:SendKeyEvent(true, Enum.KeyCode.Return, false, nil)
end
function Player:leave()
	return game:Shutdown()
end
return Player
