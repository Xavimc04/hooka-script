RegisterCommand('hooka', function(source, args)
    local src = source 
    
    if not src then
        return
    end

    local Player = ESX.GetPlayerFromId(src)

    if Player.getJob().name == Config.AllowedJob or (Player.getGroup() ~= 'user' and Config.isAdminAllowed) then
       return Player.triggerEvent('hooka:createObjectOnHand') 
    end

    Player.showNotification("No tienes permisos para ejecutar este comando")
end)