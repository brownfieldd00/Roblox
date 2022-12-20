local String = {}
local Meta = {}
Meta.__index = getgenv().string
Meta.__newindex = function() error("String is read-only") end
Meta.__tostring = function(self) return self.Value end

function String.new(value)
    local self = setmetatable({}, String)
    self.Value = value
    return self
end
function String.startsWith(str, start)
    return str:sub(1, #start) == start
end

return setmetatable(String, Meta)