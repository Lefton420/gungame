function CheckRoundStart()
    local playerCount = #player.GetAll()
    if gungame.round.state == false and playerCount >= gungame.round.players then
        WaitingPeriod()
    else
        return
    end
end

-- This is used to handle when players disconnect
function CheckRoundEnd(flag)
    local playerCount = #player.GetAll()
    if playerCount <= gungame.round.players then
        EndRound(false)
        return true
    else
        return false
    end
end

function WaitingPeriod()
    gungame.round.state = true
    PlayerPvp(false)
    ServerMsg("Game will be starting in " .. gungame.round.timebetween .. " seconds!")
    StartCountdown(gungame.round.timebetween )
    timer.Simple(gungame.round.timebetween, StartRound)
end

function StartRound()
    if CheckRoundEnd() == false then
        ServerMsg("Round starting!")
        ResetWeaponIndex()
        PlayerPvp(true)
        StartCountdown(gungame.round.time)

        for _, ply in pairs(player.GetAll()) do
            ply:StripWeapons()
            ply:Give(CurrentGun(ply))
            ply:Spawn()
            ply:Freeze(true)
        end

        -- Unfreeze player after 5 seconds
        timer.Simple(5, function()
            for _, ply in pairs(player.GetAll()) do
                ply:Freeze(false)
            end
        end)

        -- Set up the timer for round end
        local v = true
        timer.Create("RoundTimer", gungame.round.time, 1, function() EndRound(v) end)
    else
        return
    end
end

-- Returns true or false if game should restart
function EndRound(restart)
    ServerMsg("Round ended!")
    gungame.round.state = false
    PlayerPvp(false)

    for _, ply in pairs(player.GetAll()) do
        ply:StripWeapons()
    end

    if restart == true then
        ServerMsg("Round will be restaring soon!")
        StartCountdown(gungame.round.timebetween )
    	timer.Simple(gungame.round.timebetween, StartRound)
    elseif restart == false then
        ServerMsg("Round will not restart! ... Not enough Players!")
        timer.Remove("RoundTimer")
    end
end

hook.Add("PlayerDisconnected", "CheckRoundEndHook", CheckRoundEnd)
hook.Add("PlayerInitialSpawn", "CheckRoundStartHook", CheckRoundStart)