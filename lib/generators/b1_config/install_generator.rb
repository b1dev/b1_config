module B1Config
  module Generators
    class InstallGenerator < ::Rails::Generators::Base

      desc "Generates B1 Config initializer file."

      source_root File.expand_path('../templates', __FILE__)

      def copy_initializer
        template "initializer.rb", "config/initializers/b1_config.rb"
      end


      def create_default_config
        template "config.yml", "config/configs/b1_config.yml"
      end

    end
  end
end