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
        setHookaTobacco(playerId, v)
    end)
end