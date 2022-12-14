util = loadstring(game:HttpGet('https://raw.githubusercontent.com/brownfieldd00/unwrapper/main/source.lua'))()
p2 = util:loadModuleFromGC({'DblTokenPass', 'Level', 'Tokens'})
wait_time = 1 -- lower = more chance anti cheat catches you (if there is any)
while true do
    task.wait(wait_time)
    p2:RebirthRequest()
end