util.AddNetworkString("gg_devmenu")
util.AddNetworkString("gg_sethealth")

function GM:ShowTeam(ply)
    if ply:IsSuperAdmin() and ply:IsValid() then
        net.Start("gg_devmenu")
        net.Send(ply)
    else
        print("ERROR: Player is not super admin")
    end 
end

net.Receive("gg_sethealth",function(len,ply)
    if ply:IsSuperAdmin() and ply:IsValid() then
        ply:SetHealth(9999)
    end
end)