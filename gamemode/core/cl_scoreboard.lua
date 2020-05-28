surface.CreateFont("Scoreboardtitle", {
    font = "Helvetica",
    size = 32,
    weight = 800
})

surface.CreateFont("ScoreboardPlayer", {
    font = "Helvetica",
    size = 22,
    weight = 800
})

local PLAYER_LINE = {
    Init = function(self)

        self.AvatarButton = self:Add("DButton")
        self.AvatarButton:Dock(LEFT)
        self.AvatarButton:DockMargin(3,3,0,3)
        self.AvatarButton:SetContentAlignment(5)
        self.AvatarButton:SetSize(32,32)
        self.AvatarButton.DoClick - function() self.Player():ShowProfile() end

        self.Avatar = vgui.Create("AvatarImage", self.AvatarButton)
        self.Avatar:SetSize(32,32)
        self.Avatar:SetMouseInputEnabled(false)

        self.Name = self:Add("DLabel")
        self.Name:Dock(FILL)
        self.Name:SetFont("ScoreboardPlayer")
        self.Name:SetTextColor(100,100,100)
        self.Name:DockMargin(0,0,0,0)

        self.MutePanel = self:Add("DPanel")
        self.MutePanel:SetSize(36,self:GetTall())
        self.MutePanel:Dock(RIGHT)
        function self.MutePanel:Paint(w,h)
            draw.RoundedBox(0,0,0,w,h,Color(50,50,50,150))
        end

        self.Mute = self.MutePanel:Add("DImageButton")
        self.Mute:SetSize(32,32)
        self.Mute:Dock(FILL)
        self.Mute:SetContentAlignment(5)

        self.Ping = self:Add("DLabel")
        self.Ping:Dock(RIGHT)
        self.Ping:DockMargin(0,0,2,0)
        self.Ping:SetWidth(50)
        self.Ping:SetFont("ScoreboardPlayer")
        self.Ping:SetTextColor(Color(100,100,100))
        self.Ping:SetContentAlignment(5)

        self.ScorePanel = self:Add("DPanel")
        self.ScorePanel:SetSize(60,self:GetTall())
        self.ScorePanel:Dock(RIGHT)
        self.ScorePanel:DockMargin(0,0,4,0)
        function self.ScorePanel:Paint(w,h)
            draw.RoundedBox(0,0,0,w,h,Color(100,100,100,150))
        end

        self.Score = self.ScorePanel:Add("DLabel")
        self.Score:Dock(FILL)
        self.Score:SetFont(ScoreboardDefuault)
        self.Score:SetTextColor(Color(100,100,100))
        self.Score:SetContentAlignment(5)

        self:Dock(TOP)
        self:SetHeight(38)
        self:DockMargin(10,0,10,2)

    end,

    Setup = function(self, pl)

        self.Player = pl
        self.Avatar:SetPlayer(pl)
        self:Think(self)

    end,

}

local SCORE_BOARD = {
    Init = function(self)

        -- Controls The scoreboard font
        self.Header = self:Add("Panel")
        self.Header:Dock(TOP)
        self.Header:SetHeight(50)
        self:Center()

        self.Name = self.Header:Add("DLabel")
        self.Name:SetFont("Scoreboardtitle")
        self.Name:SetTextColor(Color(255,255,255,255))
        self.Name:Dock(TOP)
        self.Name:SetHeight(50)
        self.Name:SetContentAlignment(5)
        self.Name:SetExpensiveShadow(3,Color(0,0,0,200))
        self.Name:DockMargin(0,0,0,0)

        self.Scores = self:Add("DScrollPanel")
        self.Scores:Dock(FILL)
        self.Scores:DockMargin(0,0,0,10)
        
        local ScrollBar = self.Scores:GetVBar()
        ScrollBar:DockMargin(-5,0,0,0)

        function ScrollBar:Paint(w,h)
            surface.SetDrawColor(10,10,10,100)
            surface.DrawOutlinedRect(0,0,w-1,h-1)
        end

        function ScrollBar.btnGrip:Paint(w,h)
            draw.RoundedBox(0,0,0,w,h, Color(150,200,150,150))
        end
    end,

    -- Controls size and pos
    PerformLayout = function(self)

        self:SetSize(700, ScrH() - 100)
        self:SetPos(ScrW() / 2 - 700 / 2, 100 / 2)

    end,

    -- Controls Scoreboard color
    Paint = function(self,w,h)

        draw.RoundedBox(8,0,0,w,h, Color(10,10,10,150))

    end,

    --Controls Title of Scoreboard (Its the server name)
    Think = function(self,w,h)

        self.Name:SetText("GunGame") -- GetHostName()
    
    end
}

SCORE_BOARD = vgui.RegisterTable(SCORE_BOARD, "EditablePanel")

-- Opens the scoreboard 
function GM:ScoreboardShow()
    if !IsValid(Scoreboard) then
        Scoreboard = vgui.CreateFromTable(SCORE_BOARD)
    end
    
    if IsValid(Scoreboard) then
        Scoreboard:Show()
        Scoreboard:MakePopup()
        Scoreboard:SetKeyBoardInputEnabled(false)
    end
end 

-- Closes the scoreboard
function GM:ScoreboardHide()
    if IsValid(Scoreboard) then
        Scoreboard:Remove()
    end
end