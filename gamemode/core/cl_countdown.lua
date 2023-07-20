local countdownEndTime = 0

surface.CreateFont( "gg_font_2", {
	font = "Trebuchet24", 
	size = 50,
	weight = 500,
})


net.Receive("StartCountdown", function()
    countdownEndTime = net.ReadFloat()
end)

hook.Add("HUDPaint", "CountdownHUD", function()
    local timeLeft = math.max(countdownEndTime - CurTime(), 0)

    if timeLeft == 0 then
        countdownEndTime = 0
        return
    end

    local minutes = math.floor(timeLeft / 60)
    local seconds = timeLeft % 60
    local countText = string.format("%02d:%02d", minutes, seconds)

    local width = 200
    local height = 60
    local x = (ScrW() - width) / 2
    local y = 50

    draw.RoundedBox(
        5, 
        x,  
        y,  
        width, 
        height, 
        Color(0, 0, 0, 150)  -- color
    )

    draw.SimpleText(
        countText,
        "gg_font_2",
        x + width / 2,
        y + height / 2,
        Color(255, 255, 255, 255),
        TEXT_ALIGN_CENTER,
        TEXT_ALIGN_CENTER
    )
end)
