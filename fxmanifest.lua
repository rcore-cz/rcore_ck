fx_version 'bodacious' 
games { 'gta5' }

author 'Isigar <info@rcore.cz>'
description 'Simple CK script for some-rp.cz'

server_scripts {
    '@async/async.lua',
    '@mysql-async/lib/MySQL.lua',
    'config.lua',
    'server/init/*.lua',
    'server/lib/*.lua',
    'server/*.lua',
}

shared_scripts {
    'common.lua',
    'debug.lua',
}

dependencies {
    'rcore'
}












