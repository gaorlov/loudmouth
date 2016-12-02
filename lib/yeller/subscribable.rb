module Yeller
  module Subscribable
    extend ActiveSupport::Concern

    included do
      class << self 
        def subscribe( options )
          Yeller.subscribe( self, options )
        end
      end
    end
  end
end