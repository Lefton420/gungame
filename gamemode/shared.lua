DeriveGamemode( "sandbox" )

gungame = {}

gungame.weapons = {"weapon_pistol", "weapon_shotgun"}
gungame.weapons.infinite = true 
gungame.weapons.default = {"weapon_pistol"}

-- gungame.walkspeed = 200
-- gungame.runspeed = 100
-- gungame.jumpheight = 200

gungame.round = {}
gungame.round.time = {600}
gungame.round.state = false


-- Function that finds any file name and adds / includes it
local function loadFile(name)
	if name:find("sv_") then
		if SERVER then
			include(name)
		end
	elseif name:find("sh_") then
		if SERVER then
			AddCSLuaFile(name)
		end
		include(name)
	elseif name:find("cl_") then
		if SERVER then
			AddCSLuaFile(name)
		else
			include(name)
		end
	end
end

-- Loops through every file in the gamemode the runs loadfile on it
local function loadFolder(directory)
	for k,v in pairs(file.Find(directory.."/*.lua", "LUA")) do
		loadFile(directory.."/"..v)
	end
end

loadFolder("gungame/gamemode/core")
