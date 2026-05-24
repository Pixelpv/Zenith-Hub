--// Zenith Hub - UI.lua

local Fluent = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/dawid-scripts/Fluent/main/source.lua"
))()

local SaveManager = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"
))()

local InterfaceManager = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"
))()

--====================================================
-- WINDOW
--====================================================

local Window = Fluent:CreateWindow({
    Title = "Zenith Hub",
    SubTitle = "Blox Fruits",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

--====================================================
-- TABS
--====================================================

local Tabs = {

    Main = Window:AddTab({
        Title = "🏠 Main Farm",
        Icon = "home"
    }),

    Bosses = Window:AddTab({
        Title = "💀 Bosses",
        Icon = "skull"
    }),

    Sea = Window:AddTab({
        Title = "🌊 Sea Events",
        Icon = "waves"
    }),

    Fruits = Window:AddTab({
        Title = "🍎 Fruits",
        Icon = "apple"
    }),

    Items = Window:AddTab({
        Title = "📜 Items/Quest",
        Icon = "scroll"
    }),

    Fighting = Window:AddTab({
        Title = "🔥 Fighting",
        Icon = "flame"
    }),

    Raids = Window:AddTab({
        Title = "⚔️ Raids",
        Icon = "sword"
    }),

    Races = Window:AddTab({
        Title = "⚡ Races/V4",
        Icon = "moon"
    }),

    Dragon = Window:AddTab({
        Title = "🐉 Dragon/Dojo",
        Icon = "dragon"
    }),

    Player = Window:AddTab({
        Title = "👤 Player",
        Icon = "user"
    }),

    Teleports = Window:AddTab({
        Title = "🗺️ Teleports",
        Icon = "map"
    }),

    Visuals = Window:AddTab({
        Title = "👁️ Visuals",
        Icon = "eye"
    }),

    Server = Window:AddTab({
        Title = "🌐 Server",
        Icon = "globe"
    }),

    Settings = Window:AddTab({
        Title = "⚙️ Settings",
        Icon = "settings"
    })
}

--====================================================
-- MAIN FARM
--====================================================

Tabs.Main:AddToggle("AutoFarm", {
    Title = "Auto Farm Level",
    Default = false,
    Callback = function(Value)
        getgenv().AutoFarm = Value
    end
})

Tabs.Main:AddToggle("AutoQuest", {
    Title = "Auto Quest",
    Default = true,
    Callback = function(Value)
        getgenv().AutoQuest = Value
    end
})

Tabs.Main:AddDropdown("SelectWeapon", {
    Title = "Select Weapon",
    Values = {
        "Melee",
        "Sword",
        "Blox Fruit",
        "Gun"
    },
    Multi = false,
    Default = 1,
    Callback = function(Value)
        getgenv().SelectWeapon = Value
    end
})

Tabs.Main:AddSlider("TweenSpeed", {
    Title = "Tween Speed",
    Description = "Movement Speed",
    Default = 300,
    Min = 100,
    Max = 1000,
    Rounding = 0,
    Callback = function(Value)
        getgenv().TweenSpeed = Value
    end
})

--====================================================
-- BOSSES
--====================================================

Tabs.Bosses:AddToggle("AutoBoss", {
    Title = "Auto Boss Farm",
    Default = false,
    Callback = function(Value)
        getgenv().AutoBoss = Value
    end
})

Tabs.Bosses:AddDropdown("BossSelect", {
    Title = "Select Boss",
    Values = {
        "The Gorilla King",
        "Bobby",
        "Yeti",
        "Vice Admiral",
        "Saber Expert",
        "Don Swan",
        "Cake Queen",
        "Longma"
    },
    Multi = false,
    Default = 1,
    Callback = function(Value)
        getgenv().SelectedBoss = Value
    end
})

--====================================================
-- SEA EVENTS
--====================================================

Tabs.Sea:AddToggle("AutoSeaBeast", {
    Title = "Auto Sea Beast",
    Default = false,
    Callback = function(Value)
        getgenv().AutoSeaBeast = Value
    end
})

Tabs.Sea:AddToggle("AutoLeviathan", {
    Title = "Auto Leviathan",
    Default = false,
    Callback = function(Value)
        getgenv().AutoLeviathan = Value
    end
})

Tabs.Sea:AddToggle("AutoTerrorShark", {
    Title = "Auto Terror Shark",
    Default = false,
    Callback = function(Value)
        getgenv().AutoTerrorShark = Value
    end
})

--====================================================
-- FRUITS
--====================================================

Tabs.Fruits:AddToggle("AutoCollectFruit", {
    Title = "Auto Collect Fruits",
    Default = false,
    Callback = function(Value)
        getgenv().AutoCollectFruit = Value
    end
})

Tabs.Fruits:AddToggle("AutoStoreFruit", {
    Title = "Auto Store Fruits",
    Default = false,
    Callback = function(Value)
        getgenv().AutoStoreFruit = Value
    end
})

--====================================================
-- ITEMS / QUEST
--====================================================

Tabs.Items:AddToggle("AutoCDK", {
    Title = "Auto CDK",
    Default = false,
    Callback = function(Value)
        getgenv().AutoCDK = Value
    end
})

Tabs.Items:AddToggle("AutoSoulGuitar", {
    Title = "Auto Soul Guitar",
    Default = false,
    Callback = function(Value)
        getgenv().AutoSoulGuitar = Value
    end
})

Tabs.Items:AddToggle("AutoQuestItems", {
    Title = "Auto Quest Items",
    Default = false,
    Callback = function(Value)
        getgenv().AutoQuestItems = Value
    end
})

--====================================================
-- FIGHTING
--====================================================

Tabs.Fighting:AddToggle("FastAttack", {
    Title = "Fast Attack",
    Default = true,
    Callback = function(Value)
        getgenv().FastAttack = Value
    end
})

Tabs.Fighting:AddToggle("AutoKen", {
    Title = "Auto Ken",
    Default = true,
    Callback = function(Value)
        getgenv().AutoKen = Value
    end
})

Tabs.Fighting:AddToggle("BringMob", {
    Title = "Bring Mobs",
    Default = true,
    Callback = function(Value)
        getgenv().BringMob = Value
    end
})

Tabs.Fighting:AddToggle("AutoSkillZ", {
    Title = "Auto Skill Z",
    Default = false,
    Callback = function(Value)
        getgenv().AutoSkillZ = Value
    end
})

Tabs.Fighting:AddToggle("AutoSkillX", {
    Title = "Auto Skill X",
    Default = false,
    Callback = function(Value)
        getgenv().AutoSkillX = Value
    end
})

Tabs.Fighting:AddToggle("AutoSkillC", {
    Title = "Auto Skill C",
    Default = false,
    Callback = function(Value)
        getgenv().AutoSkillC = Value
    end
})

Tabs.Fighting:AddToggle("AutoSkillV", {
    Title = "Auto Skill V",
    Default = false,
    Callback = function(Value)
        getgenv().AutoSkillV = Value
    end
})

Tabs.Fighting:AddToggle("AutoSkillF", {
    Title = "Auto Skill F",
    Default = false,
    Callback = function(Value)
        getgenv().AutoSkillF = Value
    end
})

--====================================================
-- RAIDS
--====================================================

Tabs.Raids:AddToggle("AutoRaid", {
    Title = "Auto Raid",
    Default = false,
    Callback = function(Value)
        getgenv().AutoRaid = Value
    end
})

Tabs.Raids:AddToggle("AutoAwakening", {
    Title = "Auto Awakening",
    Default = false,
    Callback = function(Value)
        getgenv().AutoAwakening = Value
    end
})

--====================================================
-- RACES / V4
--====================================================

Tabs.Races:AddToggle("AutoRaceV4", {
    Title = "Auto Race V4",
    Default = false,
    Callback = function(Value)
        getgenv().AutoRaceV4 = Value
    end
})

Tabs.Races:AddToggle("AutoTrial", {
    Title = "Auto Trial",
    Default = false,
    Callback = function(Value)
        getgenv().AutoTrial = Value
    end
})

--====================================================
-- DRAGON / DOJO
--====================================================

Tabs.Dragon:AddToggle("AutoDragon", {
    Title = "Auto Dragon",
    Default = false,
    Callback = function(Value)
        getgenv().AutoDragon = Value
    end
})

Tabs.Dragon:AddToggle("AutoDojo", {
    Title = "Auto Dojo",
    Default = false,
    Callback = function(Value)
        getgenv().AutoDojo = Value
    end
})

--====================================================
-- PLAYER
--====================================================

Tabs.Player:AddSlider("WalkSpeed", {
    Title = "Walk Speed",
    Default = 16,
    Min = 16,
    Max = 100,
    Rounding = 0,
    Callback = function(Value)
        getgenv().WalkSpeed = Value
    end
})

Tabs.Player:AddSlider("JumpPower", {
    Title = "Jump Power",
    Default = 50,
    Min = 50,
    Max = 150,
    Rounding = 0,
    Callback = function(Value)
        getgenv().JumpPower = Value
    end
})

Tabs.Player:AddToggle("NoClip", {
    Title = "No Clip",
    Default = false,
    Callback = function(Value)
        getgenv().NoClip = Value
    end
})

--====================================================
-- TELEPORTS
--====================================================

Tabs.Teleports:AddButton({
    Title = "Teleport Starter Island",
    Callback = function()

        local HRP = game.Players.LocalPlayer.Character.HumanoidRootPart

        HRP.CFrame = CFrame.new(1060,16,1547)

    end
})

Tabs.Teleports:AddButton({
    Title = "Teleport Cafe",
    Callback = function()

        local HRP = game.Players.LocalPlayer.Character.HumanoidRootPart

        HRP.CFrame = CFrame.new(-385,73,297)

    end
})

Tabs.Teleports:AddButton({
    Title = "Teleport Mansion",
    Callback = function()

        local HRP = game.Players.LocalPlayer.Character.HumanoidRootPart

        HRP.CFrame = CFrame.new(-12463,374,-7551)

    end
})

--====================================================
-- VISUALS
--====================================================

Tabs.Visuals:AddToggle("FullBright", {
    Title = "Full Bright",
    Default = false,
    Callback = function(Value)
        getgenv().FullBright = Value
    end
})

Tabs.Visuals:AddToggle("ESP", {
    Title = "Player ESP",
    Default = false,
    Callback = function(Value)
        getgenv().ESP = Value
    end
})

--====================================================
-- SERVER
--====================================================

Tabs.Server:AddButton({
    Title = "Rejoin Server",
    Callback = function()

        game:GetService("TeleportService"):Teleport(
            game.PlaceId,
            game.Players.LocalPlayer
        )

    end
})

Tabs.Server:AddButton({
    Title = "Server Hop",
    Callback = function()

        print("Server Hop")

    end
})

--====================================================
-- SETTINGS
--====================================================

Tabs.Settings:AddButton({
    Title = "Unload Script",
    Callback = function()

        Fluent:Destroy()

    end
})

Tabs.Settings:AddButton({
    Title = "Copy Discord",
    Callback = function()

        setclipboard("https://discord.gg/zenithhub")

    end
})

--====================================================
-- SAVE MANAGER
--====================================================

SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})

InterfaceManager:SetFolder("ZenithHub")
SaveManager:SetFolder("ZenithHub/BloxFruits")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)

Window:SelectTab(1)

--====================================================
-- NOTIFY
--====================================================

Fluent:Notify({
    Title = "Zenith Hub",
    Content = "UI Loaded Successfully",
    Duration = 5
})

SaveManager:LoadAutoloadConfig()
