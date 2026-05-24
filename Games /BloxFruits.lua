--// Games/BloxFruits.lua

local BloxFruits = {}

--====================================================
-- GAME INFO
--====================================================

BloxFruits.GameName = "Blox Fruits"

BloxFruits.PlaceIds = {
    [2753915549] = "Sea 1",
    [4442272183] = "Sea 2",
    [7449423635] = "Sea 3"
}

--====================================================
-- SERVICES
--====================================================

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local LocalPlayer = Players.LocalPlayer

--====================================================
-- REMOTES
--====================================================

BloxFruits.Remotes = {
    CommF = ReplicatedStorage.Remotes:WaitForChild("CommF_"),
    CommE = ReplicatedStorage.Remotes:WaitForChild("CommE")
}

--====================================================
-- GET SEA
--====================================================

function BloxFruits:GetSea()

    return self.PlaceIds[game.PlaceId] or "Unknown"

end

--====================================================
-- GET LEVEL
--====================================================

function BloxFruits:GetLevel()

    return LocalPlayer.Data.Level.Value

end

--====================================================
-- GET BELI
--====================================================

function BloxFruits:GetBeli()

    return LocalPlayer.Data.Beli.Value

end

--====================================================
-- GET FRAGMENTS
--====================================================

function BloxFruits:GetFragments()

    return LocalPlayer.Data.Fragments.Value

end

--====================================================
-- GET RACE
--====================================================

function BloxFruits:GetRace()

    return LocalPlayer.Data.Race.Value

end

--====================================================
-- GET DEVIL FRUIT
--====================================================

function BloxFruits:GetFruit()

    pcall(function()

        return LocalPlayer.Data.DevilFruit.Value

    end)

end

--====================================================
-- CHARACTER
--====================================================

function BloxFruits:GetCharacter()

    return LocalPlayer.Character
        or LocalPlayer.CharacterAdded:Wait()

end

--====================================================
-- ROOT
--====================================================

function BloxFruits:GetRoot()

    return self:GetCharacter():WaitForChild(
        "HumanoidRootPart"
    )

end

--====================================================
-- HUMANOID
--====================================================

function BloxFruits:GetHumanoid()

    return self:GetCharacter():WaitForChild(
        "Humanoid"
    )

end

--====================================================
-- IS ALIVE
--====================================================

function BloxFruits:IsAlive()

    local Humanoid = self:GetHumanoid()

    return Humanoid.Health > 0

end

--====================================================
-- GET ENEMIES
--====================================================

function BloxFruits:GetEnemies()

    return workspace:WaitForChild("Enemies"):GetChildren()

end

--====================================================
-- FIND ENEMY
--====================================================

function BloxFruits:FindEnemy(Name)

    for _,v in pairs(self:GetEnemies()) do

        if v.Name == Name
        and v:FindFirstChild("Humanoid")
        and v.Humanoid.Health > 0 then

            return v

        end

    end

end

--====================================================
-- GET DISTANCE
--====================================================

function BloxFruits:GetDistance(Position)

    return (
        self:GetRoot().Position - Position
    ).Magnitude

end

--====================================================
-- HAS QUEST
--====================================================

function BloxFruits:HasQuest()

    return LocalPlayer.PlayerGui.Main.Quest.Visible

end

--====================================================
-- START QUEST
--====================================================

function BloxFruits:StartQuest(
    QuestName,
    QuestNumber
)

    pcall(function()

        self.Remotes.CommF:InvokeServer(
            "StartQuest",
            QuestName,
            QuestNumber
        )

    end)

end

--====================================================
-- ABANDON QUEST
--====================================================

function BloxFruits:AbandonQuest()

    pcall(function()

        self.Remotes.CommF:InvokeServer(
            "AbandonQuest"
        )

    end)

end

--====================================================
-- AUTO KEN
--====================================================

function BloxFruits:EnableKen()

    pcall(function()

        self.Remotes.CommE:FireServer(
            "Ken",
            true
        )

    end)

end

--====================================================
-- SET TEAM
--====================================================

function BloxFruits:SetTeam(Team)

    pcall(function()

        self.Remotes.CommF:InvokeServer(
            "SetTeam",
            Team
        )

    end)

end

--====================================================
-- GET INVENTORY
--====================================================

function BloxFruits:GetInventory()

    return self.Remotes.CommF:InvokeServer(
        "getInventory"
    )

end

--====================================================
-- STORE FRUIT
--====================================================

function BloxFruits:StoreFruit(FruitName)

    pcall(function()

        self.Remotes.CommF:InvokeServer(
            "StoreFruit",
            FruitName
        )

    end)

end

--====================================================
-- ADD STATS
--====================================================

function BloxFruits:AddStat(
    Stat,
    Amount
)

    pcall(function()

        self.Remotes.CommF:InvokeServer(
            "AddPoint",
            Stat,
            Amount
        )

    end)

end

--====================================================
-- CHECK SEA EVENT
--====================================================

function BloxFruits:FindSeaEvent(Name)

    for _,v in pairs(workspace:GetChildren()) do

        if string.find(v.Name, Name) then
            return v
        end

    end

end

--====================================================
-- GET BOAT
--====================================================

function BloxFruits:GetBoat()

    for _,v in pairs(workspace.Boats:GetChildren()) do

        if v:FindFirstChild("VehicleSeat")
        and v.VehicleSeat.Occupant then

            return v

        end

    end

end

return BloxFruits
