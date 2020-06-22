util.AddNetworkString("devmenu")
util.AddNetworkString("sethealth")

function GM:ShowTeam(ply)
    if ply:IsSuperAdmin() then
        net.Start("devmenu")
        net.Send(ply)
    end
    
end

net.Receive("sethealth",function(len,ply)

    if ply:IsSuperAdmin() then
        ply:SetHealth(100)
    end

end)