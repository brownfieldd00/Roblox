local bInstance = {}

function bInstance.new(class, parent, properties)
	local properties = properties or {Name = class}
	local instance = Instance.new(class)
	if parent then instance.Parent = parent end
	for property_name, property_value in ipairs(properties) do
		local applySuccess, r = pcall(function()
			instance[property_name] = property_value
			return true
		end)
	end
	return instance
end
function bInstance:isA(typeof_string, anything)
	return (typeof(anything) == typeof_string)
end
function bInstance:isCharacter(instance)
	local result = false
	for i, player in pairs(game:GetService('Players'):GetPlayers()) do
		if player and player.Character then
			if instance:IsDescendantOf(player.Character) then
				result = true
				break
			end
		end
	end
	return result
end
function bInstance:get(properties)
	for _, instance in pairs(getinstances()) do
		local score = 0
		for property, value in pairs(properties) do
			if instance[property] == value then
				score += 1
			end
		end
		if score == #properties then
			return instance
		end
	end
end
return bInstance