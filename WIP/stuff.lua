_env = {}

function store(t)
	local addr, data = t[1], t[2] or 0
	_env[addr] = data
	return true
end
function fetch(t)
	return _env[t[1]] or t[2]
end
function add(t)
	local addr, inc = t[1], t[2] or 0
	if _env[addr] and typeof(addr) == 'number' and typeof(inc) == 'number' then
		_env[addr] = _env[addr] + inc
		return true
	end
	return false
end
function set(t)
	local a, k ,v = t[1], t[2], t[3]
	if a and typeof(a) == 'number' then
		a = _env[a]
	end
	a[k] = v
	return true
end

store	{ 1, {} }
set		{ 1, '__index', game }
set		{ 1, '_test', {} }

a = fetch { 1 }
set({a._test, 'v', true})
print(fetch {1}._test.v)


print(a)
