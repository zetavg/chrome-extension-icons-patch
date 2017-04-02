require 'fileutils'

def backup_and_replace(target_path, source_path)
  unless File.file?(target_path)
    puts "Ignoring '#{source_path}' -> '#{target_path}'"
    return
  end

  puts "Copying '#{source_path}' to '#{target_path}'"
  FileUtils.mv(target_path, "#{target_path}.backup") unless File.file?("#{target_path}.backup")
  FileUtils.copy_file(source_path, target_path)
end
