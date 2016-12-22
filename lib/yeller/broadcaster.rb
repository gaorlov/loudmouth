module Yeller
  class Broadcaster
    
    def initialize( )
      @subscribers = SubscriberCollection.new
    end

    def broadcast( message, *keys )
      keys.each do |key|
        normalized_key = Key.normalize(key)
        @subscribers.find( normalized_key ).each do |subscriber|
          subscriber.notify( message )
        end
      end
    end

    def subscribe( subscriber_class, options )
      keys = Array(options.delete(:to))
      method = options.delete :with
      raise KeyError, "expected :with and :to to be present in subscriber definition" unless method && keys
      keys.each do |key|
        normalized_key = Key.normalize(key)
        subscriber = Subscriber.new( subscriber_class, method, normalized_key, options )
        @subscribers.add( subscriber )
      end
    end
  end
end