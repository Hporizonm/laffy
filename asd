local player = game.Players.LocalPlayer

-- Check if the player exists
if player then
    -- Kick the player
    player:Kick("You have been kicked from the game.")
else
    print("Local player not found.")
end
