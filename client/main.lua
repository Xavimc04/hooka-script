ESX = exports['es_extended']:getSharedObject(); 
HookaObject = nil

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