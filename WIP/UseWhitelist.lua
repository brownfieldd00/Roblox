core = loadstring(game:HttpGet('https://raw.githubusercontent.com/brownfieldd00/core/main/core.lua'))()
-- Whitelist: ./Modules/Whitelist.lua
Whitelist = core:gModule('Whitelist'):get()

for i, v in pairs(brown) do
    print(i, v)
end