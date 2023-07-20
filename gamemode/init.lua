AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

-- Asignes team on player respawn and checks if new round can start
function GM:PlayerSpawn(ply)
	
	if ply.hasfirstspawned then
		return
	end
	ply.hasfirstspawned = true

	ply:SetupTeam(0)
	ply:Spawn()

	local noclip = GetConVar( "sbox_noclip" )
	noclip:SetBool(true)
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
	return listener:GetPos():Distance(speaker:GetPos()) < 500
end

function ServerMsg(inputtext)
	for k,v in pairs(player.GetAll()) do
		v:ChatPrint(inputtext)
	end
end

local canDamage = false

function PlayerPvp(value)
    canDamage = value
end

-- The hook to handle damage between players
hook.Add("PlayerShouldTakeDamage", "HandlePvP", function(ply, attacker)
    if attacker:IsPlayer() and not canDamage then
        return false
    end
end)
