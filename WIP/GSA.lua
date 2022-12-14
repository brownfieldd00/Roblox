util = loadstring(game:HttpGet('https://raw.githubusercontent.com/brownfieldd00/unwrapper/main/source.lua'))()
p2 = util:loadModuleFromGC({'DblTokenPass', 'Level', 'Tokens'})
weapons = util:loadModuleFromGC({'DEFAULT_WEAPON', 'EVENT_WPN_COST', 'Labels'})
weapon_inventory_controller = util:loadModuleFromGC({'Start', 'Init', 'MaxUpgradePressed', 'RefreshItemCount'})
local_tech_box = util:loadModuleFromGC({'Disable', 'Enable', 'OnStep', 'SetVisible', 'PlayBurstEmitter'})
player_controller = util:loadModuleFromGC({'Start', 'Init', 'OnInitDeath', 'OnRespawn', 'LoadAnimations'})
hud_controller = util:loadModuleFromGC({'Init', 'Start', 'RefreshPlayerTitleSettings', 'Friends', 'GetCurrentEventCurrency', 'OnConfirmSellPromptAccept'})
for i, v in pairs(weapons) do
    print(i, v)
end