QBCore = nil 

Citizen.CreateThread(function()
   while QBCore == nil do
   	TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
   	Citizen.Wait(250)
   end
end)

-- Toplama
local uzumtoplama = Config.UzumToplama

Citizen.CreateThread(function()
    while true do
        local sleep = 2000
        local player = PlayerPedId()
        local playercoords = GetEntityCoords(player)
        local distance = GetDistanceBetweenCoords(playercoords, uzumtoplama.x, uzumtoplama.y, uzumtoplama.z, true)
        if distance < 30 then
            sleep = 1
            DrawMarker(2, uzumtoplama.x, uzumtoplama.y, uzumtoplama.z - 1.5 + 1, 0.0, 0.0, 0.0, 0.0, 0, 0.0, Config.MarkerBoyutu, Config.MarkerBoyutu, Config.MarkerBoyutu, 255, 255, 0, 50, false, true, 2, nil, nil, false)
            if distance < 5 then
                sleep = 1
                    DrawText3D(uzumtoplama.x, uzumtoplama.y, uzumtoplama.z, '[E] Üzüm Topla')
                    if IsControlJustReleased(0, 38) then
                        TriggerEvent("mythic_progbar:client:progress", {
                            name = "üzüm",
                            duration = 5000,
                            label = "Üzüm Topluyorsun",
                            useWhileDead = false,
                            canCancel = true,
                            controlDisables = {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                            },
                            animation = {
                                animDict = "amb@prop_human_bum_shopping_cart@male@idle_a",
                                anim = "idle_c",
                                flags = 49,
                            },
                        }, function(status)
                            if not status then
                                TriggerServerEvent("uzum")
                            end
                        end)
                    end
            end
        end
        Citizen.Wait(sleep)
    end
end)

-- İşleme
local uzumisleme = Config.UzumIsleme

Citizen.CreateThread(function()
    while true do
        local sleep = 2000
        local player = PlayerPedId()
        local playercoords = GetEntityCoords(player)
        local distance = GetDistanceBetweenCoords(playercoords, uzumisleme.x, uzumisleme.y, uzumisleme.z, true)
        if distance < 30 then
            sleep = 1
            DrawMarker(2, uzumisleme.x, uzumisleme.y, uzumisleme.z - 1.5 + 1, 0.0, 0.0, 0.0, 0.0, 0, 0.0, Config.MarkerBoyutu, Config.MarkerBoyutu, Config.MarkerBoyutu, 255, 255, 0, 50, false, true, 2, nil, nil, false)
            if distance < 5 then
                sleep = 1
                    DrawText3D(uzumisleme.x, uzumisleme.y, uzumisleme.z, '[E] Üzüm İşle')
                    if IsControlJustReleased(0, 38) then
                        TriggerEvent("mythic_progbar:client:progress", {
                            name = "üzüm",
                            duration = 5000,
                            label = "Üzüm İşliyorsun",
                            useWhileDead = false,
                            canCancel = true,
                            controlDisables = {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                            },
                            animation = {
                                animDict = "amb@prop_human_bum_shopping_cart@male@idle_a",
                                anim = "idle_c",
                                flags = 49,
                            },
                        }, function(status)
                            if not status then
                                TriggerServerEvent("uzumisleme")
                            end
                        end)
                    end
            end
        end
        Citizen.Wait(sleep)
    end
end)

--Satış
local uzumsatis = Config.UzumSatis

Citizen.CreateThread(function()
    while true do
        local sleep = 2000
        local player = PlayerPedId()
        local playercoords = GetEntityCoords(player)
        local distance = GetDistanceBetweenCoords(playercoords, uzumsatis.x, uzumsatis.y, uzumsatis.z, true)
        if distance < 30 then
            sleep = 1
            DrawMarker(2, uzumsatis.x, uzumsatis.y, uzumsatis.z - 1.5 + 1, 0.0, 0.0, 0.0, 0.0, 0, 0.0, Config.MarkerBoyutu, Config.MarkerBoyutu, Config.MarkerBoyutu, 255, 255, 0, 50, false, true, 2, nil, nil, false)
            if distance < 5 then
                sleep = 1
                    DrawText3D(uzumsatis.x, uzumsatis.y, uzumsatis.z, '[E] Üzüm Sat')
                    if IsControlJustReleased(0, 38) then
                        TriggerEvent("mythic_progbar:client:progress", {
                            name = "üzüm",
                            duration = 5000,
                            label = "Üzüm Satıyorsun",
                            useWhileDead = false,
                            canCancel = true,
                            controlDisables = {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                            },
                            animation = {
                                animDict = "amb@prop_human_bum_shopping_cart@male@idle_a",
                                anim = "idle_c",
                                flags = 49,
                            },
                        }, function(status)
                            if not status then
                                TriggerServerEvent("uzumsat")
                            end
                        end)
                    end
            end
        end
        Citizen.Wait(sleep)
    end
end)

function DrawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.30, 0.30)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 250
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 75)
end

if Config.BlipAc then
    CreateThread(function()
        local blip = AddBlipForCoord(Config.UzumToplamaBlip.x, Config.UzumToplamaBlip.y, Config.UzumToplamaBlip.z)
        SetBlipSprite(blip, 93)
        SetBlipAsShortRange(blip, true)
        SetBlipScale(blip, 0.5)
        SetBlipColour(blip, 51)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.UzumToplamaBlipAd)
        EndTextCommandSetBlipName(blip)
    end)
    CreateThread(function()
        local blip = AddBlipForCoord(Config.UzumIslemeBlip.x, Config.UzumIslemeBlip.y, Config.UzumIslemeBlip.z)
        SetBlipSprite(blip, 93)
        SetBlipAsShortRange(blip, true)
        SetBlipScale(blip, 0.5)
        SetBlipColour(blip, 51)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.UzumIslemeBlipAd)
        EndTextCommandSetBlipName(blip)
    end)
    CreateThread(function()
        local blip = AddBlipForCoord(Config.UzumSatisBlip.x, Config.UzumSatisBlip.y, Config.UzumSatisBlip.z)
        SetBlipSprite(blip, 93)
        SetBlipAsShortRange(blip, true)
        SetBlipScale(blip, 0.5)
        SetBlipColour(blip, 51)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.UzumSatisBlipAd)
        EndTextCommandSetBlipName(blip)
    end)
end
  