

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
        
        local scroll, ypos = vgui.Create("DScrollPanel",GGScoreboard), 0
        
        -- This sets offset from where the tabs start ↓
        scroll:SetPos(0, GGScoreboard:GetTall() * .05)
        scroll:SetSize(GGScoreboard:GetWide(),GGScoreboard:GetTall() * .97)

        -- Loops through all players and gives them a tab in the menu
        for k,v in pairs(player.GetAll()) do
            local playerPanel = vgui.Create("DPanel",scroll)
            playerPanel:SetPos(0,ypos)
            -- This controls how thick the tabs are ↓
            playerPanel:SetSize(GGScoreboard:GetWide(), GGScoreboard:GetTall() * .05)
            local name, ping, plyteam = v:Name(), v:Ping(), v:Team()
            playerPanel.Paint = function(self,w,h)
                if IsValid(v) then
                    surface.SetDrawColor(0,0,0,200)
                    surface.DrawRect(0,0,w,h)
                    draw.SimpleText(name,"GG_sb_20",w/2,h/2, team.GetColor(plyteam), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
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