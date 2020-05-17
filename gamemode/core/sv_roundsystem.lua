
-- Run when when round starts
function RoundStart()
	
	-- finds how many players are alive
	local Alive = 0
	for k, v in pairs(player.GetAll()) do
		if v:Alive() then
			Alive = Alive + 1
		end
	end
	
	-- if there is the same amount alive as dead OR 
	-- if theres more than one player alive set round active to true
	if Alive >= table.Count(player.GetAll()) && table.Count(player.GetAll()) > 1  then
		 roundActive = true
	end
	print("Round started: ".. tostring(roundActive))
	RoundEndCheck()
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
	
	for k, v in pairs(players.GetAll()) do
		if team.GetName(v:Team()) == winners then
			v:ChatPrint( winners .. "won teh round but this time its from an if statement")
		end
	end
	
	-- timer to clean up the map after the round ends and resets roundActive
	timer.Create("cleanup", 3, 1,function()
		game.CleanUpMap(false, {})
		for k, v in pairs(players.GetAll()) do
			if v:Alive() then
				v:SetupHands()
				v:StripWeapons()
				V:KillSilent()
			end
			v:SetupTeam(v:Team())
		end
		roundActive = false
	end)
end