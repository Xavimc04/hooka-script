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

    Hookas[#Hookas + 1] = {
        id = #Hookas + 1,
        owner = {
            id = Player.identifier,
            name = Player.name
        },
        charge = 100,
        location = location,
        isSomeoneSmoking = false
    }

    TriggerClientEvent('hooka:syncLocations', -1, Hookas)
end)

RegisterNetEvent("eff_smokes", function(hooka, entity)
    -- @ Remove charge on smoke
    if Hookas[hooka] then 
        Hookas[hooka].charge = Hookas[hooka].charge - 2
    end

	TriggerClientEvent("c_eff_smokes", -1, entity, Hookas)
end)

RegisterNetEvent('hooka:attachHose', function(hooka)
    local src = source

    if not src then 
        return 
    end

    if Hookas[hooka] then 
        if Hookas[hooka].isSomeoneSmoking then 
            return Player.showNotification("Alguien está fumando en esta hooka") 
        end

        Hookas[hooka].isSomeoneSmoking = src
    end

    TriggerClientEvent('hooka:clientHoseAttatch', src)
end)