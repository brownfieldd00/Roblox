--!nolint DeprecatedGlobal
--!nolint BuiltinGlobalWrite
local meta = {}
meta.__index = function(self, key)
	return game:GetService(key)
end
Game = setmetatable({} , meta)
getgenv().Game = Game
return Game