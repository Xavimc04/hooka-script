ESX = exports['es_extended']:getSharedObject(); 
Hookas = {}
HookaObject = nil
HoseObject = nil

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
            screenText("[E] - Dejar en el suelo\n[X] - Cancelar")
        end

        for k, v in pairs(Hookas) do
            local distance = #(GetEntityCoords(PlayerPedId()) - v.location)

            if distance < 2.0 then
                sleep = 0

                -- @ Screen text
                if HoseObject then 
                    screenText("Presiona [X] para cancelar")
                else 
                    screenText("Hooka de ~b~" .. v.owner.name .. "~w~\nPresiona [E] para fumar")
                end

                -- @ On press E
                if IsControlJustPressed(0, 38) and not HoseObject then
                    HoseObject = attatchHose()
                end

                -- @ On press X
                if IsControlJustPressed(0, 73) and HoseObject then
                    deleteHoseObject(HoseObject)

                    -- @ Restore hose variables
                    HoseObject = nil

                    -- @ Cancel animation
                    ClearPedTasks(GetPlayerPed(-1))
                end
            else 
                if HoseObject then
                    deleteHoseObject(HoseObject)

                    -- @ Restore hose variables
                    HoseObject = nil

                    -- @ Cancel animation
                    ClearPedTasks(GetPlayerPed(-1))
                end
            end
        end

        Wait(sleep)
    end
end)