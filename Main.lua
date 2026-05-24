--// Zenith Hub - Main

repeat task.wait() until game:IsLoaded()

print("Zenith Main Loaded")

--====================================================
-- SERVICES
--====================================================

local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local VirtualUser = game:GetService("VirtualUser")

local LocalPlayer = Players.LocalPlayer

--====================================================
-- GLOBALS
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
"https://raw.githubusercontent.com/Pixelpv/Zenith-Hub/refs/heads/main/"

--====================================================
-- LOAD MODULE
--====================================================

local function LoadModule(Path)

    print("Loading:", Path)

    local Success, Response = pcall(function()

        return game:HttpGet(BASE .. Path)

    end)

    if not Success then
        warn("HttpGet Failed:", Path)
        warn(Response)
        return nil
    end

    local Loaded, Result = pcall(function()

        return loadstring(Response)()

    end)

    if not Loaded then
        warn("Loadstring Failed:", Path)
        warn(Result)
        return nil
    end

    print("Loaded:", Path)

    return Result
end

--====================================================
-- LOAD MODULES
--====================================================

local Tween = LoadModule("Modules/Tween.lua")
local Combat = LoadModule("Modules/Combat.lua")
local Quest = LoadModule("Modules/Quest.lua")
local Bring = LoadModule("Modules/Bring.lua")
local Farm = LoadModule("Modules/Farm.lua")

local GameModule = LoadModule("Games/BloxFruits.lua")

--====================================================
-- LOAD UI
--====================================================

LoadModule("UI/UI.lua")

--====================================================
-- CHECK MODULES
--====================================================

if not Tween then
    return warn("Tween module failed.")
end

if not Combat then
    return warn("Combat module failed.")
end

if not Quest then
    return warn("Quest module failed.")
end

if not Bring then
    return warn("Bring module failed.")
end

if not Farm then
    return warn("Farm module failed.")
end

print("All Modules Loaded")

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

        pcall(function()

            if getgenv().NoClip then
                Tween:NoClip(true)
            else
                Tween:NoClip(false)
            end

        end)

    end

end)

--====================================================
-- FULLBRIGHT LOOP
--====================================================

task.spawn(function()

    while task.wait(1) do

        pcall(function()

            if getgenv().FullBright then

                Lighting.Brightness = 2
                Lighting.ClockTime = 12
                Lighting.FogEnd = 999999
                Lighting.GlobalShadows = false
                Lighting.OutdoorAmbient =
                    Color3.fromRGB(255,255,255)

            end

        end)

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
                    Character:FindFirstChildOfClass("Humanoid")

                if Humanoid then

                    Humanoid.WalkSpeed =
                        getgenv().WalkSpeed

                    Humanoid.JumpPower =
                        getgenv().JumpPower

                end
            end

        end)

    end

end)

--====================================================
-- ANTI AFK
--====================================================

LocalPlayer.Idled:Connect(function()

    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())

end)

print("Zenith Hub Loaded Successfully")
