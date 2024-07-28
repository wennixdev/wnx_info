--////////////////////////////
--//__        ___   ___  __ //
--//\ \      / / \ | \ \/ / //
--// \ \ /\ / /|  \| |\  /  //
--//  \ V  V / | |\  |/  \  //
--//   \_/\_/  |_| \_/_/\_\ //
--////////////////////////////



-- client.lua

-- Adding NPC and target
Citizen.CreateThread(function()
    local npcModel = "a_m_m_business_01" -- NPC model, change as needed
    RequestModel(npcModel)
    while not HasModelLoaded(npcModel) do
        Citizen.Wait(100)
    end

    local npcPed = CreatePed(4, npcModel, -1034.6163, -2732.4814, 19.1693, 145.9550, false, true)
    SetEntityAsMissionEntity(npcPed, true, true)
    FreezeEntityPosition(npcPed, true)
    SetBlockingOfNonTemporaryEvents(npcPed, true)

    -- Added a target to interact with NPCs
    exports.ox_target:addSphereZone({
        coords = vec3(-1034.6163, -2732.4814, 20.1693), -- coords NPC
        radius = 1.5, -- The size of the interaction zone
        debug = false, -- Show debug zone (true/false)
        options = {
            {
                distance = 2.0,
                event = 'server:showInfo', -- Event to open UI server:showInfo
                icon = wnx.targetIcon1,
                label = wnx.Locale['target_name'],
            }
        },
    })
end)

-- Event for displaying server information
RegisterNetEvent('server:showInfo', function()
    local info = {
        header =    wnx.Locale['info_server'],             
        content =   wnx.Locale['main_info'],                                       
        centered = true,
        cancel = true
    }

    -- Displays a dialog box with server information
    lib.alertDialog(info)
end)