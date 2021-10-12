ESX = nil
local riavvio = false

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function sendToDiscordOffline (name,message,color)
    local DiscordWebHook = Config.webhookSendRestart
  
    local embeds = {
        {
            ["title"]= _U("title_webhook_restart"),
            ["type"]="rich",
            ["icon"]=Config.UrlIconWebHook,
            ["description"]= message,
            ["color"] =color,
            ["image"]= {
                ["url"]=Config.UrlGifRestartWebHook,
            },
            ["footer"]=  {
                ["text"]= Config.TextFooterWebHook,
                ["icon_url"]= Config.UrlIconWebHook,
            },
        }
    }
  
    if message == nil or message == '' then
       return FALSE 
    end
  
    PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
  
end

function sendToDiscordOnline (name,message,color)
    local DiscordWebHook = Config.webhookSendRestart
  
    local embeds = {
        {
            ["title"]= _U("title_webhook_restart"),
            ["type"]="rich",
            ["icon"]=Config.UrlIconWebHook,
            ["description"]= message,
            ["color"] =color,
            ["image"]= {
                ["url"]=Config.UrlGifOnlineWebHook,
            },
            ["footer"]=  {
                ["text"]= Config.TextFooterWebHook,
                ["icon_url"]= Config.UrlIconWebHook,
            },
        }
    }
  
    if message == nil or message == '' then
       return FALSE 
    end
  
    PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
  
end

function sendToDiscord (name,message,color)
	local DiscordWebHook = Config.WebhookLogs

	local timestamp = os.time()
	local dt1 = os.date( "!*t", timestamp )  -- UTC
	local dt2 = os.date( "*t" , timestamp )  -- local

	local embeds = {
        {
            ["title"]=message .. "\n\n Resource name : " .. GetCurrentResourceName() .. "\n\n".. os.date("%d/%m/%Y | %H:%M:%S ", timestamp),
            ["type"]="rich",
            ["icon"]=Config.UrlIconWebHook,
            ["color"] =color,
            ["footer"]=  {
                ["text"]= Config.TextFooterWebHook,
                ["icon_url"]= Config.UrlIconWebHook,
            },
        }
	}

	if message == nil or message == '' then
	    return FALSE 
	end

	PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })

end

sendToDiscordOnline(_U("name_server"),_U("server_online"),Config.green)


TriggerEvent('es:addGroupCommand', Config.NameCommandRestarter, 'superadmin', function(source, args, user)
    TriggerClientEvent("elitenetwork_status_server:riavvio", -1)
    sendToDiscordOffline(_U("name_server"),_U("send_restart"), Config.green)

    local xPlayer = ESX.GetPlayerFromId(source)
    sendToDiscord(_U("title_webhook_logs"), xPlayer.name .. " " .. _U("forward_restart"), Config.green)
end, function(source, args, user)
    TriggerClientEvent('chat:addMessage', source, { args = { _U("name_server"), _U("insufficient_permission") } })
    if Config.Notification == "advanced" then
        TriggerClientEvent('esx:showAdvancedNotification', source, _U("title_advanced"), _U("description_advanced"), _U("no_permission"), Config.Char, Config.Icon)
    elseif Config.Notification == "standard" then
        TriggerClientEvent('esx:showNotification', source, _U("no_permission"))
    end
end, { help = _U("chat_suggestion")})

RegisterServerEvent("esx_elitenetwork_reboot:restart")
AddEventHandler("esx_elitenetwork_reboot:restart", function()
    RconPrint(_U("sending_restart") .. GetPlayerName(source) .. '^0\n')
    Citizen.Wait(1000)
    ESX.SavePlayers()

    sendToDiscord(_U("title_webhook_logs"), _U("save_player_log"),Config.orange)
    Citizen.Wait(2000)
    RconPrint(_U("kick_player") .. "^0\n")
    sendToDiscord(_U("title_webhook_logs"), _U("kick_player_log"),Config.red)
    kickPlayer()
    RconPrint(_U("restarting_server") .. "^0\n")
    sendToDiscord(_U("title_webhook_logs"), _U("restarting_log"),Config.green)

    riavvio = true
    os.execute("start" .. "C:/Project/FiveM/FXServer.exe")
    Citizen.Wait(1)
    os.exit()
    
end)

RegisterServerEvent("esx_elitenetwork_reboot:end_restart")
AddEventHandler("esx_elitenetwork_reboot:end_restart", function(source)
    TriggerClientEvent("elitenetwork_status_server:end_riavvio", source)
    
end)

function kickPlayer ()
    local xPlayers = ESX.GetPlayers()
    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        xPlayer.kick(_U("message_kick"))
    end
end

Citizen.CreateThread(function()
        print(
  [[^8
  ____________________________________________________________^4 
  
   ______ _ _ _       _   _      _                      _    
  |  ____| (_) |     | \ | |    | |                    | |   
  | |__  | |_| |_ ___|  \| | ___| |___      _____  _ __| | __
  |  __| | | | __/ _ \ . ` |/ _ \ __\ \ /\ / / _ \| '__| |/ /
  | |____| | | ||  __/ |\  |  __/ |_ \ V  V / (_) | |  |   < 
  |______|_|_|\__\___|_| \_|\___|\__| \_/\_/ \___/|_|  |_|\_\^8
  
                  ^5Copyright By EliteNetwork
                      www.elitenetwork.it^8
  ____________________________________________________________   
  
  ^0]] .. "\n\n"
      )

end)
