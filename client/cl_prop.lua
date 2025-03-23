--[Variables]--
local isNearProp = false
local prop
local hasAlreadyEntered = false


--[Threads]--
--Prop Thread
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		for k,v in pairs (Config.PropList) do
			local playerCoords = GetEntityCoords(PlayerPedId())
			local dist = #(playerCoords - v.coords)
			
			if dist < Config.Distance and hasAlreadyEntered == false then
				TriggerEvent('nearProp', v.model, v.coords, v.heading)
				hasAlreadyEntered = true
			end
			if dist >= Config.Distance and dist <= Config.Distance + 1 then
				if Config.Fade then
					for i = 255, 0, -51 do
						Citizen.Wait(50)
						SetEntityAlpha(prop, i, false)
					end
				end
				hasAlreadyEntered = false
				DeleteObject(prop)
			end
		end
	end
end)


--[Event]--
--Prop Handler
AddEventHandler('nearProp', function(model, coords, heading)
	-- Request the models of the props from the server, so they can be ready to spawn.
	RequestModel(GetHashKey(model))
	while not HasModelLoaded(GetHashKey(model)) do
		Citizen.Wait(1)
	end

	--Check if someones coordinate grabber thingy needs to subract 1 from Z or not.
	if Config.MinusOne then 
		local x, y, z = table.unpack(coords)
        prop = CreateObject(GetHashKey(model), x, y, z - 1, heading, false, true)
		
	else
        prop = CreateObject(GetHashKey(v.model), coords, heading, false, true)
	end
	
	SetEntityAlpha(prop, 0, false)
	
	if Config.Frozen then
		FreezeEntityPosition(prop, true) --Don't let the prop move.
	end
	
	if Config.Invincible then
		SetEntityInvincible(prop, true) --Don't let the prop break.
	end
	
	if Config.Fade then
		for i = 0, 255, 51 do
			Citizen.Wait(50)
			SetEntityAlpha(prop, i, false)
		end
	end
end)