util.AddNetworkString("gg_wepbuy")

function GM:ShowSpare1(ply)
    if ply:IsValid() then
        net.Start("gg_wepbuy")
        net.Send(ply)
    end  
end