fx_version 'cerulean'

lua54 'yes'

game 'gta5'

client_scripts {
	'client/modules/events.lua',
	'client/modules/functions.lua',
	'client/main.lua',
}
 
shared_scripts {
	'@ox_lib/init.lua',
	'config.lua'
}
 
server_scripts { 
	'server/modules/commands.lua', 
	'server/main.lua'
}
