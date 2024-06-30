include("shared.lua")

function ENT:Draw()
    self:DrawModel()

    -- Dodajmy tutaj dodatkowy HUD dla drukarki
    local Pos = self:GetPos()
    local Ang = self:GetAngles()

    surface.SetFont("DermaLarge")
    local Text = "Money Printer"
    local TextWidth = surface.GetTextSize(Text)

    cam.Start3D2D(Pos + Ang:Up() * 10, Ang, 0.11)
        draw.RoundedBox(0, -TextWidth * 0.5, -10, TextWidth, 20, Color(0, 0, 0, 100))
        draw.SimpleText(Text, "DermaLarge", 0, 0, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    cam.End3D2D()

    Ang:RotateAroundAxis(Ang:Forward(), 90)
    Ang:RotateAroundAxis(Ang:Right(), 90)

    cam.Start3D2D(Pos + Ang:Up() * 10, Ang, 0.11)
        draw.RoundedBox(0, -TextWidth * 0.5, -10, TextWidth, 20, Color(0, 0, 0, 100))
        draw.SimpleText(Text, "DermaLarge", 0, 0, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    cam.End3D2D()
end
