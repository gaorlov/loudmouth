module Yeller
  module Subscribable
    extend ActiveSupport::Concern

    included do
      class << self 
        def subscribe( method, *keys )
          Yeller.subscribe( self, method, *keys)
        end
      end
    end
  end
end