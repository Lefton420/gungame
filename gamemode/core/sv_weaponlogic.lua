-- Infinite AMMO function
function InfiniteAmmo()
    for k,v in pairs (player.GetAll()) do
        weapon = v:GetActiveWeapon()
        if IsValid(weapon) and gungame.weapons.infinite == true then
            local maxClip = weapon:GetMaxClip1()
            local maxClip2 = weapon:GetMaxClip2()
            local primAmmoType = weapon:GetPrimaryAmmoType()
            local secAmmoType = weapon:GetSecondaryAmmoType()
            if maxClip == -1 and maxClip2 == -1 then
                maxClip = 100
                maxClip2 = 100
            end
            if maxClip <= 0 and primAmmoType ~= -1 then maxClip = 1 end
            if maxClip2 == -1 and secAmmoType ~= -1 then maxClip2 = 1 end
            if n == 1 then
                if maxClip > 0 then weapon:SetClip1(maxClip) end
                if maxClip2 > 0 then weapon:SetClip2(maxClip2) end
            end
            if primAmmoType ~= -1 then
                v:SetAmmo(maxClip, primAmmoType)
            end
            if secAmmoType~= -1 and secAmmoType ~= primAmmoType then
                v:SetAmmo(maxClip2, secAmmoType)  -- Comment this out to disable secondarys
            end
        end
    end
end

-- Gives the player a new weapon on kills
local playerWeaponIndex = {}

function NextGun(victim, inflictor, attacker)
    if attacker:IsPlayer() and attacker ~= victim then
        local targetIndex = (playerWeaponIndex[attacker] or 1) + 1

        -- Error handle (if nothing is found keep current weapon)
        if targetIndex > #gungame.weapons then
            return
        end

        playerWeaponIndex[attacker] = targetIndex

        -- Assign the weapon to the weapon list with index
        local nextWeapon = gungame.weapons[playerWeaponIndex[attacker]]
        attacker:StripWeapons()
        attacker:Give(nextWeapon)
        print(attacker:Name() .. " has received a " .. nextWeapon)
    end
end

-- This is a way to call outside of this file
function ResetWeaponIndex()
    playerWeaponIndex = {}
end

-- This is so players keep their last gun when they die
function CurrentGun(ply)
    if not IsValid(ply) then
        return
    end

    local targetIndex = playerWeaponIndex[ply] or 1
    if targetIndex > #gungame.weapons then
        return gungame.weapons[#gungame.weapons]
    end

    return gungame.weapons[targetIndex] -- return the current weapon we should get
end

hook.Add("Think", "InfiniteAmmo",InfiniteAmmo)
hook.Add("PlayerDeath", "NextWeaponOnKill", NextGun)
