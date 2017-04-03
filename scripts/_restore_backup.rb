require 'fileutils'

def restore_backup(target_path)
  unless File.file?("#{target_path}.backup")
    puts "  > ignoring '#{target_path}': backup not exists"
    return
  end

  puts "  > restoring backup '#{target_path}.backup'"
  FileUtils.remove_file(target_path, true)
  FileUtils.mv("#{target_path}.backup", target_path)
end
