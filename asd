local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local Enemies = Workspace:FindFirstChild("Enemies")

local CombatFramework = require(Players.LocalPlayer.PlayerScripts.CombatFramework)
local Camera = require(game.ReplicatedStorage.Util.CameraShaker)
local Player = Players.LocalPlayer
local Plv = Player.Data.Level.Value
local NotificationTemplate = ReplicatedStorage.Notification.NotificationTemplate
local PlayerTeam = nil
local PlayerGui = Player.PlayerGui
local QuestTitle = PlayerGui.Main.Quest.Container.QuestTitle.Title.Text

if Player.Team then
    PlayerTeamName = Player.Team.Name
end

if game:GetService("ReplicatedStorage").Effect.Container:FindFirstChild("Death") then
	game:GetService("ReplicatedStorage").Effect.Container.Death:Destroy()
end

if game:GetService("ReplicatedStorage").Effect.Container:FindFirstChild("Respawn") then
	game:GetService("ReplicatedStorage").Effect.Container.Respawn:Destroy()
end

function SendNotification(title, message)
    local StarterGui = game:GetService("StarterGui")
    StarterGui:SetCore("SendNotification", {
        Title = title,
        Text = message,
        Duration = 5
    })
    
    --Example usage SendNotification("Title", "Message")
end

function MakePlayerStatic()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 0
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = 0

    -- Create BodyVelocity to keep the player static
    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
    bodyVelocity.MaxForce = Vector3.new(0, math.huge, 0)
    bodyVelocity.Velocity = Vector3.new(0, 0, 0)

    if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
        game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
    end
end

function SetSpawnPoint()
    local args = {
        [1] = "SetSpawnPoint"
    }
    
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end

function RedeemAllCodes()
    local codes = {
        "24NOADMIN",
        "REWARDFUN",
        "Chandler",
        "NEWTROLL",
        "KITT_RESET",
        "Sub2CaptainMaui",
        "DEVSCOOKING",
        "kittgaming",
        "Sub2Fer999",
        "Enyu_is_Pro",
        "Magicbus",
        "JCWK",
        "Starcodeheo",
        "Bluxxy",
        "fudd10_v2",
        "SUB2GAMERROBOT_EXP1",
        "Sub2NoobMaster123",
        "Sub2UncleKizaru",
        "Sub2Daigrock",
        "Axiore",
        "TantaiGaming",
        "StrawHatMaine",
        "Sub2OfficialNoobie",
        "Fudd10",
        "Bignews",
        "TheGreatAce"
    }
    
    local function invokeCode(code)
        local args = {
            [1] = code:lower()
        }
        game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(unpack(args))
    end
    
    for _, code in ipairs(codes) do
        invokeCode(code)
    end
    
end

function BuyBuso()
    local args = {
        [1] = "BuyHaki",
        [2] = "Buso"
    }
    
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end

function BuyGeppo()
    local args = {
        [1] = "BuyHaki",
        [2] = "Geppo"
    }
    
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end

function BuySoru()
    local args = {
        [1] = "BuyHaki",
        [2] = "Soru"
    }
    
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end

function TravelSea1()
    local args = {
        [1] = "TravelMain"
    }

    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end

function TravelSea2()
    local args = {
        [1] = "TravelDressrosa"
    }

    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end

function TravelSea3()
    local args = {
        [1] = "TravelZou"
    }

    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end

function GetEnemies()
    if Enemies then
        if Plv < 10 and PlayerTeam == "Pirates" then
            return "Bandit"
            elseif Plv < 10 and PlayerTeam == "Marines" then
                return "Trainee"
                elseif Plv < 15 then
                    return "Monkey"
                    elseif Plv < 20 then
                        return "Gorilla"
                        elseif Plv < 30 and Enemies:FindFirstChild("Gorilla King") == true then
                            return "Gorilla King"
                            elseif Plv < 30 and Enemies:FindFirstChild("Gorilla King") == false then
                                return "Gorilla"
                                elseif Plv < 40 then
                                    return "Pirate"
                                    elseif Plv < 55 then
                                        return "Brute"
                                        elseif Plv < 60 and Enemies:FindFirstChild("Bobby") == true then
                                            return "Bobby"
                                            elseif Plv < 60 and Enemies:FindFirstChild("Bobby") == false then
                                                return "Brute"
                                                elseif Plv < 75 then
                                                    return "Desert Bandit"
                                                    elseif Plv < 90 then
                                                        return "Desert Officer"
                                                        elseif Plv < 100 then
                                                            return "Snow Bandit"
                                                            elseif Plv < 105 then
                                                                return "Snowman"
                                                                elseif Plv < 120 and Enemies:FindFirstChild("Yeti") == true then
                                                                    return "Yeti"
                                                                    elseif Plv < 120 and Enemies:FindFirstChild("Yeti") == false then
                                                                        return "Snowman"
                                                                        elseif Plv < 130 then
                                                                            return "Chief Petty Officer"
                                                                            elseif Plv < 150 and Enemies:FindFirstChild("Vice Admiral") == true then
                                                                                return "Vice Admiral"
                                                                                elseif Plv < 150 and Enemies:FindFirstChild("Vice Admiral") == false then
                                                                                    return "Chief Petty Officer"
                                                                                    elseif Plv < 175 then
                                                                                        return "Sky Bandit"
                                                                                        elseif Plv < 190 then
                                                                                            return "Dark Master"
                                                                                            elseif Plv < 210 then
                                                                                                return "Prisoner"
                                                                                                elseif Plv < 220 then
                                                                                                    return "Dangerous Prisoner"
                                                                                                    elseif Plv < 230 and Enemies:FindFirstChild("Warden") == true then
                                                                                                        return "Warden"
                                                                                                        elseif Plv < 230 and Enemies:FindFirstChild("Warden") == false then
                                                                                                            return "Dangerous Prisoner"
                                                                                                            elseif Plv < 240 and Enemies:FindFirstChild("Chief Warden") == true then
                                                                                                                return "Chief Warden"
                                                                                                                elseif Plv < 240 and Enemies:FindFirstChild("Chief Warden") == false then
                                                                                                                    return "Dangerous Prisoner"
                                                                                                                    elseif Plv < 250 and Enemies:FindFirstChild("Swan") == true then
                                                                                                                        return "Swan"
                                                                                                                        elseif Plv < 250 and Enemies:FindFirstChild("Swan") == false then
                                                                                                                            return "Dangerous Prisoner"
                                                                                                                            elseif Plv < 275 then
                                                                                                                                return "Toga Warrior"
                                                                                                                                elseif Plv < 300 then
                                                                                                                                    return "Gladiator"
                                                                                                                                    elseif Plv < 325 then
                                                                                                                                        return "Military Soldier"
                                                                                                                                        elseif Plv < 350 then
                                                                                                                                            return "Military Spy"
                                                                                                                                            elseif Plv < 375 and Enemies:FindFirstChild("Magma Admiral") == true then
                                                                                                                                                return "Magma Admiral"
                                                                                                                                                elseif Plv < 375 and Enemies:FindFirstChild("Magma Admiral") == false then
                                                                                                                                                    return "Military Spy"
                                                                                                                                                    elseif Plv < 400 then
                                                                                                                                                        return "Fishman Warrior"
                                                                                                                                                        elseif Plv < 425 then
                                                                                                                                                            return "Fishman Commando"
                                                                                                                                                            elseif Plv < 450 and Enemies:FindFirstChild("Fishman Lord") == true then
                                                                                                                                                                return "Fishman Lord"
                                                                                                                                                                elseif Plv < 450 and Enemies:FindFirstChild("Fishman Lord") == false then
                                                                                                                                                                    return "Fishman Commando"
                                                                                                                                                                    elseif Plv < 475 then
                                                                                                                                                                        return "God's Guard"
                                                                                                                                                                        elseif Plv < 500 then
                                                                                                                                                                            return "Shanda"
                                                                                                                                                                            elseif Plv < 525 and Enemies:FindFirstChild("Wysper") == true then
                                                                                                                                                                                return "Wysper"
                                                                                                                                                                                elseif Plv < 525 and Enemies:FindFirstChild("Wysper") == false then
                                                                                                                                                                                    return "Shanda"
                                                                                                                                                                                    elseif Plv < 550 then
                                                                                                                                                                                        return "Royal Squad"
                                                                                                                                                                                        elseif Plv < 575 then
                                                                                                                                                                                            return "Royal Soldier"
                                                                                                                                                                                            elseif Plv < 625 and Enemies:FindFirstChild("Thunder God") == true then
                                                                                                                                                                                                return "Thunder God"
                                                                                                                                                                                                elseif Plv < 625 and Enemies:FindFirstChild("Thunder God") == false then
                                                                                                                                                                                                    return "Royal Soldier"
                                                                                                                                                                                                    elseif Plv < 650 then
                                                                                                                                                                                                        return "Galley Pirate"
                                                                                                                                                                                                        elseif Plv < 675 then
                                                                                                                                                                                                            return "Galley Captain"
                                                                                                                                                                                                            elseif Plv < 700 and Enemies:FindFirstChild("Cyborg") == true then
                                                                                                                                                                                                                return "Cyborg"
                                                                                                                                                                                                                elseif Plv < 700 and Enemies:FindFirstChild("Cyborg") == false then
                                                                                                                                                                                                                    return "Galley Captain"
        end
    end
end

function QuestGiverTween(questgiver)
    local QuestGivers = {
        -- Sea 1
        ["Starter Marine"] = CFrame.new(-2708.10254, 26.8925819, 2104.27417, -0.560884118, 5.50769652e-09, -0.82789433, 3.35264616e-09, 1, 4.38129621e-09, 0.82789433, -3.18237187e-10, -0.560884118),
        ["Starter Pirate"] = CFrame.new(1060.21206, 16.4242878, 1547.9585, -0.861603439, 1.75376833e-08, 0.507582068, 1.64138978e-08, 1, -6.68938904e-09, -0.507582068, 2.56779953e-09, -0.861603439),
        ["Jungle"] = CFrame.new(-1601.08887, 36.8521271, 150.400146, -0.707439005, -1.15163312e-09, -0.706774414, -3.26426636e-10, 1, -1.30268751e-09, 0.706774414, -6.90861923e-10, -0.707439005),
        ["Pirate Village"] = CFrame.new(-1141.2594, 5.15192747, 3832.63672, -0.916973829, -1.9889128e-06, 0.398947328, -6.19779748e-05, 1, -0.000137469935, -0.398947328, -0.000150782289, -0.916973829),
        ["Desert"] = CFrame.new(896.559998, 6.43846273, 4388.14941, -0.857833326, -2.17943152e-09, 0.513927996, -8.44388381e-09, 1, -9.85354642e-09, -0.513927996, -1.2792249e-08, -0.857833326),
        ["Frozen Village"] = CFrame.new(1388.22864, 87.2727661, -1298.50464, -0.916132212, 1.06759956e-09, -0.400876194, 3.34863479e-08, 1, -7.38640011e-08, 0.400876194, -8.10930771e-08, -0.916132212),
        ["Marine Fortress"] = CFrame.new(-5037.51465, 28.6520329, 4326.37842, 0.92686516, 6.83009482e-10, 0.375394374, -1.67325354e-09, 1, 2.31189135e-09, -0.375394374, -2.77094148e-09, 0.92686516),
        ["Skylands"] = CFrame.new(-4842.5166, 717.669434, -2620.44873, -0.921464145, 4.65150478e-08, -0.388463378, 4.60941187e-08, 1, 1.04024505e-08, 0.388463378, -8.32039238e-09, -0.921464145),
        ["Prison"] = CFrame.new(5310.88818, 1.65538549, 478.812134, 0.995501876, -2.22777996e-09, -0.0947415233, 2.60841349e-10, 1, -2.07734878e-08, 0.0947415233, 2.06553334e-08, 0.995501876),
        ["Prison2"] = CFrame.new(5190.25, 3.53718281, 689.380981, -0.906486094, -1.45024774e-08, -0.422235638, 2.33690889e-09, 1, -3.93639255e-08, 0.422235638, -3.66695794e-08, -0.906486094),
        ["Colosseum"] = CFrame.new(-1578.94739, 7.38933802, -2984.87598, 0.496290118, -1.07166976e-07, 0.868156731, 4.26425579e-08, 1, 9.9064934e-08, -0.868156731, -1.21445245e-08, 0.496290118),
        ["Magma Village"] = CFrame.new(-5315.4165, 12.2368727, 8512.87988, -0.954062462, -9.46016776e-09, 0.299607724, -2.60392863e-08, 1, -5.13435978e-08, -0.299607724, -5.67865719e-08, -0.954062462),
        ["Underwater City WE"] = CFrame.new(4025.56396, 0.152037829, -1833.8667, -0.932673633, 0, -0.360721231, 0, 1, 0, 0.36072126, 0, -0.932673693),
        ["Underwater City"] = CFrame.new(61119.9805, 18.4716339, 1567.00598, 0.23579073, -7.78815206e-07, -0.971803904, 7.94835614e-07, 1, -6.08559446e-07, 0.971803904, -6.28931616e-07, 0.23579073),
        ["Underwater City WX"] = CFrame.new(61171.4492, 0.152037814, 1932.9209, -0.973970175, 0.0524592102, -0.220522657, 3.30523209e-09, 0.972852111, 0.231427655, 0.226676479, 0.225403637, -0.947528839),
        ["Upper SkylandsFP"] = CFrame.new(-4721.62012, 845.276978, -1951.4104, -0.992882609, -3.880813e-09, 0.11909733, -1.5147906e-08, 1, -9.36988229e-08, -0.11909733, -9.48360039e-08, -0.992882609),
        ["Upper SkylandsSP"] = CFrame.new(-7861.00049, 5545.4917, -381.237885, 0.381416231, 7.97652575e-08, -0.924403429, -8.75615314e-08, 1, 5.01597732e-08, 0.924403429, 6.18104252e-08, 0.381416231),
        ["Upper SkylandsTP"] = CFrame.new(-7902.93018, 5635.96289, -1409.79297, 0.0346125737, -2.81292367e-09, 0.999400795, -3.56963881e-08, 1, 4.05089517e-09, -0.999400795, -3.58152121e-08, 0.0346125737),
        ["Fountain City"] = CFrame.new(5255.96289, 38.5011292, 4051.75562, 0.116098627, 3.65993458e-08, -0.993237674, 5.83976174e-08, 1, 4.3674568e-08, 0.993237674, -6.30732728e-08, 0.116098627)
    }

    local targetCFrame = QuestGivers[questgiver]

    if targetCFrame then
        -- Save original WalkSpeed and JumpPower
        local originalWalkSpeed = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed
        local originalJumpPower = game.Players.LocalPlayer.Character.Humanoid.JumpPower

        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 0
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = 0

        -- Create BodyVelocity to keep the player static
        local bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
        bodyVelocity.MaxForce = Vector3.new(0, math.huge, 0)
        bodyVelocity.Velocity = Vector3.new(0, 0, 0)

        -- Function to extract the Y level from a CFrame
        local function getYLevelFromCFrame(cframe)
            return cframe.y
        end

        -- Function to teleport the player to a specific Y level
        local function teleportPlayerToYLevel(player, yLevel)
            -- Check if the player is valid
            if player and player.Character and player.Character:IsA("Model") then
                -- Get the player's character
                local character = player.Character

                -- Get the current position of the character
                local currentPosition = character.PrimaryPart.Position

                -- Teleport the player to the specified Y level
                character:SetPrimaryPartCFrame(CFrame.new(currentPosition.x, yLevel, currentPosition.z))
            end
        end

        -- Extract the Y level from the target CFrame
        local yLevel = getYLevelFromCFrame(targetCFrame)

        -- Teleport the player to the Y level
        local player = game.Players.LocalPlayer -- Change this to the actual player instance
        teleportPlayerToYLevel(player, yLevel)

        -- Calculate distance and speed for tweening
        local Distance = (targetCFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        local Speed = 350

        -- Create tween
        local tweenInfo = TweenInfo.new(Distance / Speed, Enum.EasingStyle.Linear)
        local tween = game:GetService("TweenService"):Create(
            game.Players.LocalPlayer.Character.HumanoidRootPart,
            tweenInfo,
            {CFrame = targetCFrame}
        )

        -- Connect completed event
        tween.Completed:Connect(function()
            AcceptQuest()

            -- Restore original WalkSpeed and JumpPower
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = originalWalkSpeed
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = originalJumpPower

            -- Destroy BodyVelocity
            bodyVelocity:Destroy()
        end)

        -- Play tween
        tween:Play()

        if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
            game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
        end
    end
end

function GetQuestGiver()
    if Plv < 10 and PlayerTeamName == "Pirates" then
        return "Starter Pirate"
        elseif Plv < 10 and PlayerTeamName == "Marines" then
            return "Starter Marine"
        elseif Plv < 30 then
            return "Jungle"
            elseif Plv < 60 then
                return "Pirate Village"
                elseif Plv < 90 then
                    return "Desert"
                    elseif Plv < 120 then
                        return "Frozen Village"
                        elseif Plv < 150 then
                            return "Marine Fortress"
                            elseif Plv < 190 then
                                return "Skylands"
                                elseif Plv < 210 then
                                    return "Prison"
                                    elseif Plv < 240 then
                                        return "Prison2"
                                        elseif Plv < 275 then
                                            return "Colosseum"
                                            elseif Plv < 350 then
                                                return "Magma Village"
                                                elseif Plv < 425 then
                                                    return "Underwater City"
                                                    elseif Plv < 475 then
                                                        return "Upper SkylandsFP"
                                                        elseif Plv < 500 then
                                                            return "Upper SkylandsSP"
                                                                elseif Plv < 575 then
                                                                    return "Upper SkylandsTP"
                                                                    elseif Plv < 700 then
                                                                        return "Fountain City"
    end
end

function AcceptQuest()
    if Plv < 10 and PlayerTeam == "Pirates" then
        local args = {
            [1] = "StartQuest",
            [2] = "BanditQuest1",
            [3] = 1
        }

        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        elseif Plv < 10 and PlayerTeam == "Marines" then
            local args = {
                [1] = "StartQuest",
                [2] = "MarineQuest",
                [3] = 1
            }
            
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            elseif Plv < 15 then
                local args = {
                    [1] = "StartQuest",
                    [2] = "JungleQuest",
                    [3] = 1
                }
        
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                elseif Plv < 20 then
                    local args = {
                        [1] = "StartQuest",
                        [2] = "JungleQuest",
                        [3] = 2
                    }
        
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                    elseif Plv < 30 then
                        local args = {
                            [1] = "StartQuest",
                            [2] = "JungleQuest",
                            [3] = 3
                        }
            
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                        elseif Plv < 40 then
                            local args = {
                                [1] = "StartQuest",
                                [2] = "BuggyQuest1",
                                [3] = 1
                            }
                            
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                            elseif Plv < 55 then
                                local args = {
                                    [1] = "StartQuest",
                                    [2] = "BuggyQuest1",
                                    [3] = 2
                                }
                                
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                elseif Plv < 60 and Enemies:FindFirstChild("Buggy") == true then
                                    local args = {
                                        [1] = "StartQuest",
                                        [2] = "BuggyQuest1",
                                        [3] = 3
                                    }
                                    
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                    elseif Plv < 60 and Enemies:FindFirstChild("Buggy") == false then
                                        local args = {
                                            [1] = "StartQuest",
                                            [2] = "BuggyQuest1",
                                            [3] = 2
                                        }
                                        
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                        elseif Plv < 75 then
                                            local args = {
                                                [1] = "StartQuest",
                                                [2] = "DesertQuest",
                                                [3] = 1
                                            }
                                            
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                            elseif Plv < 90 then
                                                local args = {
                                                    [1] = "StartQuest",
                                                    [2] = "DesertQuest",
                                                    [3] = 2
                                                }
                                                
                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                                elseif Plv < 100 then
                                                    local args = {
                                                        [1] = "StartQuest",
                                                        [2] = "SnowQuest",
                                                        [3] = 1
                                                    }
                                                    
                                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                                    elseif Plv < 105 then
                                                        local args = {
                                                            [1] = "StartQuest",
                                                            [2] = "SnowQuest",
                                                            [3] = 2
                                                        }
                                                        
                                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                                        elseif Plv < 120 and Enemies:FindFirstChild("Yeti") == true then
                                                            local args = {
                                                                [1] = "StartQuest",
                                                                [2] = "SnowQuest",
                                                                [3] = 3
                                                            }
                                                            
                                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                                            elseif Plv < 120 and Enemies:FindFirstChild("Yeti") == false then
                                                                local args = {
                                                                    [1] = "StartQuest",
                                                                    [2] = "SnowQuest",
                                                                    [3] = 2
                                                                }
                                                                
                                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                                                elseif Plv < 130 then
                                                                    local args = {
                                                                        [1] = "StartQuest",
                                                                        [2] = "MarineQuest2",
                                                                        [3] = 1
                                                                    }
                                                                    
                                                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                                                    elseif Plv < 150 and Enemies:FindFirstChild("Vice Admiral") == true then
                                                                        local args = {
                                                                            [1] = "StartQuest",
                                                                            [2] = "MarineQuest2",
                                                                            [3] = 2
                                                                        }
                                                                        
                                                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                                                        elseif Plv < 150 and Enemies:FindFirstChild("Vice Admiral") == false then
                                                                            local args = {
                                                                                [1] = "StartQuest",
                                                                                [2] = "MarineQuest2",
                                                                                [3] = 1
                                                                            }
                                                                            
                                                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                                                            elseif Plv < 175 then
                                                                                local args = {
                                                                                    [1] = "StartQuest",
                                                                                    [2] = "SkyQuest",
                                                                                    [3] = 1
                                                                                }
                                                                                
                                                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                                                                elseif Plv < 190 then
                                                                                    local args = {
                                                                                        [1] = "StartQuest",
                                                                                        [2] = "SkyQuest",
                                                                                        [3] = 2
                                                                                    }
                                                                                    
                                                                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                                                                    elseif Plv < 210 then
                                                                                        local args = {
                                                                                            [1] = "StartQuest",
                                                                                            [2] = "PrisonerQuest",
                                                                                            [3] = 1
                                                                                        }
                                                                                        
                                                                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                                                                        elseif Plv < 220 then
                                                                                            local args = {
                                                                                                [1] = "StartQuest",
                                                                                                [2] = "PrisonerQuest",
                                                                                                [3] = 2
                                                                                            }
                                                                                            
                                                                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                                                                            elseif Plv < 230 and Enemies:FindFirstChild("Warden") == true then
                                                                                                local args = {
                                                                                                    [1] = "StartQuest",
                                                                                                    [2] = "ImpelQuest",
                                                                                                    [3] = 1
                                                                                                }
                                                                                                
                                                                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                                                                                elseif Plv < 230 and Enemies:FindFirstChild("Warden") == false then
                                                                                                    local args = {
                                                                                                        [1] = "StartQuest",
                                                                                                        [2] = "PrisonerQuest",
                                                                                                        [3] = 2
                                                                                                    }
                                                                                                    
                                                                                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                                                                                    elseif Plv < 240 and Enemies:FindFirstChild("Chief Warden") == true then
                                                                                                        local args = {
                                                                                                            [1] = "StartQuest",
                                                                                                            [2] = "ImpelQuest",
                                                                                                            [3] = 2
                                                                                                        }
                                                                                                        
                                                                                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                                                                                        elseif Plv < 240 and Enemies:FindFirstChild("Chief Warden") == false then
                                                                                                            local args = {
                                                                                                                [1] = "StartQuest",
                                                                                                                [2] = "PrisonerQuest",
                                                                                                                [3] = 2
                                                                                                            }
                                                                                                            
                                                                                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                                                                                            elseif Plv < 250 and Enemies:FindFirstChild("Swan") == true then
                                                                                                                local args = {
                                                                                                                    [1] = "StartQuest",
                                                                                                                    [2] = "ImpelQuest",
                                                                                                                    [3] = 3
                                                                                                                }
                                                                                                                
                                                                                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                                                                                                elseif Plv < 250 and Enemies:FindFirstChild("Swan") == false then
                                                                                                                    local args = {
                                                                                                                        [1] = "StartQuest",
                                                                                                                        [2] = "PrisonerQuest",
                                                                                                                        [3] = 2
                                                                                                                    }
                                                                                                                    
                                                                                                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                                                                                                    elseif Plv < 275 then
                                                                                                                        local args = {
                                                                                                                            [1] = "StartQuest",
                                                                                                                            [2] = "ColosseumQuest",
                                                                                                                            [3] = 1
                                                                                                                        }
                                                                                                                        
                                                                                                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                                                                                                        elseif Plv < 300 then
                                                                                                                            local args = {
                                                                                                                                [1] = "StartQuest",
                                                                                                                                [2] = "ColosseumQuest",
                                                                                                                                [3] = 2
                                                                                                                            }
                                                                                                                            
                                                                                                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                                                                                                            elseif Plv < 325 then
                                                                                                                                local args = {
                                                                                                                                    [1] = "StartQuest",
                                                                                                                                    [2] = "MagmaQuest",
                                                                                                                                    [3] = 1
                                                                                                                                }
                                                                                                                                
                                                                                                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                                                                                                                elseif Plv < 350 then
                                                                                                                                    local args = {
                                                                                                                                        [1] = "StartQuest",
                                                                                                                                        [2] = "MagmaQuest",
                                                                                                                                        [3] = 2
                                                                                                                                    }
                                                                                                                                    
                                                                                                                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                                                                                                                    elseif Plv < 375 and Enemies:FindFirstChild("Magma Admiral") == true then
                                                                                                                                        local args = {
                                                                                                                                            [1] = "StartQuest",
                                                                                                                                            [2] = "MagmaQuest",
                                                                                                                                            [3] = 3
                                                                                                                                        }
                                                                                                                                        
                                                                                                                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                                                                                                                        elseif Plv < 375 and Enemies:FindFirstChild("Magma Admiral") == false then
                                                                                                                                            local args = {
                                                                                                                                                [1] = "StartQuest",
                                                                                                                                                [2] = "MagmaQuest",
                                                                                                                                                [3] = 2
                                                                                                                                            }
                                                                                                                                            
                                                                                                                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                                                                                                                            elseif Plv < 400 then
                                                                                                                                                local args = {
                                                                                                                                                    [1] = "StartQuest",
                                                                                                                                                    [2] = "FishmanQuest",
                                                                                                                                                    [3] = 1
                                                                                                                                                }
                                                                                                                                                
                                                                                                                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                                                                                                                                elseif Plv < 425 then
                                                                                                                                                    local args = {
                                                                                                                                                        [1] = "StartQuest",
                                                                                                                                                        [2] = "FishmanQuest",
                                                                                                                                                        [3] = 2
                                                                                                                                                    }
                                                                                                                                                    
                                                                                                                                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                                                                                                                                    elseif Plv < 450 and Enemies:FindFirstChild("Fishman Lord") == true then
                                                                                                                                                        local args = {
                                                                                                                                                            [1] = "StartQuest",
                                                                                                                                                            [2] = "FishmanQuest",
                                                                                                                                                            [3] = 3
                                                                                                                                                        }
                                                                                                                                                        
                                                                                                                                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                                                                                                                                        elseif Plv < 450 and Enemies:FindFirstChild("Fishman Lord") == false then
                                                                                                                                                            local args = {
                                                                                                                                                                [1] = "StartQuest",
                                                                                                                                                                [2] = "FishmanQuest",
                                                                                                                                                                [3] = 2
                                                                                                                                                            }
                                                                                                                                                            
                                                                                                                                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                                                                                                                                            elseif Plv < 475 then
                                                                                                                                                                local args = {
                                                                                                                                                                    [1] = "StartQuest",
                                                                                                                                                                    [2] = "SkyExp1Quest",
                                                                                                                                                                    [3] = 1
                                                                                                                                                                }
                                                                                                                                                                
                                                                                                                                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                                                                                                                                                elseif Plv < 500 then
                                                                                                                                                                    local args = {
                                                                                                                                                                        [1] = "StartQuest",
                                                                                                                                                                        [2] = "SkyExp1Quest",
                                                                                                                                                                        [3] = 2
                                                                                                                                                                    }
                                                                                                                                                                    
                                                                                                                                                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                                                                                                                                                    elseif Plv < 525 and Enemies:FindFirstChild("Wysper") == true then
                                                                                                                                                                        local args = {
                                                                                                                                                                            [1] = "StartQuest",
                                                                                                                                                                            [2] = "SkyExp1Quest",
                                                                                                                                                                            [3] = 3
                                                                                                                                                                        }
                                                                                                                                                                        
                                                                                                                                                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                                                                                                                                                        elseif Plv < 525 and Enemies:FindFirstChild("Wysper") == false then
                                                                                                                                                                            local args = {
                                                                                                                                                                                [1] = "StartQuest",
                                                                                                                                                                                [2] = "SkyExp1Quest",
                                                                                                                                                                                [3] = 2
                                                                                                                                                                            }
                                                                                                                                                                            
                                                                                                                                                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                                                                                                                                                        
                    end
end

function FastAttack()
    Camera:Stop()
    coroutine.wrap(function()
        game:GetService("RunService").Stepped:Connect(function()
            if getupvalues(CombatFramework)[2]['activeController'].timeToNextAttack then
                getupvalues(CombatFramework)[2]['activeController'].timeToNextAttack = 0
                getupvalues(CombatFramework)[2]['activeController'].hitboxMagnitude = 50
                getupvalues(CombatFramework)[2]['activeController']:attack()
            end
        end)
    end)()
end

function RemoveNotification()
    NotificationTemplate.TextTransparency = 1000
end

function CheckQuestTitle()
    local Enemy = GetEnemies()
    
    if string.find(QuestTitle, Enemy) then
        return true
    else
        return false
    end 
end

function AutoBuso()
    while true do
        if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
            wait(1.5) 
        end
    end
end

while CheckQuestTitle() == false do
    QuestGiverTween(GetQuestGiver())
end

QuestGiverTween()
