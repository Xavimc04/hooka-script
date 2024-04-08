ESX = exports['es_extended']:getSharedObject(); 
Hookas = {}

RegisterNetEvent('hooka:createHookaLocation', function(location)
    local src = source

    if not src then 
        return 
    end

    local Player = ESX.GetPlayerFromId(src)

    if not Player then 
        return 
    end

    table.insert(Hookas, {
        owner = {
            id = Player.identifier,
            name = Player.name
        },
        location = location
    })

    TriggerClientEvent('hooka:syncLocations', -1, Hookas)
end)