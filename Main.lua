--// Zenith Hub - Main.lua
--// GitHub Loader Version

repeat task.wait() until game:IsLoaded()

--====================================================
-- SERVICES
--====================================================

local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local VirtualUser = game:GetService("VirtualUser")

local LocalPlayer = Players.LocalPlayer

--====================================================
-- GLOBAL SETTINGS
--====================================================

getgenv().AutoFarm = false
getgenv().BringMob = true
getgenv().TweenSpeed = 300
getgenv().SelectWeapon = "Melee"

getgenv().NoClip = false
getgenv().FullBright = false

getgenv().WalkSpeed = 16
getgenv().JumpPower = 50

--====================================================
-- BASE URL
--====================================================

local BASE =
"https://raw.githubusercontent.com/Pixelpv/Zenith-Hub/main/"

--====================================================
-- MODULE LOADER
--====================================================

local function LoadModule(Path)

    local Success, Result = pcall(function()

        return loadstring(game:HttpGet(
            BASE .. Path
        ))()

    end)

    if Success then
        return Result
    else
        warn("Failed to load:", Path)
        warn(Result)
    end

end

--====================================================
-- LOAD MODULES
--====================================================

local Tween = LoadModule("Modules/Tween.lua")
local Combat = LoadModule("Modules/Combat.lua")
local Quest = LoadModule("Modules/Quest.lua")
local Bring = LoadModule("Modules/Bring.lua")
local Farm = LoadModule("Modules/Farm.lua")

local GameModule = LoadModule(
    "Games/BloxFruits.lua"
)

--====================================================
-- LOAD UI
--====================================================

LoadModule("UI/UI.lua")

--====================================================
-- CHECK MODULES
--====================================================

if not Tween
or not Combat
or not Quest
or not Bring
or not Farm then

    return warn("Failed to load modules.")

end

--====================================================
-- START FARM
--====================================================

Farm:Start(
    Tween,
    Combat,
    Quest,
    Bring
)

--====================================================
-- NOCLIP LOOP
--====================================================

task.spawn(function()

    while task.wait() do

        if getgenv().NoClip then
            Tween:NoClip(true)
        else
            Tween:NoClip(false)
        end

    end

end)

--====================================================
-- FULLBRIGHT LOOP
--====================================================

task.spawn(function()

    while task.wait(1) do

        if getgenv().FullBright then

            Lighting.Brightness = 2
            Lighting.ClockTime = 12
            Lighting.FogEnd = 999999
            Lighting.GlobalShadows = false
            Lighting.OutdoorAmbient =
                Color3.fromRGB(255,255,255)

        end

    end

end)

--====================================================
-- PLAYER LOOP
--====================================================

task.spawn(function()

    while task.wait() do

        pcall(function()

            local Character =
                LocalPlayer.Character

            if Character then

                local Humanoid =
                    Character:FindFirstChild("Humanoid")

                if Humanoid then

                    Humanoid.WalkSpeed =
                        getgenv().WalkSpeed or 16

                    Humanoid.JumpPower =
                        getgenv().JumpPower or 50

                end
            end

        end)

    end

end)

--====================================================
-- AUTO SKILLS LOOP
--====================================================

task.spawn(function()

    while task.wait(0.5) do

        if getgenv().AutoSkillZ then
            Combat:UseSkill(Enum.KeyCode.Z)
        end

        if getgenv().AutoSkillX then
            Combat:UseSkill(Enum.KeyCode.X)
        end

        if getgenv().AutoSkillC then
            Combat:UseSkill(Enum.KeyCode.C)
        end

        if getgenv().AutoSkillV then
            Combat:UseSkill(Enum.KeyCode.V)
        end

        if getgenv().AutoSkillF then
            Combat:UseSkill(Enum.KeyCode.F)
        end

    end

end)

--====================================================
-- ANTI AFK
--====================================================

LocalPlayer.Idled:Connect(function()

    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())

end)

--====================================================
-- GAME INFO
--====================================================

print("====================================")
print("Zenith Hub Loaded")
print("Game:", GameModule.GameName)
print("Sea:", GameModule:GetSea())
print("Level:", GameModule:GetLevel())
print("====================================")
print("Modules Loaded:")
print("- Tween")
print("- Combat")
print("- Quest")
print("- Bring")
print("- Farm")
print("- BloxFruits")
print("====================================")
