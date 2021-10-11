fx_version 'adamant'

game 'gta5'

description 'Server Restarter with command'

author 'EliteNetwork - www.elitenetwork.it'

version '1.0.0'

files {
    'html/index.html',
	'html/gif/stato.gif',
	'html/js/app.js',
	'html/css/style.css',
	'locales/en.lua',
}
client_script {
	'@es_extended/locale.lua',
	'locales/en.lua',
	'locales/it.lua',
	'config.lua',
	'client/client.lua'
}

server_script {
	'@es_extended/locale.lua',
	'locales/en.lua',
	'locales/it.lua',
	'config.lua',
	'server/server.lua'
}

ui_page {
	'html/index.html',
}

dependencies {
	'es_extended'
}