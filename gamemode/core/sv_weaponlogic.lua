-- Infinite AMMO FUNC
function InfiniteAmmo()
    for k,v in pairs (player.GetAll()) do
        weapon = v:GetActiveWeapon()
        if IsValid(weapon) then
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
                -- v:SetAmmo(maxClip2, secAmmoType)
            end
        end
    end
end

hook.Add("Think", "InfiniteAmmo",InfiniteAmmo)

-- Gives the player a new weapon on kills
local playerWeaponIndex = {}

hook.Add("PlayerDeath", "NextWeaponOnKill", function(victim, inflictor, attacker)
    
    if attacker:IsPlayer() and attacker ~= victim then
        
        playerWeaponIndex[attacker] = (playerWeaponIndex[attacker] or 0) + 1
        
        -- Loop back to the first weapon if the end of the list is reached
        if playerWeaponIndex[attacker] > #gungame.weapons then
            playerWeaponIndex[attacker] = 1
        end
        
        -- Assign the weapon to the weapon list with index
        local nextWeapon = gungame.weapons[playerWeaponIndex[attacker]]
        attacker:StripWeapons()
        attacker:Give(nextWeapon)
        print(attacker:Name().." has recived a ".. nextWeapon) 
    end
end)