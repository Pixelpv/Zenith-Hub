print("Loading Fluent")

local Success, Fluent = pcall(function()

    return loadstring(game:HttpGet(
        "https://raw.githubusercontent.com/dawid-scripts/Fluent/main/source.lua"
    ))()

end)

print(Success)
print(Fluent)

if not Success then
    warn("Fluent failed")
    return
end

print("Creating Window")

local Window = Fluent:CreateWindow({
    Title = "Zenith Hub",
    SubTitle = "Blox Fruits",
    TabWidth = 160,
    Size = UDim2.fromOffset(580,460),
    Acrylic = false,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

print("Creating Tab")

local MainTab = Window:AddTab({
    Title = "Main",
    Icon = "home"
})

print("Creating Toggle")

MainTab:AddToggle("AutoFarm", {
    Title = "Auto Farm",
    Default = false,
    Callback = function(Value)
        getgenv().AutoFarm = Value
    end
})

print("Done")

return true
