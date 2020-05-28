AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

roundActive = false

util.AddNetworkString("notify")

-- Asignes team on player respawn and checks if new round can start
function GM:PlayerSpawn(ply)	
	for k,v in pairs(player.GetAll()) do
		v:Notify(ply:Nick().." Has Spawned they are on the " .. team.GetName(ply:Team()).." team")
	end
	
	RoundStartCheck()
	ply:SetupTeam(AutoBalance())
end

-- Server side notify function
local plyMeta = FindMetaTable("Player")
function plyMeta:Notify(message)
	net.Start("notify")
	net.WriteString(message)
	net.Send(self)
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

-- Spawns the player spawnpoint entitys and assigns them teams
function GM:InitPostEntity()
	local rebelspawns = ents.Create("PlayerSpawnPoint")
	rebelspawns:SetPos(Vector(811.083557, 693.539429, -79.968750))
	rebelspawns.team = 0
	rebelspawns:Spawn()
	
	local combinespawns = ents.Create("PlayerSpawnPoint")
	combinespawns:SetPos(Vector(809.162903, 492.670959, -79.968750))
	combinespawns.team = 1
	combinespawns:Spawn()
end
