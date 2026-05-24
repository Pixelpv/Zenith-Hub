print("1")

repeat task.wait() until game:IsLoaded()

print("2")

local BASE_URL =
"https://raw.githubusercontent.com/Pixelpv/Zenith-Hub/main/"

print("3")

local Success, Result = pcall(function()

    return game:HttpGet(
        BASE_URL .. "Modules/Tween.lua"
    )

end)

print("4")

print(Success)
print(Result)

print("5")
