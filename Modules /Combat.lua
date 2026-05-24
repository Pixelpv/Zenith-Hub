local Combat = {}

--// Services
local Players = game:GetService("Players")
local VirtualInputManager = game:GetService("VirtualInputManager")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

--// Player
local LocalPlayer = Players.LocalPlayer

--// Remotes
local CommE = ReplicatedStorage.Remotes:WaitForChild("CommE")

--====================================================
-- CHARACTER
--====================================================

function Combat:GetCharacter()
    return LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
end

--====================================================
-- IS ALIVE
--====================================================

function Combat:IsAlive()

    local Character = self:GetCharacter()

    return Character
        and Character:FindFirstChild("Humanoid")
        and Character.Humanoid.Health > 0

end

--====================================================
-- GET TOOL
--====================================================

function Combat:GetTool(Name)

    local Backpack = LocalPlayer.Backpack

    if Backpack:FindFirstChild(Name) then
        return Backpack[Name]
    end

    local Character = self:GetCharacter()

    if Character:FindFirstChild(Name) then
        return Character[Name]
    end

end

--====================================================
-- EQUIP WEAPON
--====================================================

function Combat:EquipWeapon(Name)

    local Tool = self:GetTool(Name)

    if Tool then
        self:GetCharacter().Humanoid:EquipTool(Tool)
    end

end

--====================================================
-- CLICK
--====================================================

function Combat:Click()

    VirtualInputManager:SendMouseButtonEvent(
        0,
        0,
        0,
        true,
        game,
        0
    )

    task.wait()

    VirtualInputManager:SendMouseButtonEvent(
        0,
        0,
        0,
        false,
        game,
        0
    )

end

--====================================================
-- ATTACK
--====================================================

function Combat:Attack()

    if not self:IsAlive() then
        return
    end

    self:Click()

end

--====================================================
-- AUTO KEN
--====================================================

function Combat:AutoKen()

    pcall(function()
        CommE:FireServer("Ken", true)
    end)

end

--====================================================
-- USE SKILL
--====================================================

function Combat:UseSkill(Key)

    VirtualInputManager:SendKeyEvent(
        true,
        Key,
        false,
        game
    )

    task.wait(0.1)

    VirtualInputManager:SendKeyEvent(
        false,
        Key,
        false,
        game
    )

end

return Combat
