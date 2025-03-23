--FiveM's list of Ped Models can be found here: https://docs.fivem.net/docs/game-references/ped-models/
--FiveM's list of Vehicle Models can be found here: https://docs.fivem.net/docs/game-references/vehicle-models/
--A list of all props can be found here: https://forge.plebmasters.de/objects or here: https://gtahash.ru/
--A list of all the animations can be found here: https://alexguirre.github.io/animations-list/
--A list of blip icon can be found here: https://docs.fivem.net/docs/game-references/blips/
--A list of blip colors can be found here: https://docs.fivem.net/docs/game-references/blips/#blip-colors

Config = {}
Config.Invincible = true --If enabled peds / objects / vehiles are uanble to be damaged
Config.Frozen = true --If enabled peds / objects / vehicles are unable to be moved
Config.Stoic = true --If enabled peds are unaware of their surroundings
Config.Fade = true --If enabled, peds / objects / vehicles fade in and out instead of popping in
Config.Distance = 15.0 --The Distance where peds / objects / vehicles render

Config.MinusOne = true

Config.PedList = {
    --Premium Deluxe Motorsports - Salesman
    {
        model = "a_m_y_smartcaspat_01", --Model name for ped https://docs.fivem.net/docs/game-references/ped-models/
        coords = vec3(-56.75, -1099.22, 26.42), --Vector 3 coordinates where the ped will spawn
        heading = 17.41, --Must be a float value. This means it needs a decimal and a number after the decimal.
        gender = "male", --Use "male" or "female"
        --animDict = "",  --The animation dictionary. Optional. Comment out or delete if not using.
        --animName = "", --The animation name. Optional. Comment out or delete if not using.
    },
}

Config.PropList = {
    --Premium Deluxe Motorsports - Vending Machine
    {
        model = "prop_vend_coffe_01", --Model name for prop https://forge.plebmasters.de/objects or here: https://gtahash.ru/
        coords = vector3(-52.43, -1088.05, 26.42), --Vector 3 coordinates where the prop will spawn
        heading = 158.64, --Must be a float value. This means it needs a decimal and a number after the decimal.
    },
}

Config.VehicleList = {
    --Premium Deluxe Motorsports - Vehicle
    {
        model = "adder", --Model name for vehicle https://docs.fivem.net/docs/game-references/vehicle-models/
        coords = vector3(-47.56, -1093.83, 26.42), --Vector 3 coordinates where the vehicle will spawn
        heading = 248.15, --Must be a float value. This means it needs a decimal and a number after the decimal.
    },
}

Config.BlipList = {
    --Premium Deluxe Motorsports - Blip
    {
        title = "Premium Deluxe Motorsports",
        coords = vector3(-42.48, -1102.24, 26.42),
        sprite = 227, --https://docs.fivem.net/docs/game-references/blips/
        color = 5, --https://docs.fivem.net/docs/game-references/blips/#blip-colors
        scale = 0.7,
        radiusEnabled = false,
        radius = 100.0,
        transparency = 90,
    },
    --Premium Deluxe Motorsports - Radius
    {
        title = "Premium Deluxe Motorsports",
        coords = vector3(-42.48, -1102.24, 26.42),
        sprite = 9, --https://docs.fivem.net/docs/game-references/blips/
        color = 5, --https://docs.fivem.net/docs/game-references/blips/#blip-colors
        scale = 0.7,
        radiusEnabled = true,
        radius = 100.0,
        transparency = 90,
    },
}
