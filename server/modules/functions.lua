function setHookaTobacco(source, v) 
    local playerId = source 

    if not playerId then 
        return 
    end

    local Player = ESX.GetPlayerFromId(playerId)
    local PlayerCoords = GetEntityCoords(GetPlayerPed(playerId))

    if Player.getInventoryItem(v.item) and Player.getInventoryItem(v.item).count > 0 then
        for m, n in pairs(Hookas) do 
            if n then 
                local distance = #(PlayerCoords - n.location)
    
                if distance < 2.0 then 
                    Player.removeInventoryItem(v.item, 1)
    
                    Hookas[m].tobacco = v
                    Hookas[m].charge = 100
    
                    TriggerClientEvent('hooka:syncLocations', -1, Hookas)
                end
            end
        end
    else 
        Player.showNotification("No tienes tabaco...")
    end
end