include("shared.lua")

-- Reciver for the notify function
net.Receive("notify", function()
    local message = net.ReadString()
    notification.AddLegacy(message, 0, 10)
end)

-- Makes it so players see eachother as blue and enemys as red
function GM:Think()
    
    for k,v in pairs(player.GetAll()) do
        if LocalPlayer():Team() == v:Team() then
            v:SetPlayerColor(Vector(0,0,1))
        else 
            v:SetPlayerColor(Vector(1,0,0))
        
        end
	end
end