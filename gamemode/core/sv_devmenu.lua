util.AddNetworkString("devmenu")

function GM:ShowTeam(ply)
    print("gamer")
    net.Start("devmenu")
    net.Send(ply)
end