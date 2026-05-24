--// Zenith Hub - Loader

if getgenv().ZenithHubLoaded then
    return
end

getgenv().ZenithHubLoaded = true

repeat task.wait() until game:IsLoaded()

local Supported = {
    [2753915549] = true,
    [4442272183] = true,
    [7449423635] = true
}

if not Supported[game.PlaceId] then
    return warn("Game not supported.")
end

local URL =
"https://raw.githubusercontent.com/Pixelpv/Zenith-Hub/refs/heads/main/Main.lua"

local Success, Error = pcall(function()

    loadstring(game:HttpGet(URL))()

end)

if not Success then
    warn(Error)
end
