module Loudmouth
  class Key
    class << self
      def generate( *keys )
        key_arr = Array( keys ).map(&:to_s).sort
        string  = key_arr.join( "::" )
      end
    end
  end
end
