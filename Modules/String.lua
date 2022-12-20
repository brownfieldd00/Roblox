local String = {}
String.__index = getgenv().string
String.__newindex = function() error("String is read-only") end
String.__tostring = function(self) return self.Value end

function String.new(value)
    local self = setmetatable({}, String)
    self.Value = value
    return self
end
function String.startsWith(str, start)
    return str:sub(1, #start) == start
end

return String