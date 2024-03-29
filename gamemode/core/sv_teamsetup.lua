local plymeta = FindMetaTable("Player")

-- Sets up basic player settings
function plymeta:SetupTeam(teamid)
	
	self:SetModel("models/player/Group03/male_0".. math.random(1,9) ..".mdl")
	
	local col = team.GetColor(teamid)
	self:SetPlayerColor(Vector(col.r / 255, col.g / 255, col.b / 255)) -- Coverts to vector color
	self:SetSlowWalkSpeed(60)
	self:SetWalkSpeed(gungame.walkspeed )
	self:SetRunSpeed(gungame.runspeed)
	self:SetCrouchedWalkSpeed(0.6)
	self:SetupHands()
	self:AllowFlashlight(false)
	self:SetTeam(teamid)
end