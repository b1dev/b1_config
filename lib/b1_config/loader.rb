module B1Config
  class Loader
   # Load yaml  files from directories and set it contains as options
   def self.load load_paths
    load_paths.each do |path|
      raise B1Config::Exception.new(4,{path: path}) unless File.directory?(path)
      Dir.glob("#{path}*").each do |file|
        data = YAML::load(ERB.new(IO.read(File.open(file))).result)
        raise B1Config::Exception.new(3,{env:B1Config.env}) unless data.kind_of?(Hash) &&  data.has_key?(B1Config.env)
        B1Config::Options.update_data data[B1Config.env]
      end
    end
   end

  end
end