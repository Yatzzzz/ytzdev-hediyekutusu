ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
 
print('[^2ytzdev-hediyekutusu^0] - Baslatildi!')

ESX.RegisterUsableItem("yilbasikutusu", function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    TriggerClientEvent('ytzdev:yilbasikutusuac', source)
    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Yıl Başı Kutusu Kullandın (YENİ YILIN KUTLU OLSUN)'})
end)

RegisterServerEvent("ytzdev:yilbasikutusu")
AddEventHandler("ytzdev:yilbasikutusu", function(itemname)
    local xPlayer = ESX.GetPlayerFromId(source)
    local yilbasi = xPlayer.getInventoryItem('yilbasikutusu').count

    if yilbasi > 0 then
        xPlayer.removeInventoryItem('yilbasikutusu', Config.Kutu)
        xPlayer.addInventoryItem(RandomItem(), Config.Yatzzz)
    else
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Üzerinde Yeterli Miktarda Yıl Başı Kutusu Yok'})
    end
end)

Items = {
    'rolex',
    'phone',
    'ring',
    'radio',
    'rccar',
    'vodka',
    'bread',
    'water',
    'cigarett',
    'lighter'
}

function RandomItem()
    return Items[math.random(#Items)]
end

ESX.RegisterServerCallback('ytz-checkitem', function(source, cb, item, output)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer ~= nil then
		local items = xPlayer.getInventoryItem(item)
		if items == nil then
			cb(0)
		else
			cb(items.count)
		end
	end
end)