AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

roundActive = false

util.AddNetworkString("notify")

-- Asignes team on player respawn and checks if new round can start
function GM:PlayerSpawn(ply)	

	for k,v in pairs(player.GetAll()) do
		v:Notify(ply:Nick().." Has Spawned they are on " .. team.GetName(ply:Team()).." team")
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
