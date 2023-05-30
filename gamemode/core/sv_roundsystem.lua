--  When 2 or more pepoel join the server start the round have a check to see if a round has  already started
-- once a round is started move all players on one team to there appropiate spawn points set a timer for 3 mins
--  if eveyone on one team dies end the round (say who wins with just a print for now) if the time runs out 
--  make it a tie. There should be 3 rounds and after that clear all frags.
-- with testing i found that pepole often spawn in one another could you maby look into a fix for that?
--also there should be 5 spawn points per team and if more join than can be placed just tag them with spectator 
-- ill code what spectators do

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
	print(ply:Team())
	for k,v in pairs(ents.FindByClass("PlayerSpawnPoint")) do
		if v.team == ply:Team() then
			return v
		end
	end
end
