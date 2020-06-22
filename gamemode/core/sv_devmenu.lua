util.AddNetworkString("devmenu")
util.AddNetworkString("sethealth")

function GM:ShowTeam(ply)
    net.Start("devmenu")
    net.Send(ply)
end

net.Receive("sethealth",function(len,ply)

    if ply:IsSuperAdmin() then
        ply:SetHealth(100)
    end

end)