AddCSLuaFile()

SWEP.Base = "ls_base"

SWEP.PrintName = "M4A1"
SWEP.Category = "Longsword Weapons"

SWEP.Spawnable = true
SWEP.AdminOnly = false

SWEP.HoldType = "smg"

SWEP.WorldModel = Model("models/weapons/w_dm60.mdl")
SWEP.ViewModel = Model("models/weapons/v_dm60.mdl")
SWEP.ViewModelFOV = 65

SWEP.Slot = 3
SWEP.SlotPos = 1

SWEP.CSMuzzleFlashes = false

SWEP.ReloadSound = Sound("Weapon_SMG1.Reload")
SWEP.EmptySound = Sound("Weapon_SMG1.Empty")

SWEP.Primary.Sound = Sound("Weapon_SMG1.Single")
SWEP.Primary.Recoil = 3.2 -- base recoil value, SWEP.Spread mods can change this
SWEP.Primary.Damage = 5
SWEP.Primary.NumShots = 1
SWEP.Primary.Cone = 0.08
SWEP.Primary.Delay = RPM(1000)

SWEP.Primary.Ammo = "SMG1"
SWEP.Primary.Automatic = true
SWEP.Primary.ClipSize = 30
SWEP.Primary.DefaultClip = 30

SWEP.Spread = {}
SWEP.Spread.Min = 0
SWEP.Spread.Max = 0.1
SWEP.Spread.IronsightsMod = 0.4 -- multiply
SWEP.Spread.CrouchMod = 0.9 -- crouch effect (multiply)
SWEP.Spread.AirMod = 2 -- how does if the player is in the air effect spread (multiply)
SWEP.Spread.RecoilMod = 0.03 -- how does the recoil effect the spread (sustained fire) (additional)
SWEP.Spread.VelocityMod = 1.3 -- movement speed effect on spread (additonal)

SWEP.IronsightsPos = Vector(-6.2, 2, -0.1)
SWEP.IronsightsAng = Angle(0.2, -0.201, 0)
SWEP.IronsightsFOV = 0.72
SWEP.IronsightsSensitivity = 0.8
SWEP.IronsightsCrosshair = false
SWEP.IronsightsRecoilVisualMultiplier = 0.5

SWEP.LoweredPos = Vector(0, -16, -13)
SWEP.LoweredAng = Angle(70, 0, 0)