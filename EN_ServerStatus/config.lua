Config                              = {}

Config.Locale                       = 'en'

Config.AdminGroup                   = {"admin","superadmin"} -- groups that can use admin commands

local seconds 			            = 1000                  -- 1 second
local minutes  			            = 60 * seconds          -- 1 minute

Config.Tempo          	            = 5 * minutes           -- 5 minutes

Config.Notification                 = "advanced"            -- 'advanced' = 'ESX.ShowAdvancedNotification', else 'standard' = 'ESX.ShowNotification'
Config.Char                         = "CHAR_PLANESITE"      -- This setting is for ShowAdvancedNotification only. More CHARs in this link: https://wiki.gtanet.work/index.php?title=Notification_Pictures
Config.Icon                         = "8"                   -- This setting is for ShowAdvancedNotification only. More Icons in this link: https://imgur.com/a/SVyk1Xk

Config.webhookSendRestart           = "Put your WebHook here for restart server" 
Config.UrlGifRestartWebHook         = "Gif/image URL for sending restart server in Discord"
Config.UrlGifOnlineWebHook          = "Gif/image URL for sending when your server is online"

Config.UrlIconWebHook               = "Image for icon the WebHook"

Config.TextFooterWebHook            = "Text for the footer the WebHook"

Config.WebhookLogs                  = "Put your WebHook here for log sending restarting server"

Config.green 				        = 56108
Config.grey 				        = 8421504
Config.red 					        = 16711680
Config.orange 				        = 16744192
Config.blue 				        = 2061822
Config.purple 				        = 11750815
