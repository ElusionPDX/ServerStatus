# ServerStatus
<img src="https://i.imgur.com/UE1mLlB.png" width="200px" height="200px" align="center">

Resource for restarting your server. This resource is fully editable from config.lua 


### Download
- Download https://github.com/elitenetwork-project/ServerStatus/archive/master.zip
- Put it in the `[esx]` directory

## Installation
- Add this in your `server.cfg`:

```
start ServerStatus
```
- Add this in your `servercfg` ace:

```
add_ace resource.EN_ServerStatus command.restart allow                                      
add_ace resource.EN_ServerStatus command.start allow                                       
add_ace resource.EN_ServerStatus command.stop allow
add_ace resource.EN_ServerStatus command.quit allow
```

## Preview

WebHook restarting server
<br>
<img src="https://imgur.com/bcO16Vb.png">
<br>
<br>
Countdown in-game
<br>
<img src="https://imgur.com/xLGsyGi.png">
<br>
<br>
Kick message when the server restarts and the player is still inside the server
<br>
<img src="https://imgur.com/rULoCOm.png">
<br>
<br>
WebHook Log
<br>
<img src="https://imgur.com/wbV7gX0.png">
<br>
<br>
