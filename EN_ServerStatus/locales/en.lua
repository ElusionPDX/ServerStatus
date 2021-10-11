Locales['en'] = {

  ['name_server']                 = "Name Server",        -- Change this to your server name

  -- Advanced Notification

  ['title_advanced']              = 'Name Server\n',        -- Change this to your server name
  ['description_advanced']        = 'Server',       -- Description for sending advanced notification          

  -- Text WebHook Restarter

  ['title_webhook_restart']       = "Status Server",        -- Title of the webhook when the restart command is issued 
  ['send_restart']                = "Server in **RESTART**",        -- Message that appears in the WebHook when the restart command is executed 
  ['server_online']               = "Server **ONLINE**"       -- Text when the server is online

  -- Text WebHook Logs

  ['title_webhook_logs']          = "Forward restart",        -- Title of the webhook log when the restart command is issued 
  ['forward_restart']             = "issued a server restart",        -- Text to know who executed the command
  ['kick_player_log']             = "Expulsion of all players",       -- Forwarding text for kicking players 
  ['save_player_log']             = "Saving all players",       -- Text for saving players
  ['restarting_log']              = "Server restarting",        -- Message for restarting server

  -- Notification Chat

  ['insufficient_permission']     = "Insufficient permission",        -- Message for insufficient permission for execution command
  ['chat_suggestion']             = "Command for server restart",       -- Suggestion for the chat command

  -- No permission for execution command

  ['no_permission']               = "Command execution permission ~r~ DENIED!",       -- Message for insufficient permission

  -- Rcon message

  ['sending_restart']             = "[^2RESTART^0] ^4Command ^1RESTART SERVER ^0 ^3 EXECUTED ^0 from ^5",       -- Alert in console for execution the command in game
  ['kick_player']                 = "[^2RESTART^0] ^4 ^1 PLAYERS EXPULSION",        -- Alert in console for expulsion all player
  ['restarting_server']           = "[^2RESTART^0] ^4 ^1RESTART IN PROGRESS",       -- Alert in console for server starting

  -- Message kick player

  ['message_kick']                = "🌙 You have been kicked due to server reboot. Don't worry, your character has been successfully saved",        -- Message that appears when players are kicked out due to reboot 

  -- Alert message text in game

  ['message'] = '⚠️ ~b~%s ~y~minutes ~w~and~y~ ~b~%s ~y~second/s~s~\n',       -- Text underneath the gif that displays how much time is left for the reboot 

}