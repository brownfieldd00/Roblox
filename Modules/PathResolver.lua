local PathResolver = {}
PathResolver.__index = PathResolver

function PathResolver:resolvePath(path)
    local resolve = function(current_path, current_in_path)
		if current_path == nil and current_in_path == 'game' then
			return game
		elseif current_path == game then
			return game:GetService(current_in_path)
		else
			if not current_path:FindFirstChild(current_in_path) then
				return nil
			else
				return current_path[current_in_path]
			end
		end
	end
	local current;
	for _, inside_path in pairs(path:split('.')) do
		current = resolve(current, inside_path)
		if current == nil then
			break
		end
	end
    return current
end
return PathResolver