
-- Checks if the round has started
function RoundStartCheck()
	
	--Add more checks to make sure it doesnt start a round when 
	--One has already started 

	if table.Count(player.GetAll()) >= 2 then
		print("Round starting....")
		RoundStart()
	else print("Not enough players ")
		
	end
end

function RoundStart()
	print("The round started")
	roundActive = true
	-- move players to starting area useing entity
	-- start a timer
end


function RoundEndCheck()
	-- checks when all players on one side are dead
	RoundEnd()
end

function RoundEnd()
	roundActive = false
	--kill all players 
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


function GM:PlayerSelectSpawn(ply)

	for k,v in pairs(ents.FindByClass("PlayerSpawnPoint")) do
		if v.team == 1 and ply:Team() == 1 then
			--print("and ply.team == 1 and v.team == 1")
			return v
		elseif v.team == 0 and ply:Team() == 0 then
			return v
		end
	end
end






-- -- Run to start the round
-- function RoundStart()
-- 	local time = 5
-- 	UpdateTimer(time)
	
-- 	timer.Create("round",1,time,function()
-- 		time = time - 1
-- 		local Alive = 0
-- 		for k, v in pairs(player.GetAll()) do
-- 			if v:Alive() then
-- 				Alive = Alive + 1
-- 			end
-- 		end
		
-- 		-- if there are more alive than total and there is more than one player adn time is <= 0 
-- 		--then start round
-- 		if Alive >= table.Count(player.GetAll()) and table.Count(player.GetAll()) > 1 and time <= 0  then
-- 			roundActive = true

-- 			net.Start("round_active")
-- 				net.WriteBool(true)
-- 			net.Broadcast()
		
-- 		elseif table.Count(player.GetAll()) then
-- 			UpdateTimer(5)
-- 			return
-- 		end
		
-- 		if time <= 0 then
-- 			print("Round started: ".. tostring(roundActive))
-- 			RoundEndCheck()
		
-- 		end
-- 		UpdateTimer(time)
-- 	end)	
-- end
	
	


-- --Checks if the round is over
-- function RoundEndCheck()
-- 	print("Round started: ".. tostring(roundActive))

-- 	time = 31

-- 	if roundActive == false then return end
-- 	timer.Create("checkdelay",1,time,function()
-- 		time = time - 1
-- 		UpdateTimer(time)

-- 		if time <= 0 then
-- 			EndRound("No one")
-- 		end
		
-- 		local combineAlive = 0 
-- 		local rebelAlive = 0
		
-- 		-- Gets the number of players on each team then prints the number
-- 		for k, v in pairs(team.GetPlayers(0)) do
-- 			if v:Alive() then
-- 				rebelAlive = rebelAlive + 1
-- 			end
		
-- 			for k, v in pairs(team.GetPlayers(1)) do
-- 				if v:Alive() then
-- 					combineAlive = combineAlive + 1
-- 				end
-- 			end
-- 		end
		
-- 		print("Rebel Alive: " .. tostring(rebelAlive) .. " Combine Alive: " .. tostring(combineAlive))
		
-- 		-- if one team has no players alive then end the round with the winner being oppisite team
-- 		if rebelalive == 0 then
-- 			EndRound("Combine")
-- 		elseif combineAlive == 0 then
-- 			EndRound("Rebel")
-- 		end	
-- 	end)
-- end

-- -- function that ends the round
-- function EndRound(winners)
-- 	print(winners .. " won the round!")
	
-- 	for k, v in pairs(player.GetAll()) do
-- 		if team.GetName(v:Team()) == winners then
-- 			v:ChatPrint( winners .. " won the round!")
-- 		end
-- 	end
	
-- 	-- timer to clean up the map after the round ends and resets roundActive
-- 	timer.Remove("checkdelay")
-- 	timer.Create("cleanup", 3, 1,function()
-- 		game.CleanUpMap(false, {})
-- 		for k, v in pairs(player.GetAll()) do
-- 			if v:Alive() then
-- 				v:SetupHands()
-- 				v:StripWeapons()
-- 				v:KillSilent()
-- 			end
-- 			v:SetupTeam(v:Team())
-- 		end
-- 		net.Start("round_active")
-- 			net.WriteBool(true)
-- 		net.Broadcast()
-- 		roundActive = false
-- 	end)
-- end