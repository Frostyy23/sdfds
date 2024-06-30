AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function ENT:Initialize()
    self:SetModel("models/props_lab/reciever01a.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)

    local phys = self:GetPhysicsObject()
    if phys:IsValid() then
        phys:Wake()
    end

    self:SetUseType(SIMPLE_USE)
    self.PrintingMoney = false
    self.LastPrintTime = CurTime()
end

function ENT:Use(activator, caller)
    if activator:IsPlayer() then
        self:StartPrinting()
    end
end

function ENT:Think()
    if self.PrintingMoney and CurTime() - self.LastPrintTime > 5 then
        self:PrintMoney()
        self.LastPrintTime = CurTime()
    end
end

function ENT:StartPrinting()
    self.PrintingMoney = true
end

function ENT:StopPrinting()
    self.PrintingMoney = false
end

function ENT:PrintMoney()
    local money = ents.Create("prop_physics")
    if not IsValid(money) then return end

    money:SetModel("models/money/note.mdl")
    money:SetPos(self:GetPos() + Vector(0, 0, 20))
    money:Spawn()
end
