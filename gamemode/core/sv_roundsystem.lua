
function UpdateTimer(time)
	net.Start("round_timer")
	net.WriteInt(time, 10)

	net.Broadcast()

end


-- Run when when round starts
function RoundStart()
	local time = 5
	UpdateTimer(time)
	
	timer.Create("round",1,time,function()
		time = time - 1
		local Alive = 0
		for k, v in pairs(player.GetAll()) do
			if v:Alive() then
				Alive = Alive + 1
			end
		end
		
		if Alive >= table.Count(player.GetAll()) and table.Count(player.GetAll()) > 1 and time <= 0  then
			roundActive = true

			net.Start("round_active")
				net.WriteBool(true)
			net.Broadcast()
		elseif table.Count(player.GetAll()) then
			UpdateTimer(5)
			return
		end
		if time <= 0 then
			print("Round started: ".. tostring(roundActive))
			RoundEndCheck()
		end
		UpdateTimer(time)
	end)	
end
	
	


--Checks if the round is over
function RoundEndCheck()
	print("Round started: ".. tostring(roundActive))

	if roundActive == false then return end
	timer.Create("checkdelay",1,1,function()
		local combineAlive = 0 
		local rebelAlive = 0
		
		-- Gets the number of players on each team then prints the number
		for k, v in pairs(team.GetPlayers(0)) do
			if v:Alive() then
				rebelAlive = rebelAlive + 1
			end
		
			for k, v in pairs(team.GetPlayers(1)) do
				if v:Alive() then
					combineAlive = combineAlive + 1
				end
			end
		end
		
		print("Rebel Alive: " .. tostring(rebelAlive) .. " Combine Alive: " .. tostring(combineAlive))
		
		-- if one team has no players alive then end the round with the winner being oppisite team
		if rebelalive == 0 then
			EndRound("Combine")
		elseif combineAlive == 0 then
			EndRound("Rebel")
		end	
	end)
end

-- function that ends the round
function EndRound(winners)
	print(winners .. " won the round!")
	
	for k, v in pairs(player.GetAll()) do
		if team.GetName(v:Team()) == winners then
			v:ChatPrint( winners .. " won the round!")
		end
	end
	
	-- timer to clean up the map after the round ends and resets roundActive
	timer.Create("cleanup", 3, 1,function()
		game.CleanUpMap(false, {})
		for k, v in pairs(player.GetAll()) do
			if v:Alive() then
				v:SetupHands()
				--v:StripWeapons()
				v:KillSilent()
			end
			v:SetupTeam(v:Team())
		end
		roundActive = false
	end)
end

-- Makes sure the about the same pepole are on both teams
function AutoBalance()
	if table.Count(team.GetPlayers(0)) > table.Count(team.GetPlayers(1)) then 
		return 1
	
	elseif table.Count(team.GetPlayers(0)) < table.Count(team.GetPlayers(1)) then 
		return 0

	else
		return 0
	end
end