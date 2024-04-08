RegisterNetEvent('hooka:createObjectOnHand', function() 
    HookaObject = createHookaOnHand()

    local pos = GetEntityCoords(GetPlayerPed(-1), true)

    RequestAnimDict("anim@heists@box_carry@")

    while (not HasAnimDictLoaded("anim@heists@box_carry@")) do
        Citizen.Wait(7)
    end

    TaskPlayAnim(GetPlayerPed(-1), "anim@heists@box_carry@", "idle", 5.0, -1, -1, 50, 0, false, false, false)
end)

RegisterNetEvent('hooka:syncLocations', function(locations)
    Hookas = locations
end)
