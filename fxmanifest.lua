fx_version 'cerulean'

author "@ ElPatron"
description "Hooka resource for FiveM customer"

lua54 'yes'

game 'gta5'

client_scripts {
	'client/main.lua',
	'client/modules/functions.lua',
	'client/modules/events.lua',
}
 
shared_scripts {
	'@ox_lib/init.lua',
	'config.lua'
}
 
server_scripts { 
	'server/main.lua',
	'server/modules/events.lua', 
	'server/modules/commands.lua', 
}
