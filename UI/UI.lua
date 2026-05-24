print("UI STARTED")

game:GetService("StarterGui"):SetCore(
    "SendNotification",
    {
        Title = "Zenith Hub",
        Text = "UI Loaded",
        Duration = 5
    }
)

return true
