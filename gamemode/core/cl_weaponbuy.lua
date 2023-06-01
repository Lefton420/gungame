net.Receive("gg_wepbuy",function()
    if !frame then
        local wepbuy, scrw, scrh = vgui.Create("DFrame"), ScrW(), ScrH()
        wepbuy:SetSize(scrw * .3, scrh * .6)
        wepbuy:Center()
        wepbuy:SetVisible(true)
        wepbuy:MakePopup()
        wepbuy:SetDraggable(false)
        wepbuy:SetTitle("Weapon Buy Menu")
        wepbuy:SetDeleteOnClose(true)

        wepbuy.Paint = function(self,w,h)
            draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 240))
        end
    end
end)