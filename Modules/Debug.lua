local Debug = {}
local meta = {}
Debug.State = false
meta.__index = function(self, key)
	if not self.State then return 0 end
	if key:sub(1, #'set') == key then
		return function(sself, value)
			self[key:sub(4)] = value
			return true
		end
	elseif key:sub(1, #'get') == 'stateSet' then
		return rawget(self, key)
	else
		return rawget(self, key)
	end
end

function Debug:get(key)
	if not self.State then return end
	return rawget(self, key)
end

function Debug:ifValue(key, value, cb, ...)
	if not self.State then return end
	if rawget(self, key) == value then
		return cb(...)
	end
	return nil
end

function Debug:print(...)
	if not self.State then return end
	print('{Debug} - ' , ...)
	return true
end
function Debug:stateSet(bool)
	self.State = bool
	return true
end

return setmetatable(Debug, meta)