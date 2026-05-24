--// Zenith Hub - Loader

if getgenv().ZenithHubLoaded then
    warn("Zenith Hub already loaded.")
    return
end

getgenv().ZenithHubLoaded = true

repeat task.wait() until game:IsLoaded()

--====================================================
-- SUPPORTED GAMES
--====================================================

local Supported = {
    [2753915549] = true, -- Sea 1
    [4442272183] = true, -- Sea 2
    [7449423635] = true  -- Sea 3
}

if not Supported[game.PlaceId] then
    return warn("Game not supported.")
end

--====================================================
-- LOAD MAIN
--====================================================

local Success, Error = pcall(function()

    loadstring(game:HttpGet(
        "https://raw.githubusercontent.com/Pixelpv/Zenith-Hub/main/Main.lua"
    ))()

end)

if not Success then
    warn("Loader Error:", Error)
end
