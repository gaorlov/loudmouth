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
      key = subscriber.key
      @subscribers[key] = @subscribers[key].delete_if do |sub|
        sub == subscriber
      end 
    end

    def find( key )
      @subscribers[key] || []
    end
  end
end