local Tables = {}
getgc = getgc or function()
    return {}
end
Tables.cache = getgc(true)
Tables.tables = {}
for i, v in pairs(Tables.cache) do
    if type(v) == 'table' then
        table.insert(Tables.tables, v)
    end
end

function Tables:deepSearch(key)
    for _, module in pairs(self.tables) do
        if rawget(module, key) then
            return module
        end
    end
    return nil
end

return Tables