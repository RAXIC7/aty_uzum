local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("uzum")
AddEventHandler("uzum", function()
    local xPlayer = QBCore.Functions.GetPlayer(source)
    xPlayer.Functions.AddItem("uzum", 1)
    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Üzüm Topladın!', length = 2500,})
end)

RegisterNetEvent("uzumisleme")
AddEventHandler("uzumisleme", function()
    local xPlayer = QBCore.Functions.GetPlayer(source)
    if xPlayer.Functions.RemoveItem("uzum", 5) then
        xPlayer.Functions.AddItem("sarap", 1)
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Üzüm İşledin!', length = 2500,})
    else
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Yeterince Üzüm Yok!', length = 2500,})
    end
end)

RegisterNetEvent("uzumsat")
AddEventHandler("uzumsat", function()
    local xPlayer = QBCore.Functions.GetPlayer(source)
    if  xPlayer.Functions.RemoveItem("sarap", 1) then
        xPlayer.Functions.AddMoney( "cash", Config.SarapFiyat)
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Üzüm Sattın!', length = 2500,})
    else
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Yeterince Şarap Yok!', length = 2500,})
    end
end)