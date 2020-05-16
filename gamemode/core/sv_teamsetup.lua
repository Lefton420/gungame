local plymeta = FindMetaTable("Player")

team.SetUp(0, "Red", Color(255, 0, 0), false)
team.SetUp(1, "Blue", Color(255, 0, 0), false)

function plymeta:SetupTeam(teamid)
	self:SetTeam(teamid)

	local col = team.GetColor(teamid)
	self:SetPlayerColor(Vector(col.r / 255, col.g / 255, col.b / 255)) -- coverts to vector color
	self:SetHealth(100)
	self:SetRunSpeed(400)
	self:SetWalkSpeed(100)
	self:SetModel("models/player/Group03m/Male_0".. math.random(1,9)..".mdl")
	self:Give("gmod_tool", false)
	self:Give("weapon_physgun", false)
	self:SetupHands(ent)
end

