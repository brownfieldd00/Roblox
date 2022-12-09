local module = {}
module.defaultState = false
function module.idled()
    game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end
module.connection = nil
function module:setState(bool_state)
    if bool_state == true then
        if module.connection then return end
        module.connection = core:gPlayer().Idled:Connect(module.idled)
    else
        if not module.connection then return end
        module.connection:Disconnect()
    end
end
module:setState(module.defaultState)
return module