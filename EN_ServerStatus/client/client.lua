ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(100)
	end

	PlayerLoaded = true
	ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
	PlayerLoaded = true
end)

RegisterNUICallback('open', function(data, cb)

	SendNUIMessage({ 
		action = 'element', 
		task = 'enable', 
		value = 'cover2' 
	})
  	StartTimer()
	cb()
end)

RegisterNetEvent("elitenetwork_status_server:riavvio")
AddEventHandler("elitenetwork_status_server:riavvio", function()

  	SendNUIMessage({ 
	  action = 'element', 
	  task = 'enable', 
	  value = 'cover2' 
	})

  	StartTimer()
end)

RegisterNetEvent("elitenetwork_status_server:end_riavvio")
AddEventHandler("elitenetwork_status_server:end_riavvio", function()

  	SendNUIMessage({ 
	  action = 'element', 
	  task = 'disable', 
	  value = 'cover2'
	})

end)

function secondsToClock(seconds)
	local seconds, hours, mins, secs = tonumber(seconds), 0, 0, 0

	if seconds <= 0 then
		return 0, 0
	else
		local hours = string.format("%02.f", math.floor(seconds / 3600))
		local mins = string.format("%02.f", math.floor(seconds / 60 - (hours * 60)))
		local secs = string.format("%02.f", math.floor(seconds - hours * 3600 - mins * 60))

		return mins, secs
	end
end

function StartTimer()

  local Timer = ESX.Math.Round(Config.Tempo / 1000)

	Citizen.CreateThread(function()
		-- start timer
		while Timer > 0 do
			Citizen.Wait(1000)

			if Timer > 0 then
				Timer = Timer - 1
			end

      		if Timer == 0 then
				TriggerServerEvent("elitenetwork_status_server:end_restart")
			end
		end
	end)

	Citizen.CreateThread(function()
		local text, timeHeld

		
		while Timer > 0 do
			Citizen.Wait(0)
			text = _U('message', secondsToClock(Timer))

			SetTextScale(0.0, 0.3)
			SetTextEntry("STRING")
			AddTextComponentString(text)
			DrawText(0.86, 0.3)
		end
		TriggerServerEvent("esx_elitenetwork_reboot:restart")

	end)
end