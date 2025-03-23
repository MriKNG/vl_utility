--[Variables]--
local isNearVehicle = false
local vehicle
local hasAlreadyEntered = false


--[Threads]--
--Vehicle Thread
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		for k,v in pairs (Config.VehicleList) do
			local playerCoords = GetEntityCoords(PlayerPedId())
			local dist = #(playerCoords - v.coords)
			
			if dist < Config.Distance and hasAlreadyEntered == false then
				TriggerEvent('nearVehicle', v.model, v.coords, v.heading)
				hasAlreadyEntered = true
			end
			if dist >= Config.Distance and dist <= Config.Distance + 1 then
				if Config.Fade then
					for i = 255, 0, -51 do
						Citizen.Wait(50)
						SetEntityAlpha(vehicle, i, false)
					end
				end
				hasAlreadyEntered = false
				DeleteVehicle(vehicle)
			end
		end
	end
end)


--[Event]--
--Vehicle Handler
AddEventHandler('nearVehicle', function(model, coords, heading)
	-- Request the models of the vehicles from the server, so they can be ready to spawn.
	RequestModel(GetHashKey(model))
	while not HasModelLoaded(GetHashKey(model)) do
		Citizen.Wait(1)
	end

	--Check if someones coordinate grabber thingy needs to subract 1 from Z or not.
	if Config.MinusOne then 
		local x, y, z = table.unpack(coords)
        vehicle = CreateVehicle(GetHashKey(model), x, y, z - 1, heading, false, true)
		
	else
        vehicle = CreateVehicle(GetHashKey(v.model), coords, heading, false, true)
	end
	
	SetEntityAlpha(vehicle, 0, false)
	
	if Config.Frozen then
		FreezeEntityPosition(vehicle, true) --Don't let the vehicle move.
	end
	
	if Config.Invincible then
		SetEntityInvincible(vehicle, true) --Don't let the vehicle break.
	end
	
	if Config.Fade then
		for i = 0, 255, 51 do
			Citizen.Wait(50)
			SetEntityAlpha(vehicle, i, false)
		end
	end
end)