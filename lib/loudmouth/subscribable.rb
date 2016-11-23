module Loudmouth
  module Subscribable
    extend ActiveSupport::Concern

    included do
      class << self 
        def subscribe( method, *keys )
          Loudmouth.subscribe( self, method, *keys)
        end
      end
    end
  end
end