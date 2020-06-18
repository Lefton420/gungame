

surface.CreateFont( "GG_sb_20", {
	font = "Roboto", 
	size = 20,
	weight = 500,

})

-- function to determin when you press the tab button
local function ToggleScoreboard(toggle)

    if toggle then
        local scrw, scrh = ScrW(), ScrH()
        GGScoreboard = vgui.Create("DFrame")
        -- Controls the size
        GGScoreboard:SetSize(scrw * .3, scrh * .6)
        GGScoreboard:Center()
        GGScoreboard:SetTitle("")
        GGScoreboard:MakePopup()
        GGScoreboard:ShowCloseButton(false)
        GGScoreboard:SetDraggable(false)
        GGScoreboard.Paint = function(self,w,h)
            surface.SetDrawColor(0,0,0,200)
            surface.DrawRect(0,0,w,h)
            draw.SimpleText("Gun Game", "GG_sb_20", w/2, h*.02, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end
        -- controls the player sections
        local ypos = GGScoreboard:GetTall() * .04
        for k,v in pairs(player.GetAll()) do
            local playerPanel = vgui.Create("DPanel",GGScoreboard)
            playerPanel:SetPos(0,ypos)
            playerPanel:SetSize(GGScoreboard:GetWide(), GGScoreboard:GetTall() * .05)
            local name,ping = v:Name(), v:Ping()
            playerPanel.Paint = function(self,w,h)
                if IsValid(v) then
                    surface.SetDrawColor(0,0,0,200)
                    surface.DrawRect(0,0,w,h)
                    draw.SimpleText(name .. "Ping:".. ping ,"GG_sb_20",w/2,h/2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                end
            end
            ypos = ypos + playerPanel:GetTall() * 1.1
        end
    else
        if IsValid(GGScoreboard) then
            GGScoreboard:Remove()
        end
    end
end

hook.Add("ScoreboardShow", "ggOpenScoreboard", function()
    ToggleScoreboard(true)
    return false
end)


hook.Add("ScoreboardHide", "ggCloseScoreboard", function()
    ToggleScoreboard(false)
end)