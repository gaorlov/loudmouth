module Loudmouth
  class Key
    class << self
      def normalize( key )
        if key.is_a? Array
          string = key.map.sort.join("_")
        elsif key.is_a? Hash
          string = key.sort.flatten.join("_")
        else
          string = key.to_s
        string.gsub(/[ \\|\/\[\]\{\}.,-:;'"@?<>`~!#$%^&*()+=-]*/, "_").to_sym
      end
    end
  end
end
