AddCSLuaFile()

SWEP.Base = "ls_base_shotgun"

SWEP.PrintName = "Riot Shotgun"
SWEP.Category = "impulse HL2RP Weapons"

SWEP.Spawnable = true
SWEP.AdminOnly = false

SWEP.HoldType = "shotgun"

SWEP.WorldModel = Model("models/weapons/w_striker_mw2r.mdl")
SWEP.ViewModel = Model("models/weapons/v_striker_mw2r.mdl")
SWEP.ViewModelFOV = 60

SWEP.Slot = 2
SWEP.SlotPos = 1

SWEP.CSMuzzleFlashes = false

SWEP.ReloadShellSound = Sound("Weapon_Shotgun.Reload")
SWEP.EmptySound = Sound("Weapon_Shotun.Empty")

SWEP.Primary.Sound = Sound("Weapon_XM1014.Single")
SWEP.Primary.Recoil = 3 -- base recoil value, SWEP.Spread mods can change this
SWEP.Primary.Damage = 10
SWEP.Primary.NumShots = 6
SWEP.Primary.Cone = 0.069
SWEP.Primary.Delay = RPM(300)

SWEP.Primary.Ammo = "buckshot"
SWEP.Primary.Automatic = true
SWEP.Primary.ClipSize = 12
SWEP.Primary.DefaultClip = 12

SWEP.Secondary.Ammo = "none"
SWEP.Secondary.Automatic = false
SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1

SWEP.Spread = {}
SWEP.Spread.Min = 0.069
SWEP.Spread.Max = 0.2
SWEP.Spread.IronsightsMod = 1 -- multiply
SWEP.Spread.CrouchMod = 1 -- crouch effect (multiply)
SWEP.Spread.AirMod = 2 -- how does if the player is in the air effect spread (multiply)
SWEP.Spread.RecoilMod = 0.01 -- how does the recoil effect the spread (sustained fire) (additional)
SWEP.Spread.VelocityMod = 0.15 -- movement speed effect on spread (additonal)

SWEP.IronsightsPos = Vector(-8.971, -1.407, 4.28)
SWEP.IronsightsAng = Angle(-0.35, 0, 0)
SWEP.IronsightsFOV = 0.63
SWEP.IronsightsSensitivity = 0.8
SWEP.IronsightsCrosshair = false
SWEP.IronsightsRecoilVisualMultiplier = 15