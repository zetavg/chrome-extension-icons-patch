#!/usr/bin/env ruby
require File.join(File.absolute_path(File.dirname(__FILE__)), '_restore_extensions.rb')
require_relative '_default_extensions_directories'

icon_set = ARGV[0] || 'default'
extensions_directories = ARGV[1] || 'default'

extensions_directories = DEFAULT_EXTENSIONS_DIRECTORIES if extensions_directories == 'default'
extensions_directories = extensions_directories.split(';')

extensions_directories.each do |extensions_directory|
  next unless Dir.exists?(extensions_directory)
  restore_extensions(extensions_directory, icon_set: icon_set)
end
