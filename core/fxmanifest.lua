fx_version 'cerulean'
game { 'gta5' }
version '0.0.1'

server_scripts {
    'src/server/main.lua',
    'src/server/config/*.lua',
    'src/server/functions/*.lua',
    'src/server/events/*.lua',
    'src/server/commands/*.lua',
}

client_scripts {
    'src/client/main.lua',
    'src/client/functions/*.lua',
    'src/client/commands/*.lua',
    'src/client/events/*.lua'
}

shared_scripts {
    'src/shared/*.lua',
    'src/config.lua'
}