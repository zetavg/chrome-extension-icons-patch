require 'json'

def directory?(name, path)
  !%w(. ..).include?(name) &&
    File.directory?(File.join(path, name))
end

def extensions_list(extensions_dir)
  list = {}

  Dir.entries(extensions_dir)
     .select { |entry| directory?(entry, extensions_dir) }
     .reject { |entry| %w(Temp).include?(entry) }
     .each do |extension_id|
    extension_root_dir = File.join(extensions_dir, extension_id)
    extension_versions = Dir.entries(File.join(extensions_dir, extension_id)).select { |entry| directory?(entry, extension_root_dir) }
    last_extension_version = extension_versions.max { |a, b| Gem::Version.new(a.gsub(/[^0-9\.]/, '')) <=> Gem::Version.new(b.gsub(/[^0-9\.]/, '')) }
    extension_dir = File.join(extensions_dir, extension_id, last_extension_version)
    extension_manifest_file = File.join(extension_dir, 'manifest.json')

    extension_manifest = begin
      JSON.parse File.read(extension_manifest_file)
    rescue
    end

    if extension_manifest
      list[extension_id] = {
        id: extension_id,
        name: [extension_manifest['author'], extension_manifest['name']].compact.join('/'),
        directory: extension_dir
      }
    end
  end

  list
end
