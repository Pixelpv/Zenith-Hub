local Quest = {}

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local LocalPlayer = Players.LocalPlayer
local CommF = ReplicatedStorage.Remotes:WaitForChild("CommF_")

--====================================================
-- QUEST DATA
--====================================================

Quest.Data = {

    {
        Min = 1,
        Max = 14,
        Mob = "Bandit",
        QuestName = "BanditQuest1",
        QuestNumber = 1,
        QuestPos = CFrame.new(1060,16,1547),
        MobPos = CFrame.new(1150,17,1630)
    },

    {
        Min = 15,
        Max = 29,
        Mob = "Monkey",
        QuestName = "JungleQuest",
        QuestNumber = 1,
        QuestPos = CFrame.new(-1600,36,154),
        MobPos = CFrame.new(-1445,67,11)
    }

}

--====================================================
-- GET LEVEL
--====================================================

function Quest:GetLevel()
    return LocalPlayer.Data.Level.Value
end

--====================================================
-- CHECK QUEST
--====================================================

function Quest:CheckQuest()

    local Level = self:GetLevel()

    for _,v in pairs(self.Data) do

        if Level >= v.Min and Level <= v.Max then
            return v
        end

    end

end

--====================================================
-- START QUEST
--====================================================

function Quest:StartQuest(Data)

    pcall(function()

        CommF:InvokeServer(
            "StartQuest",
            Data.QuestName,
            Data.QuestNumber
        )

    end)

end

--====================================================
-- HAS QUEST
--====================================================

function Quest:HasQuest()

    return LocalPlayer.PlayerGui.Main.Quest.Visible

end

return Quest
