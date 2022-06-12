AddCSLuaFile()

hook.Add("Initialize", "impulseLSAmmoGas", function()
	game.AddAmmoType({
		name = "flashbang"
	})
end)

SWEP.Base = "ls_base_projectile"

SWEP.PrintName = "Flashbang"
SWEP.Category = "impulse HL2RP Weapons"

SWEP.Spawnable = true
SWEP.AdminOnly = false

SWEP.HoldType = "grenade"

SWEP.WorldModel = Model("models/weapons/w_eq_flashbang.mdl")
SWEP.ViewModel = Model("models/weapons/cstrike/c_eq_flashbang.mdl")
SWEP.ViewModelFOV = 50

SWEP.Slot = 4
SWEP.SlotPos = 1

SWEP.Primary.Sound = ""
SWEP.Primary.Recoil = 0 -- base recoil value, SWEP.Spread mods can change this
SWEP.Primary.Delay = 0.8
SWEP.Primary.HitDelay = 0.1

SWEP.Primary.Ammo = "flashbang"
SWEP.Primary.ClipSize = 1
SWEP.Primary.DefaultClip = 1

SWEP.Projectile = {}
SWEP.Projectile.Model = Model("models/weapons/w_eq_flashbang_thrown.mdl")
SWEP.Projectile.FireSound = Sound("Weapon_Flashbang.Explode")
SWEP.Projectile.HitSound = Sound("weapons/flashbang/grenade_hit1.wav")
SWEP.Projectile.Touch = false
SWEP.Projectile.ForceMod = 1.2
SWEP.Projectile.Timer = 3
SWEP.Projectile.RemoveWait = 30

local maxRange = 600
local midRange = 390
local minRange = 170
local player_GetAll = player.GetAll
function SWEP:ProjectileFire()
	local pos = self:GetPos()

	local rf = RecipientFilter()
	rf:AddPVS(pos)

	net.Start("impulseLSGetFlashed")
	net.WriteEntity(self)
	net.Send(rf)
end

if SERVER then
	util.AddNetworkString("impulseLSGetFlashed")
else
	net.Receive("impulseLSGetFlashed", function()
		local ent = net.ReadEntity()

		if not IsValid(ent) then
			return
		end

		local pos = ent:GetPos()

		debugoverlay.Sphere(pos, minRange, 10, Color(255, 0, 0))
		debugoverlay.Sphere(pos, midRange, 10, Color(255, 100, 0))
		debugoverlay.Sphere(pos, maxRange, 10, Color(255, 255, 0))
		-- need to work out if you are looking in opposite direction or not, if you are then take dist and divide the effect by dist
		-- need to move this to the client mostly imo, and also make the screenfade be part of HUDPaint or maybe colorcorrection?
		-- movement speed affect, using melee slow down method
		-- gas mask reduced affect, cp/ota reduced affect

		--k:ScreenFade(SCREENFADE.IN, color_white, 7, 1)
		LocalPlayer():SetDSP(35) -- ringing ears
		surface.PlaySound("Weapon_Flashbang.Explode")

		timer.Simple(7, function()
			LocalPlayer():SetDSP(0) -- think this causes sound bugs lol, actually this might not be needed
		end)
	end)
end

sound.Add({
	name = "Weapon_Flashbang.Explode",
	sound = {"impulse/flashbang1.ogg", "impulse/flashbang2.ogg"},
	channel = CHAN_WEAPON,
	level = SNDLVL_GUNFIRE,
	volume = 1,
	pitch = {85, 115}
})