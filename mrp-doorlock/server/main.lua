ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterServerEvent('mrp-doorlock:server:updateState')
AddEventHandler('mrp-doorlock:server:updateState', function(doorIndex, state)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer and type(doorIndex) == 'number' and type(state) == 'boolean' and Config.Doors[doorIndex] then
		Config.Doors[doorIndex].locked = state
        TriggerClientEvent('mrp-doorlock:client:setState', -1, doorIndex, state)
    else
        print('error')
	end
end)

RegisterServerEvent('mrp-doorlock:server:setupDoors')
AddEventHandler('mrp-doorlock:server:setupDoors', function()
    local id = source
    local xPlayer = ESX.GetPlayerFromId(id)
    
    for k,v in pairs(Config.Doors) do
        local state = Config.Doors[k].locked
        TriggerClientEvent('mrp-doorlock:client:setState', id, k, state)
    end
end)

