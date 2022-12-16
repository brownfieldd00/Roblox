core = loadstring(game:HttpGet('https://raw.githubusercontent.com/brownfieldd00/core/main/core.lua'))()
-- Whitelist: ./Modules/Whitelist.lua
Whitelist = core:gModule('Whitelist')
Whitelist:get()
a = brown:identifySynapseUser()
print(a)