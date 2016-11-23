module Loudmouth
  class SubscriberCollection
    def initialize( )
      @subscribers = {}
    end

    def add( subscriber )
      key = subscriber.key

      @subscribers[key] ||= []
      
      @subscribers[key] << subscriber
    end

    def remove( subscriber )
      @subscribers[key] = @subscribers[key].delete_if do |sub|
        sub == subsciber
      end 
    end

    def find( key )
      @subscibers[key] || []
    end
  end
end