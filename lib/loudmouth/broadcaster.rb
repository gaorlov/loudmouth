module Loudmouth
  class Broadcaster
    
    def intialize( options )
      @subscribers = SubscriberCollection.new
    end

    def broadcast( message, *keys )
      key = Key.generate( *keys )

      @sunscribers.find( key ).each do |subsciber|
        subscriber.notify( message )
      end
    end

    def subscribe( subscriber_class, method, *keys )
      key = Key.generate( *keys )

      subscriber = Subscriber.new( subscriber_class, method, key )

      @subscribers.add( subscriber )
    end
  end
end