--// Zenith Hub - Main.lua
--// Versão atualizada e mais estável

repeat task.wait() until game:IsLoaded()

--====================================================
-- SERVICES
--====================================================

local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local VirtualUser = game:GetService("VirtualUser")

local LocalPlayer = Players.LocalPlayer

--====================================================
-- GLOBAL DEFAULTS
--====================================================

getgenv().AutoFarm = false
getgenv().BringMob = true
getgenv().TweenSpeed = 300
getgenv().SelectWeapon = "Melee"

getgenv().NoClip = false
getgenv().FullBright = false
getgenv().WalkSpeed = 16
getgenv().JumpPower = 50

getgenv().AutoSkillZ = false
getgenv().AutoSkillX = false
getgenv().AutoSkillC = false
getgenv().AutoSkillV = false
getgenv().AutoSkillF = false

--====================================================
-- BASE URL
--====================================================

local BASE_URL = "https://raw.githubusercontent.com/Pixelpv/Zenith-Hub/main/"

--====================================================
-- MODULE LOADER
--====================================================

local function LoadFile(path)
    local ok, result = pcall(function()
        return loadstring(game:HttpGet(BASE_URL .. path))()
    end)

    if not ok then
        warn("[Zenith Hub] Failed to load:", path)
        warn(result)
        return nil
    end

    return result
end

local function MustLoad(path)
    local module = LoadFile(path)
    if module == nil then
        error("[Zenith Hub] Critical module failed: " .. path)
    end
    return module
end

--====================================================
-- LOAD MODULES
--====================================================

print("[Zenith Hub] Loading modules...")

local Tween = MustLoad("Modules/Tween.lua")
local Combat = MustLoad("Modules/Combat.lua")
local Quest = MustLoad("Modules/Quest.lua")
local Bring = MustLoad("Modules/Bring.lua")
local Farm = MustLoad("Modules/Farm.lua")

print("[Zenith Hub] Modules loaded.")

--====================================================
-- LOAD GAME FILE
--====================================================

local GameModule = LoadFile("Games/BloxFruits.lua")
if GameModule then
    print("[Zenith Hub] Game module loaded:", GameModule.GameName or "Unknown")
end

--====================================================
-- LOAD UI
--====================================================

local UI = LoadFile("UI/UI.lua")
if not UI then
    warn("[Zenith Hub] UI failed to load.")
end

--====================================================
-- START FARM LOOP
--====================================================

if Farm and Tween and Combat and Quest and Bring then
    Farm:Start(Tween, Combat, Quest, Bring)
end

--====================================================
-- NOCLIP LOOP
--====================================================

task.spawn(function()
    while task.wait(0.1) do
        pcall(function()
            if getgenv().NoClip and Tween then
                Tween:NoClip(true)
            elseif Tween then
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
                Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
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
            local Character = LocalPlayer.Character
            if Character then
                local Humanoid = Character:FindFirstChildOfClass("Humanoid")
                if Humanoid then
                    Humanoid.WalkSpeed = getgenv().WalkSpeed or 16
                    Humanoid.JumpPower = getgenv().JumpPower or 50
                end
            end
        end)
    end
end)

--====================================================
-- AUTO SKILLS LOOP
--====================================================

task.spawn(function()
    while task.wait(0.35) do
        pcall(function()
            if not Combat then
                return
            end

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
        end)
    end
end)

--====================================================
-- ANTI AFK
--====================================================

LocalPlayer.Idled:Connect(function()
    pcall(function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end)
end)

--====================================================
-- STARTUP LOG
--====================================================

print("====================================")
print("Zenith Hub Loaded")
print("Modules:")
print("- Tween")
print("- Combat")
print("- Quest")
print("- Bring")
print("- Farm")
print("- BloxFruits")
print("====================================")
