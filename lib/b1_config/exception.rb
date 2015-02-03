module B1Config
  class Exception < StandardError
    def initialize code,args={}
      message = defined?(::I18n) ? I18n.t("b1_config.e_#{code}",args) : code
      super message
    end
  end
end