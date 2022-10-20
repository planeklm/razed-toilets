local QBCore = exports['qb-core']:GetCoreObject()
local toilets = Config.Toilets
 
 exports['qb-target']:AddTargetModel(toilets, {
    options = {
    {
      type = "client",
      event = "razed-toilet:useToilet",
      label = "Use toilet",
      --icon = , -- Not set yet
      --targeticon = Target.Icon["smallBins"],
    }
  },
  distance = Config.TargetDistance,
})

RegisterNetEvent('razed-toilet:useToilet')
AddEventHandler('razed-toilet:useToilet', function()
  ExecuteCommand(
    "e pee"
)
QBCore.Functions.Progressbar('Pee', 'Peeing...', 15000, false, true, {
    disableMovement = true,
    disableCarMovement = true,
    disableMouse = false,
    disableCombat = true
    }, {}, {}, {}, function()
        ExecuteCommand(
            "e c"
         )
        TriggerClientEvent('QBCore:Notify', src, "You stopped peeing!")     
    end, function()
        ExecuteCommand(
            "e c"
        )

        TriggerServerEvent('hud:server:RelieveStress', 10)  
end)
end)
