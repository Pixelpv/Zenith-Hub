local Farm = {}

--====================================================
-- GET MOB
--====================================================

function Farm:GetMob(Name)

    for _,v in pairs(workspace.Enemies:GetChildren()) do

        if v.Name == Name
        and v:FindFirstChild("Humanoid")
        and v.Humanoid.Health > 0 then

            return v

        end

    end

end

--====================================================
-- START FARM
--====================================================

function Farm:Start(Tween, Combat, Quest, Bring)

    task.spawn(function()

        while task.wait() do

            if getgenv().AutoFarm then

                local Data = Quest:CheckQuest()

                if Data then

                    Combat:AutoKen()

                    if not Quest:HasQuest() then

                        Tween:TweenTo(Data.QuestPos)

                        task.wait(1)

                        Quest:StartQuest(Data)

                    else

                        local Mob = self:GetMob(Data.Mob)

                        if Mob then

                            repeat task.wait()

                                Tween:TweenMob(Mob,20)

                                if getgenv().BringMob then
                                    Bring:BringMob(Data.Mob)
                                end

                                Combat:EquipWeapon(
                                    getgenv().SelectWeapon
                                )

                                Combat:Attack()

                            until not Mob
                            or Mob.Humanoid.Health <= 0
                            or not getgenv().AutoFarm

                        else

                            Tween:TweenTo(Data.MobPos)

                        end
                    end
                end
            end
        end
    end)

end

return Farm
