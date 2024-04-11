ESX = exports['es_extended']:getSharedObject(); 
Hookas = {}

-- @ Hooka object
ESX.RegisterUsableItem(Config.Item, function(playerId)
    local Player = ESX.GetPlayerFromId(playerId)

    Player.removeInventoryItem(Config.Item, 1)

    Player.triggerEvent('hooka:createObjectOnHand') 
end)

-- @ Milk: undrug item
ESX.RegisterUsableItem(Config.unDrugItem, function(playerId)
    local Player = ESX.GetPlayerFromId(playerId)

    Player.removeInventoryItem(Config.unDrugItem, 1)

    Player.triggerEvent('hooka:unDrug') 
end)

-- @ Consumables
for i, v in pairs(Config.Tobacco) do 
    ESX.RegisterUsableItem(v.item, function(playerId) 
        local Player = ESX.GetPlayerFromId(playerId)
        local PlayerCoords = GetEntityCoords(GetPlayerPed(playerId))

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
    end)
end