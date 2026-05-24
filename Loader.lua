--[[
    Zenith Hub - Loader.lua
    Loader Oficial
    GitHub: Pixelpv/Zenith-Hub
]]

--====================================================
-- ANTI DUPLICATE
--====================================================

if getgenv().ZenithHubLoaded then
    warn("Zenith Hub already loaded.")
    return
end

getgenv().ZenithHubLoaded = true

--====================================================
-- GAME LOAD
--====================================================

repeat task.wait() until game:IsLoaded()

--====================================================
-- SUPPORTED GAMES
--====================================================

local SupportedGames = {

    -- Blox Fruits
    [2753915549] = true, -- Sea 1
    [4442272183] = true, -- Sea 2
    [7449423635] = true  -- Sea 3
}

if not SupportedGames[game.PlaceId] then

    game:GetService("StarterGui"):SetCore(
        "SendNotification",
        {
            Title = "Zenith Hub",
            Text = "Game not supported.",
            Duration = 5
        }
    )

    return
end

--====================================================
-- NOTIFICATION
--====================================================

pcall(function()

    game:GetService("StarterGui"):SetCore(
        "SendNotification",
        {
            Title = "Zenith Hub",
            Text = "Loading script...",
            Duration = 5
        }
    )

end)

--====================================================
-- MAIN URL
--====================================================

local MainURL =
"https://raw.githubusercontent.com/Pixelpv/Zenith-Hub/main/Main.lua"

--====================================================
-- LOAD MAIN
--====================================================

local Success, Error = pcall(function()

    loadstring(game:HttpGet(MainURL))()

end)

--====================================================
-- ERROR HANDLER
--====================================================

if not Success then

    warn("[Zenith Hub Error]:", Error)

    pcall(function()

        game:GetService("StarterGui"):SetCore(
            "SendNotification",
            {
                Title = "Zenith Hub Error",
                Text = tostring(Error),
                Duration = 10
            }
        )

    end)

end
