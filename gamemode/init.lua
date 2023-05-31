AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

roundActive = false

util.AddNetworkString("notify")

-- Asignes team on player respawn and checks if new round can start
function GM:PlayerSpawn(ply)
	if ply.hasfirstspawned then
		return
	end
	ply.hasfirstspawned = true
	-- everything below this ↑ only runs the first time you spawn

	RoundStartCheck()
	
	ply:SetupTeam(0)
	
	for k,v in pairs(player.GetAll()) do
		v:Notify(ply:Nick().." Has Spawned they are on the " .. team.GetName(ply:Team()).." team")
	end
	ply:Spawn()

	-- Makes it so you can noclip
	local d = GetConVar( "sbox_noclip" )
	d:SetBool(true)
end

-- Server side notify function
local plyMeta = FindMetaTable("Player")
function plyMeta:Notify(message)
	net.Start("notify")
	net.WriteString(message)
	net.Send(self)
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

-- Spawns the player spawnpoint entitys and assigns them teams
function GM:InitPostEntity()
	
	local playerspawn1 = ents.Create("PlayerSpawnPoint")
	playerspawn1:SetPos(Vector(447.500671, 3957.758057, 64.031250))
	playerspawn1.team = 0
	playerspawn1:SetColor(Color(255,0,0))
	playerspawn1:Spawn()

	local playerspawn2 = ents.Create("PlayerSpawnPoint")
	playerspawn2:SetPos(Vector(460, 3958, 65.0))
	playerspawn2.team = 0
	playerspawn2:SetColor(Color(255,0,0))
	playerspawn2:Spawn()

end
