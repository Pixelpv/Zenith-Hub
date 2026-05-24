local TweenModule = {}

--// Services
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

--// Player
local LocalPlayer = Players.LocalPlayer

TweenModule.CurrentTween = nil

--====================================================
-- CHARACTER
--====================================================

function TweenModule:GetCharacter()
    return LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
end

function TweenModule:GetRoot()
    return self:GetCharacter():WaitForChild("HumanoidRootPart")
end

--====================================================
-- NO CLIP
--====================================================

function TweenModule:NoClip(State)

    if State then

        if self.NoClipConnection then
            return
        end

        self.NoClipConnection = RunService.Stepped:Connect(function()

            local Character = self:GetCharacter()

            for _,v in pairs(Character:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.CanCollide = false
                end
            end

        end)

    else

        if self.NoClipConnection then
            self.NoClipConnection:Disconnect()
            self.NoClipConnection = nil
        end

    end
end

--====================================================
-- STOP TWEEN
--====================================================

function TweenModule:StopTween()

    if self.CurrentTween then
        self.CurrentTween:Cancel()
        self.CurrentTween = nil
    end

end

--====================================================
-- TWEEN TO
--====================================================

function TweenModule:TweenTo(CF, Speed)

    local Root = self:GetRoot()

    local Distance = (Root.Position - CF.Position).Magnitude

    local TweenInfo_ = TweenInfo.new(
        Distance / (Speed or 300),
        Enum.EasingStyle.Linear
    )

    self.CurrentTween = TweenService:Create(
        Root,
        TweenInfo_,
        {CFrame = CF}
    )

    self.CurrentTween:Play()

    self.CurrentTween.Completed:Wait()

end

--====================================================
-- TWEEN MOB
--====================================================

function TweenModule:TweenMob(Mob, Distance)

    if Mob and Mob:FindFirstChild("HumanoidRootPart") then

        self:TweenTo(
            Mob.HumanoidRootPart.CFrame
            * CFrame.new(0, Distance or 20, 0)
        )

    end

end

return TweenModule
