ESX = exports['es_extended']:getSharedObject(); 
HookaObject = nil

RegisterNetEvent('hooka:createObjectOnHand', function() 
    HookaObject = createHookaOnHand()

    local pos = GetEntityCoords(GetPlayerPed(-1), true)

    RequestAnimDict("anim@heists@box_carry@")

    while (not HasAnimDictLoaded("anim@heists@box_carry@")) do
        Citizen.Wait(7)
    end

    TaskPlayAnim(GetPlayerPed(-1), "anim@heists@box_carry@", "idle", 5.0, -1, -1, 50, 0, false, false, false)
end)

RegisterCommand('dettatch', function()
    deleteHookaObject(HookaObject)
end)

CreateThread(function() 
    while true do
        local sleep = 1000
        
        if HookaObject then 
            sleep = 0
            
            -- @ On press X
            if IsControlJustPressed(0, 73) then
                deleteHookaObject(HookaObject)
    
                -- @ Restore hooka variables
                HookaObject = nil
    
                -- @ Cancel animation
                ClearPedTasks(GetPlayerPed(-1))
            end
    
            -- @ On press E
            if IsControlJustPressed(0, 38) then
                currentHookaToFloor(HookaObject)
    
                -- @ Restore hooka variables
                HookaObject = nil
    
                -- @ Cancel animation
                ClearPedTasks(GetPlayerPed(-1))
            end

            -- @ Screen text
            screenText("[E] - Drop Hooka\n[X] - Cancel Hooka")
        end

        Wait(sleep)
    end
end)