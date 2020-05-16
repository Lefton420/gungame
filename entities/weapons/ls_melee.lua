AddCSLuaFile()

SWEP.Base = "ls_base_melee"

SWEP.PrintName = "Smacking Stick"
SWEP.Category = "impulse HL2RP Weapons"

SWEP.Spawnable = true
SWEP.AdminOnly = false

SWEP.HoldType = "melee2"

SWEP.WorldModel = Model("models/weapons/w_crowbar.mdl")
SWEP.ViewModel = Model("models/weapons/c_crowbar.mdl")
SWEP.ViewModelFOV = 65

SWEP.Slot = 4
SWEP.SlotPos = 1

SWEP.CSMuzzleFlashes = false

SWEP.Primary.Sound = Sound("WeaponFrag.Roll")
SWEP.Primary.ImpactSound = Sound("Canister.ImpactHard")
SWEP.Primary.ImpactSoundWorldOnly = true
SWEP.Primary.Recoil = 1.2 -- base recoil value, SWEP.Spread mods can change this
SWEP.Primary.Damage = 19 -- not used in this swep
SWEP.Primary.NumShots = 1
SWEP.Primary.HitDelay = 0.3
SWEP.Primary.Delay = 0.9
SWEP.Primary.Range = 75
SWEP.Primary.StunTime = 0.3