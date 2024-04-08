-- @ Hooka
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
    
    TriggerServerEvent('hooka:createHookaLocation', playerCoords)

    return obj
end

-- @ Screen text
function screenText(text)
    ClearPrints()
    SetTextEntry_2("STRING")
    AddTextComponentString(text)
    DrawSubtitleTimed(1, 1)
end

-- @ Hose
function attatchHose() 
    local hash = GetHashKey('v_corp_boxpaprfd')
	local ped = PlayerPedId()

    RequestModel(hash)

    while not HasModelLoaded(hash) do
        Wait(100)
    end

	local obj = CreateObject(hash,  GetEntityCoords(PlayerPedId()),  true,  true, true)

    RequestNamedPtfxAsset("core")
    
    while not HasNamedPtfxAssetLoaded('core') do
        Wait(0)
    end
    
    UseParticleFxAsset("core")
    StartNetworkedParticleFxLoopedOnEntity("ent_anim_cig_smoke",obj,0,0,0.1, 0,0,0, 3.0, 0,0,0)

    local anim = "amb@world_human_clipboard@male@base"
    
    RequestAnimDict(anim)
    
    while not HasAnimDictLoaded(anim) do
        Wait(0)
    end
	
    local boneIndex = GetPedBoneIndex(ped, 0x67F2)

    TaskPlayAnim(ped, anim, "base",2.0, 2.0, -1, 49, 0, false, false, false)

	AttachEntityToEntity(obj, ped,  boneIndex, 0.15,-0.10,0.0,  -130.0, 310.0, 0.0,  true, true, false, true, 1, true)

    return obj
end

function deleteHoseObject(obj)
    DeleteEntity(obj)
end