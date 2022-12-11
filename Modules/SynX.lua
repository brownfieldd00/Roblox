Synapse = {}
Synapse.__index = Synapse

function Synapse:checkExploit()
    if not fireproximityprompt or not firesignal then 
        core:gPlayer():Kick('Unsupported exploit.')
        return false
    else
        return true
    end
end

return Synapse