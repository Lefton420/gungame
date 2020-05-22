AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")


util.AddNetworkString("round_timer")
util.AddNetworkString("round_active")

roundActive = false

function GM:PlayerInitialSpawn()
	--this is needed later
end 

-- Asignes team on player respawn and checks if new round can start
function GM:PlayerSpawn(ply)	
	ply:SetupTeam(AutoBalance())

	for k,v in pairs(player.GetAll()) do
		v:ChatPrint(ply:Nick().." Has Spawned they are on " .. team.GetName(ply:Team()).." team")
	end
end


function GM:PlayerDeath(ply)
	--unneeded rn
end

function GM:PlayerDisconnected(ply)
	RoundEndCheck()
end

function GM:PlayerDeathThink(ply)
	if roundActive == false then
		ply:Spawn()
	else
		return false
	end
end

-- Disables player team freindley fire 
function GM:PlayerShouldTakeDamage(ply,attacker)
	if not IsValid(attacker) or not attacker:IsPlayer() then
		return true
	end
	
	if ply:Team() == attacker:Team() then 
		return false
	end

	return true
end

-- Limits Player text chat to a specified range
function GM:PlayerCanSeePlayersChat(text,teamonly,listener,speaker)
	local distance = listener:GetPos():Distance(speaker:GetPos())

	if(distance <= 500) then
		return true 
	end
end

-- Limits player voice chat to a specified range
function GM:PlayerCanHearPlayersVoice(listener,speaker)
	return (listener:GetPos():Distance(speaker:GetPos()) < 500)
end

-- Disables player team freindley fire 
function GM:PlayerShouldTakeDamage(ply,attacker)
	if not IsValid(attacker) or not attacker:IsPlayer() then
		return true
	end
	
	if ply:Team() == attacker:Team() then 
		return false
	end

	return true
end
