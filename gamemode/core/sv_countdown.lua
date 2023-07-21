util.AddNetworkString("StartCountdown")

function StartCountdown(duration)
    local countdownEndTime = CurTime() + duration
    net.Start("StartCountdown")
    net.WriteFloat(countdownEndTime)
    net.Broadcast()
end
