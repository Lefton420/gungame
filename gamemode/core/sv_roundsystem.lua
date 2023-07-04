-- Checks if the round has started
function RoundStartCheck()
	
	--Add more checks to make sure it doesnt start a round when 
	--One has already started 

	if table.Count(player.GetAll()) >= 2 and gungame.round.state == false then
		
		print("The Round is starting soon!") 
		for k,v in pairs(player.GetAll()) do
			v:ChatPrint("The Round is starting soon!")
		end

		timer.Simple( 15, function() RoundStart() end )
	
	else 
		
		for k,v in pairs(player.GetAll()) do
			v:ChatPrint("Waiting for players....")
		end
	
	end
end

function RoundStart()
	print("The Round is starting")
	for k,v in pairs(player.GetAll()) do
		v:ChatPrint("Round Starting now!")
		v:Kill()
	end
	
	gungame.round.state = true

	timer.Simple( 20, function() RoundEnd() end )
end

function RoundEnd()
	
	for k,v in pairs(player.GetAll()) do
		v:ChatPrint("The Round is ending now!")
	end
	
	gungame.round.state = false
	-- restarts the round
end

-- questions for loka
-- how to print a number for ever second in a timer 
-- why spawn points no work
