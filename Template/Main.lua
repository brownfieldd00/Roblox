local app = {}
app.connections = {}
app.connections._items = setmetatable({}, {
	__newindex = function(self, key, value)
		if key:sub(1, 2) == '__' then return false end
		rawset(self, key, value)
		return true
	end
})
function app.connections:add(new)
	if not (typeof(new) == 'RBXScriptConnection') then return false end
	
	self._items[#self._items + 1] = new
	return true
end
function app:fetch(url)
	if not (typeof(url) == 'string') then return false end
	
	local url = url or 'https://example.com'
	return game:HttpGet(url)
end
function app:bind(signal, callback)
	if not (typeof(signal) == 'RBXScriptSignal') then return false end
	if not (typeof(callback) == 'function') then return false end
	
	local _connection = signal:Connect(callback)
	self.connections:add(_connection)
	return _connection
end
return app
