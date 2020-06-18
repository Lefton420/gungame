include("shared.lua")

-- Reciver for the notify function
net.Receive("notify", function()
    local message = net.ReadString()
    notification.AddLegacy(message, 3, 10)
end)