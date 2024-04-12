ESX = exports['es_extended']:getSharedObject(); 
Hookas = {}
HookaObject = nil
HoseObject = nil

p_smoke_location = {
	20279,
}

p_smoke_particle = "exp_grd_bzgas_smoke"
p_smoke_particle_asset = "core" 

CreateThread(function() 
    while true do
        local sleep = 1000
        local player = PlayerPedId()
        
        if HookaObject then 
            sleep = 0
            
            -- @ On press X
            if IsControlJustPressed(0, 73) then
                deleteHookaObject(HookaObject)
    
                -- @ Restore hooka variables
                HookaObject = nil
    
                -- @ Cancel animation
                ClearPedTasks(player)
            end
    
            -- @ On press E
            if IsControlJustPressed(0, 38) then
                currentHookaToFloor(HookaObject)
    
                -- @ Restore hooka variables
                HookaObject = nil
    
                -- @ Cancel animation
                ClearPedTasks(player)
            end

            -- @ Screen text
            screenText("[E] - Dejar en el suelo\n[X] - Cancelar")
        end

        for k, v in pairs(Hookas) do
            if v then  
                local distance = #(GetEntityCoords(player) - v.location)
    
                if distance < 2.0 then
                    sleep = 0
                    
                    local tobacco = v.tobacco and v.tobacco.label or "~r~Sin tabaco"
    
                    hookaText(v.location, "[~o~" .. v.charge .. "%~w~]\nHooka de ~b~" .. v.owner.name .. "\n~w~Tabaco: ~g~" .. tobacco, 0.9)
    
                    -- @ Screen text
                    if HoseObject then 
                        screenText("Presiona [X] para cancelar\nPresiona [E] para fumar")
                    else 
                        screenText("Presiona [E] para fumar\nPresiona [G] para abrir el menu")
                    end
    
                    -- @ On press E - Smoke 
                    if IsControlJustPressed(0, 38) and HoseObject then
                        if not v.tobacco or v.charge <= 0 then 
                            ESX.ShowNotification("Esta hooka no tiene tabaco...")
                        else   
                            TriggerServerEvent("eff_smokes", v.id, PedToNet(player))

                            if v.tobacco.hasDrugEffect ~= nil and v.tobacco.hasDrugEffect then
                                drugEffect()
                            end
                        end
                    end
    
                    -- @ On press E - Attach hose
                    if IsControlJustPressed(0, 38) and not HoseObject then 
                        TriggerServerEvent('hooka:attachHose', v.id)
                    end
    
                    -- @ On press X
                    if IsControlJustPressed(0, 73) and HoseObject then
                        deleteHoseObject(HoseObject, v.id)
                    end
    
                    -- @ On press G
                    if IsControlJustPressed(0, 47) and not HoseObject then 
                        interact(v)
                    end
                else 
                    if HoseObject then
                        deleteHoseObject(HoseObject, v.id)
                    end
                end
            end
        end

        Wait(sleep)
    end
end)