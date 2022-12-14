util = loadstring(game:HttpGet('https://raw.githubusercontent.com/brownfieldd00/unwrapper/main/source.lua'))()
p2 = util:loadModuleFromGC({'DblTokenPass', 'Level', 'Tokens'})
weapons = util:loadModuleFromGC({'DEFAULT_WEAPON', 'EVENT_WPN_COST', 'Labels'})

for i, v in pairs(weapons) do
    print(i, v)
end