net.Receive("gg_devmenu",function()
    if !frame then
        local devframe, scrw, scrh = vgui.Create("DFrame"), ScrW(), ScrH()
        devframe:SetSize(scrw * .3, scrh * .6)
        devframe:Center()
        devframe:SetVisible(true)
        devframe:MakePopup()
        devframe:SetDraggable(false)
        devframe:SetTitle("Dev Menu")
        devframe:SetDeleteOnClose(true)

        devframe.Paint = function(self,w,h)
            draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 240))
        end

        -- spawn bot button
        local button1 = vgui.Create("DButton", devframe)
        button1:SetText("Spawn Bot")
        button1:SetSize(100,30)
        button1:SetPos(200,50)

        button1.DoClick = function()
            RunConsoleCommand("bot")
        end

        -- kick all bot button
        local button2 = vgui.Create("DButton", devframe)
        button2:SetText("Kick All bots")
        button2:SetSize(100,30)
        button2:SetPos(200,100)

        button2.DoClick = function()
            RunConsoleCommand("kickall")
        end

        -- health button
        local button3 = vgui.Create("DButton", devframe)
        button3:SetText("Heal to max health")
        button3:SetSize(100,30)
        button3:SetPos(200,150)

        button3.DoClick = function()
            net.Start("gg_sethealth")
            net.SendToServer()
        end

        -- ammo button
        local button4 = vgui.Create("DButton", devframe)
        button4:SetText("Ammo Refill")
        button4:SetSize(100,30)
        button4:SetPos(200,200)

        button4.DoClick = function()
            RunConsoleCommand("givecurrentammo","9999")
        end

        -- weapon button
        local button5 = vgui.Create("DButton", devframe)
        button5:SetText("give weapons")
        button5:SetSize(100,30)
        button5:SetPos(200,250)

        button5.DoClick = function()
            RunConsoleCommand("impulse","101")
        end
    end
end)