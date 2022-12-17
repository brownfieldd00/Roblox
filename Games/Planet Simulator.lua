core = loadstring(game:HttpGet('https://raw.githubusercontent.com/brownfieldd00/core/main/core.lua'))()
function get()
    for i, v in pairs(workspace.MassObjects:GetDescendants()) do
        if v:FindFirstChild(core:gPlayer().Name .. 'MassTarget') then
            return v:FindFirstChild(core:gPlayer().Name .. 'MassTarget').Hitbox
        end
    end
end
run = run or true
while run do
    local t = get()
    local f = core:gPlayer().Character:FindFirstChild('HumanoidRootPart')
    if t and f then
        firetouchinterest(f, t, 0)
        task.wait(.1)
        firetouchinterest(f, t, 1)
    end
    task.wait(1)
end
