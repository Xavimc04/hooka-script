ESX = exports['es_extended']:getSharedObject(); 
Hookas = {}

ESX.RegisterUsableItem(Config.Item, function(playerId)
    local Player = ESX.GetPlayerFromId(playerId)

    Player.removeInventoryItem(Config.Item, 1)

    Player.triggerEvent('hooka:createObjectOnHand') 
end)