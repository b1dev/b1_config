require "b1_config/exception"
require "b1_config/options"
require "b1_config/loader"

module B1Config
  extend self
  @@name = "Settings"
  @@env  = "development" 

  mattr_accessor :name, :env
  # Setup moduleand set base params
  def setup &block
    @@load_paths = []
    @@env = Rails.env if defined?(::Rails)
    @@load_paths << "#{Rails.root.to_s}/config/configs/"  if defined?(::Rails)
    yield self
    Kernel.send(:remove_const, B1Config.name) if Kernel.const_defined?(B1Config.name)
    Kernel.const_set(B1Config.name, B1Config::Options)
    B1Config.load_data
  end

  # Load data from .yml files in load directories
  def load_data
    B1Config::Loader.load(@@load_paths)
    self
  end

  # Get registered constant
  def get_const
    B1Config.name.constantinize
  end

  # Add directory to config loaded path
  def add_load_path path
    path = "/" + path.to_s.split("/").reject(&:empty?).join("/") + "/"
    @@load_paths << path.to_s unless @load_paths.include?(path.to_s)
    self
  end

  # Remove directory from config loaded path
  def remove_load_path path
    @@load_paths.reject!{|pth| path==pth}
    self
  end

  alias  :reload! :load_data

end