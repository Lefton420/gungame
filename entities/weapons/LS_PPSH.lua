AddCSLuaFile()

SWEP.Base = "ls_base"

SWEP.PrintName = "Borz"
SWEP.Category = "Longsword Weapons"

SWEP.Spawnable = true
SWEP.AdminOnly = false

SWEP.HoldType = "pistol"

SWEP.WorldModel = Model("models/weapons/w_dm_borz9.mdl")
SWEP.ViewModel = Model("models/weapons/v_borz_9smg.mdl")
SWEP.ViewModelFOV = 65

SWEP.Slot = 3
SWEP.SlotPos = 1

SWEP.CSMuzzleFlashes = false

SWEP.ReloadSound = Sound("Weapon_SMG1.Reload")
SWEP.EmptySound = Sound("Weapon_SMG1.Empty")

SWEP.Primary.Sound = Sound("Weapon_USP.SilencedShot")
SWEP.Primary.Recoil = .1 -- base recoil value, SWEP.Spread mods can change this
SWEP.Primary.Damage = 8
SWEP.Primary.NumShots = 1
SWEP.Primary.Cone = 0.03
SWEP.Primary.Delay = RPM(999)

SWEP.Primary.Burst = false

SWEP.Primary.Ammo = "SMG1"
SWEP.Primary.Automatic = true
SWEP.Primary.ClipSize = 15
SWEP.Primary.DefaultClip = 30

SWEP.Spread = {}
SWEP.Spread.Min = .01
SWEP.Spread.Max = 0.3
SWEP.Spread.IronsightsMod = 1.5 -- multiply
SWEP.Spread.CrouchMod = 1.0 -- crouch effect (multiply)
SWEP.Spread.AirMod = 2 -- how does if the player is in the air effect spread (multiply)
SWEP.Spread.RecoilMod = 0.3 -- how does the recoil effect the spread (sustained fire) (additional)
SWEP.Spread.VelocityMod = 1.3 -- movement speed effect on spread (additonal)

SWEP.IronsightsPos = Vector(-0, 0, 0)
SWEP.IronsightsAng = Angle(0.2, -0.201, 0)
SWEP.IronsightsFOV = 0.72
SWEP.IronsightsSensitivity = 0.8
SWEP.IronsightsCrosshair = false
SWEP.IronsightsRecoilVisualMultiplier = 0.8

SWEP.LoweredPos = Vector(0, -16, -13)
SWEP.LoweredAng = Angle(70, 0, 0)