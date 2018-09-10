require 'yaml'
require File.join(File.absolute_path(File.dirname(__FILE__)), '_extensions_list.rb')
require File.join(File.absolute_path(File.dirname(__FILE__)), '_backup_and_replace.rb')

def patch_extensions(extensions_dir, icon_set: 'default')
  puts "\n= Patching #{extensions_dir} with icon set '#{icon_set}'"
  icon_set_dir = File.join(File.dirname(File.dirname(__FILE__)), 'icons', icon_set)
  mappings = YAML.load_file(File.join(icon_set_dir, 'mappings.yml'))
  list = extensions_list(extensions_dir)

  puts "\n  Installed extensions:"
  list.each do |_extension_id, extension_data|
    puts "  - #{extension_data[:name]} at #{extension_data[:directory]}"
  end

  list.each do |_extension_id, extension_data|
    extension_name = extension_data[:name]
    extension_dir = extension_data[:directory]

    next unless mappings.has_key?(extension_name)
    puts "\n== Patching #{extension_name}"

    mappings[extension_name] && mappings[extension_name].each do |original_file, replacement_file|
      backup_and_replace(File.join(extension_dir, original_file), File.join(icon_set_dir, replacement_file))
    end
  end
end
