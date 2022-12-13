local Table = {}
function Table.hasKey(input_table, key_string)
	if rawget(input_table, key_string) then return true end
	return false
end
function Table.has(input_table, input_value)
	for i, v in pairs(input_table) do
		if v == input_value then
			return true
		end
	end
	return false
end
function Table.append(input_table, input_value)
	table.insert(input_table, input_value)
	return true
end
Table.push = Table.append
function Table.iter(input_table)
	return pairs(input_table)
end
Table.iterate = Table.iter
Table.each = Table.iter
Table.all = Table.iter
function Table.get(input_table, input_key)
	return rawget(input_table, input_key)
end
function Table.new(...)
	local new_table = table.create()
	for i, v in pairs({...}) do
		new_table[i] = v
	end
	return new_table
end
function Table.forEach(input_table, callback_function)
	for i, v in pairs(input_table) do
		callback_function(i, v)
	end
	return true
end
return Table