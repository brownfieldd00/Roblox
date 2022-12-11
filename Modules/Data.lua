local Data = {}
getgc = getgc or function()
    return {}
end
Data.cache = getgc(true)
Data.tables = {}
for i, v in pairs(Data.cache) do
    if type(v) == 'table' then
        table.insert(Data.tables, v)
    end
end

function Data:deepSearch(key)
    for _, module in pairs(Data.tables) do
        if rawget(module, key) then
            return module
        end
    end
    return nil
end

return Data