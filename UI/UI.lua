--// Zenith Hub UI

local Fluent = loadstring(game:HttpGet(
    "https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"
))()

local Window = Fluent:CreateWindow({
    Title = "Zenith Hub",
    SubTitle = "Blox Fruits",
    TabWidth = 160,
    Size = UDim2.fromOffset(580,460),
    Acrylic = true,
    Theme = "Dark"
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
        Icon = "file-text"
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
        Icon = "flame"
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
-- MAIN
--====================================================

Tabs.Main:AddToggle("AutoFarm", {
    Title = "Auto Farm",
    Default = false,
    Callback = function(Value)
        getgenv().AutoFarm = Value
    end
})

Tabs.Main:AddToggle("BringMob", {
    Title = "Bring Mob",
    Default = true,
    Callback = function(Value)
        getgenv().BringMob = Value
    end
})

Tabs.Main:AddSlider("TweenSpeed", {
    Title = "Tween Speed",
    Default = 300,
    Min = 100,
    Max = 1000,
    Rounding = 0,
    Callback = function(Value)
        getgenv().TweenSpeed = Value
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
-- VISUALS
--====================================================

Tabs.Visuals:AddToggle("FullBright", {
    Title = "Full Bright",
    Default = false,
    Callback = function(Value)
        getgenv().FullBright = Value
    end
})

--====================================================
-- NOTIFY
--====================================================

Fluent:Notify({
    Title = "Zenith Hub",
    Content = "Loaded Successfully",
    Duration = 5
})

return true
