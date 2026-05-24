local Bring = {}

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

--====================================================
-- BRING MOBS
--====================================================

function Bring:BringMob(Name)

    local Character = LocalPlayer.Character
    if not Character then return end

    local Root = Character:FindFirstChild("HumanoidRootPart")
    if not Root then return end

    for _,v in pairs(workspace.Enemies:GetChildren()) do

        if v.Name == Name
        and v:FindFirstChild("Humanoid")
        and v.Humanoid.Health > 0
        and v:FindFirstChild("HumanoidRootPart") then

            pcall(function()

                v.HumanoidRootPart.CanCollide = false
                v.HumanoidRootPart.Size = Vector3.new(60,60,60)

                v.HumanoidRootPart.CFrame =
                    Root.CFrame * CFrame.new(0,0,-5)

                v.HumanoidRootPart.Velocity = Vector3.zero

            end)

        end

    end

end

return Bring
