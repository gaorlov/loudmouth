module Yeller
  class Key
    class << self
      def normalize( key )
        if key.is_a? Array
          string = key.map{|el| el.to_sym }.sort.join("_")
        elsif key.is_a? Hash
          string = key.symbolize_keys.sort.flatten.join("_")
        else
          string = key.to_s
        end
        string.gsub(/[ \\|\/\[\]\{\}.,-:;'"@?<>`~!#$%^&*()+=-]/, "_").to_sym
      end
    end
  end
end
