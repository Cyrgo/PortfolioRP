fx_version 'cerulean'
game 'gta5'

name 'fix-deletion'
description 'Create missing tables for character deletion'
version '1.0.0'

dependency 'oxmysql'

shared_scripts {
    '@oxmysql/lib/MySQL.lua',
}

server_script 'server.lua'