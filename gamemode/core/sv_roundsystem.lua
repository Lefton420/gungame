function CheckRoundStart()
    local playerCount = #player.GetAll()
    if not gungame.round.state and playerCount > 1 then
        WaitingPeriod()
    end
end

-- This weird check is used in StartRound() as extra saftey
function CheckRoundEnd(flag)
    
    local playerCount = #player.GetAll()
    if playerCount < 2 then
        EndRound(false)
        return true
    else
        return false
    end
end

function WaitingPeriod()
    PlayerPvp(false)
    ServerMsg("Game will be starting in "..gungame.round.timebetween.." seconds!")
    StartCountdown(gungame.round.timebetween )
    timer.Simple(gungame.round.timebetween, StartRound)
end

function StartRound()
    
    if CheckRoundEnd() == false then
        ServerMsg("Round starting!")
        ResetWeaponIndex()
        PlayerPvp(true)
        gungame.round.state = true
        StartCountdown(gungame.round.time)
        
        for _, ply in pairs(player.GetAll()) do
            ply:StripWeapons()
            ply:Give(gungame.weapons.default)
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

-- Command to start first round
concommand.Add("round_start", function(ply, cmd, args)
    if not gungame.round.state then
      StartRound()
    else
      print("A round is in progress!")
    end
end)

concommand.Add("round_end_force", function(ply, cmd, args)
	local v2 = false
    if gungame.round.state == true then
      EndRound(v2)
      print("Forced round to end...")
    else
      print("Round is Restarting wait until round starts...")
	  return
    end
end)
