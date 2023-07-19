function CheckRoundStart()
    
    local playerCount = #player.GetAll()
    if not gungame.round.state and playerCount > 1 then
        StartRound()
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

function StartRound()
    
    if CheckRoundEnd() == false then
        print("Round starting!")
        gungame.round.state = true
        for _, ply in pairs(player.GetAll()) do
            ply:Give("weapon_pistol")
            ply:Spawn()
            ply:Freeze(true)
        end
        
        -- Unfreeze player after 5 seconds
        timer.Simple(5, function()
            for _, player in pairs(player.GetAll()) do
                player:Freeze(false)
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
    print("Round ended!")
    gungame.round.state = false
	if restart == true then
		print("Round is restarting!")
    	timer.Simple(10, StartRound)  -- start new round after 10 seconds
	elseif restart == false then
		print("Round will not restart!")
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
    else
      print("Round is Restarting wait until round starts...")
	  return
    end
end)
