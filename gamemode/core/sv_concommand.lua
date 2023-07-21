concommand.Add("gg_round_start", function()
    if not gungame.round.state then
      StartRound()
    else
      print("A round is in progress!")
    end
end)

concommand.Add("gg_round_end", function()
	local v2 = false
    if gungame.round.state == true then
      EndRound(v2)
      print("Forced round to end...")
    else
      print("Round is Restarting wait until round starts...")
	  return
    end
end)

concommand.Add("gg_infinite_ammo", function(ply, cmd, args)
    -- Sanity check if the argument is exist
    if #args >= 1 then
        -- Check the first argument and set the 'gungame.weapons.infinite' accordingly
        if args[1] == "1" then
            gungame.weapons.infinite = true
            print("Ammo is now infinite")
        elseif args[1] == "0" then
            gungame.weapons.infinite = false
            print("Ammo is no longer infinite")
        end
    end
end)

concommand.Add("gg_set_round_time", function(ply, cmd, args)
    if #args >= 1 and tonumber(args[1]) then
        gungame.round.time = tonumber(args[1])
        print("Rounds will now last "..tonumber(args[1]).." seconds")
    else
        print("Invalid argument! Please provide a number for round time.")
    end
end)

concommand.Add("gg_set_waiting_time", function(ply, cmd, args)
    if #args >= 1 and tonumber(args[1]) then
        gungame.round.timebetween = tonumber(args[1])
        print("Waiting time will now last "..tonumber(args[1]).." seconds")
    else
        print("Invalid argument! Please provide a number for waiting time.")
    end
end)

concommand.Add("gg_set_players", function(ply, cmd, args)
    if #args >= 1 and tonumber(args[1]) then
        gungame.round.players = tonumber(args[1])
        print(tonumber(args[1]).." players are now needed to start rounds")
    else
        print("Invalid argument! Please provide a number for the amount of players.")
    end
end)