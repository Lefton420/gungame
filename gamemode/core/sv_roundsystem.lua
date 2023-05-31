-- if 2 pepole join start a timer and count down

-- Checks if the round has started
function RoundStartCheck()
	
	--Add more checks to make sure it doesnt start a round when 
	--One has already started 

	if table.Count(player.GetAll()) >= 2 and roundActive == false then
		print("Round starting....") 
		for k,v in pairs(player.GetAll()) do
			v:Notify("The Round is starting soon!")
		end
		RoundStart()
	else 
		print("Not enough players ")
		for k,v in pairs(player.GetAll()) do
			v:Notify("Waiting for players....")
		end
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
	-- restarts the round
end

-- Sets player spawn to PlayerSpawnPoint
function GM:PlayerSelectSpawn(ply)
	for k,v in pairs(ents.FindByClass("PlayerSpawnPoint")) do
		
		return v
		
	end
end
