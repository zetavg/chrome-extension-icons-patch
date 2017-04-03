require 'fileutils'

def backup_and_replace(target_path, source_path)
  unless File.file?(target_path)
    puts " > ignoring '#{target_path}': target file does not exist"
    return
  end

  puts "  > copying '#{source_path}' to '#{target_path}'"
  FileUtils.mv(target_path, "#{target_path}.backup") unless File.file?("#{target_path}.backup")
  FileUtils.copy_file(source_path, target_path)
end
