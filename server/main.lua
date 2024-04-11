ESX = exports['es_extended']:getSharedObject(); 
Hookas = {}

ESX.RegisterUsableItem(Config.Item, function(playerId)
    local Player = ESX.GetPlayerFromId(playerId)

    Player.removeInventoryItem(Config.Item, 1)

    Player.triggerEvent('hooka:createObjectOnHand') 
end)

for i, v in pairs(Config.Tobacco) do 
    ESX.RegisterUsableItem(v.item, function(playerId) 
        local Player = ESX.GetPlayerFromId(playerId)
        local PlayerCoords = GetEntityCoords(GetPlayerPed(playerId))

        for m, n in pairs(Hookas) do 
            local distance = #(PlayerCoords - n.location)

            if distance < 2.0 then 
                Player.removeInventoryItem(v.item, 1)

                Hookas[m].tobacco = v
                Hookas[m].charge = 100

                TriggerClientEvent('hooka:syncLocations', -1, Hookas)
            end
        end
    end)
end