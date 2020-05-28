AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

-- Initialize's the Entity
function ENT:Initialize()

	self:SetModel("models/hunter/blocks/cube025x025x025.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetHealth(500)
	print("AHHAHAHAH")

	local phys = self:GetPhysicsObject()

	if(phys:IsValid()) then
		phys:Wake()
	end 
end