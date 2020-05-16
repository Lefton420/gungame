GM.Name = "Base Defense Battle"
GM.Name = "Lefton"

DeriveGamemode( "sandbox" )

function GM:Initialize()

end

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

-- loops through every file in bdf the runs loadfile on it
local function loadFolder(directory)
	for k,v in pairs(file.Find(directory.."/*.lua", "LUA")) do
		loadFile(directory.."/"..v)
	end
end

loadFolder("gungame/gamemode/core")
