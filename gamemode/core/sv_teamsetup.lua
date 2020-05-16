local plymeta = FindMetaTable("Player")

team.SetUp(0, "Rebels", Color(0, 0, 0), false)
team.SetUp(1, "Combine", Color(0, 0, 0), false)

function plymeta:SetupTeam(teamid)
	
	-- Sets model based on team
	if teamid == 0 then
		self:SetModel("models/player/Group03/male_0".. math.random(0,9) ..".mdl")
	elseif teamid == 1 then
		self:SetModel("models/player/police.mdl")
	end
	
	local col = team.GetColor(teamid)
	self:SetPlayerColor(Vector(col.r / 255, col.g / 255, col.b / 255)) -- coverts to vector color
	self:SetHealth(100)
	self:SetRunSpeed(400)
	self:SetWalkSpeed(100)
	self:Give("gmod_tool", false)
	self:Give("weapon_physgun", false)
	self:SetupHands()
	self:SetTeam(teamid)
end


