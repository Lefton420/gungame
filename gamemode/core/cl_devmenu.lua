net.Receive("devmenu",function()
    if !frame then
        local frame, scrw, scrh = vgui.Create("DFrame"), ScrW(), ScrH()
        frame:SetSize(scrw * .3, scrh * .6)
        frame:Center()
        frame:SetVisible(true)
        frame:MakePopup()
        frame:SetDraggable(false)
        frame:SetTitle("Dev Menu")
        frame:SetDeleteOnClose(true)

        frame.Paint = function(self,w,h)
            draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 240))
        end

        -- spawn bot button
        local button1 = vgui.Create("DButton", frame)
        button1:SetText("Spawn Bot")
        button1:SetSize(100,30)
        button1:SetPos(200,50)

        button1.DoClick = function()
            RunConsoleCommand("bot")
        end

        -- kick all bot button
        local button2 = vgui.Create("DButton", frame)
        button2:SetText("Kick All bots")
        button2:SetSize(100,30)
        button2:SetPos(200,100)

        button2.DoClick = function()
            RunConsoleCommand("kickall")
        end
    end
end)