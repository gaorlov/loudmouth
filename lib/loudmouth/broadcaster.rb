module Loudmouth
  class Broadcaster
    
    def intialize( options )
      @subscribers = SubscriberCollection.new
    end

    def broadcast( message, *keys )
      keys.each do |key|
        normalized_key = Key.normalize(key)
        @sunscribers.find( key ).each do |subsciber|
          subscriber.notify( message )
        end
      end
    end

    def subscribe( subscriber_class, method, *keys )
      keys.each do |key|
        normalized_key = Key.normalize(key)
        subscriber = Subscriber.new( subscriber_class, method, key )
        @subscribers.add( subscriber )
      end
    end
  end
end