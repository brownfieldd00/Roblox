--!nolint DeprecatedGlobal
--!nolint BuiltinGlobalWrite
getgenv = getgenv or getfenv
local meta = {}
meta.__index = function(self, key)
	return game:GetService(key)
end
Game = setmetatable({} , meta)
getgenv().Game = Game
return Game