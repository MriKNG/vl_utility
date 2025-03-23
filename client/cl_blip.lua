--[Threads]--
Citizen.CreateThread(function()
    for i = 1, #Config.BlipList do
        local v = Config.BlipList[i]
        if v.radiusEnabled == true then
            local blip = AddBlipForRadius(v.coords.x, v.coords.y, v.coords.z, v.radius)
            SetBlipSprite(blip, v.sprite)
            SetBlipColour(blip, v.color)
            SetBlipAlpha(blip, v.transparency)
        
        elseif v.radiusEnabled == false then
            local blip = AddBlipForCoord(v.coords.x, v.coords.y, v.coords.z)
            SetBlipDisplay(blip, 4)
            SetBlipSprite(blip, v.sprite)
            SetBlipColour(blip, v.color)
            SetBlipScale(blip, v.scale)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(v.title)
            EndTextCommandSetBlipName(blip)
        end
    end
end)