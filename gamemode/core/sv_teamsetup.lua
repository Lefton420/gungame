local plymeta = FindMetaTable("Player")


function plymeta:SetupTeam(teamid)
	
	-- Sets model based on team
	if teamid == 0 then
		self:SetModel("models/player/Group03/male_0".. math.random(1,9) ..".mdl")
	elseif teamid == 1 then
		self:SetModel("models/player/police.mdl")
	end
	
	local col = team.GetColor(teamid)
	self:SetPlayerColor(Vector(col.r / 255, col.g / 255, col.b / 255)) -- coverts to vector color
	self:SetHealth(100)
	self:SetRunSpeed(400)
	self:SetWalkSpeed(200)
	self:GiveWeapons(n)
	self:SetupHands()
	self:SetTeam(teamid)
end

-- list of weapons to give to both teams
function plymeta:GiveWeapons(n)
	for k, v in pairs (player.GetAll()) do
		self:Give("weapon_physgun", false)
		self:Give("gmod_tool", false)
		self:Give("weapon_crossbow", false)
		self:Give("weapon_shotgun", false)
	end
end

