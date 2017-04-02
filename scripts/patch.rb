#!/usr/bin/env ruby
require './_patch_extensions.rb'
extensions_directory = ARGV[0]
icon_set = ARGV[1] || 'default'

patch_extensions(extensions_directory, icon_set: icon_set)
