module B1Config
  class Options
   DATA = {}
   private_constant :DATA

   #Update hash of options
   def self.update_data data
    data = data.kind_of?(Hash) ? data : {}
    DATA.merge! data
   end

   #Check if hash of options include the requested option
   def self.method_missing meth, *args, &block
    DATA.has_key?(meth.to_s) ? DATA[meth.to_s] : (raise B1Config::Exception.new(2,{meth:meth}))
   end
  end
end