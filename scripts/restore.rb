#!/usr/bin/env ruby
require './_restore_extensions.rb'
extensions_directory = ARGV[0]
icon_set = ARGV[1] || 'default'

restore_extensions(extensions_directory, icon_set: icon_set)
