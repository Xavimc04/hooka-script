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

    print(json.encode(Hookas))
end)

p_smoke_location = {
	20279,
}

p_smoke_particle = "exp_grd_bzgas_smoke"
p_smoke_particle_asset = "core" 

RegisterNetEvent("c_eff_smokes", function(c_ped, serverHookas)
    Hookas = serverHookas

	for _,bones in pairs(p_smoke_location) do
		if DoesEntityExist(NetToPed(c_ped)) and not IsEntityDead(NetToPed(c_ped)) then

			createdSmoke = UseParticleFxAssetNextCall(p_smoke_particle_asset)
			createdPart = StartParticleFxLoopedOnEntityBone(p_smoke_particle, NetToPed(c_ped), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, GetPedBoneIndex(NetToPed(c_ped), bones), 0.5, 0.0, 0.0, 0.0)
			
            Wait(3000) 
			
            while DoesParticleFxLoopedExist(createdSmoke) do
				StopParticleFxLooped(createdSmoke, 1)
			    
                Wait(0)
            end

			while DoesParticleFxLoopedExist(createdPart) do
				StopParticleFxLooped(createdPart, 1)
			    
                Wait(0)
			end

			while DoesParticleFxLoopedExist(p_smoke_particle) do
				StopParticleFxLooped(p_smoke_particle, 1)
			    
                Wait(0)
			end

			while DoesParticleFxLoopedExist(p_smoke_particle_asset) do
				StopParticleFxLooped(p_smoke_particle_asset, 1)
			
                Wait(0)
			end
			
            Wait(9000)
			
            RemoveParticleFxFromEntity(NetToPed(c_ped))
			
            break
		end
	end
end)

RegisterNetEvent('hooka:clientHoseAttatch', function()
    HoseObject = attatchHose()
end)