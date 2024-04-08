function createHookaObject()
    local obj =  CreateObject(4037417364, GetEntityCoords(PlayerPedId()), false, 0, false)

    NetworkRegisterEntityAsNetworked(obj)
    SetNetworkIdCanMigrate(NetworkGetNetworkIdFromEntity(obj), true)
    SetNetworkIdExistsOnAllMachines(NetworkGetNetworkIdFromEntity(obj), true)
    NetworkSetNetworkIdDynamic(NetworkGetNetworkIdFromEntity(obj), false) 

    return obj
end

function createHookaOnHand() 
    local obj = createHookaObject()

    AttachEntityToEntity(obj, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 60309), 0.025, 0.00, 0.355, 220.0, 470.0, 0.0, true, true, false, true, 1, true)

    return obj
end

function deleteHookaObject(obj)
    DeleteEntity(obj)
end

function currentHookaToFloor(currentHooka) 
    deleteHookaObject(currentHooka)

    local obj = createHookaObject()
    local playerCoords = GetEntityCoords(PlayerPedId())
    local floorCoords = vector3(playerCoords.x, playerCoords.y, playerCoords.z - 0.7)

    SetEntityCoords(obj, floorCoords)
    FreezeEntityPosition(obj, true)

    return obj
end

function screenText(text)
    ClearPrints()
    SetTextEntry_2("STRING")
    AddTextComponentString(text)
    DrawSubtitleTimed(1, 1)
end