module Loudmouth
  class Broadcaster
    
    def intialize( options )
      @subscribers = SubscriberCollection.new
    end

    def broadcast( message, *key_fragments )
      key = Key.generate( *key_fragments )

      @sunscribers.find( key ).each do |subsciber|
        subscriber.notify( message )
      end
    end

    def subscribe( subscriber_class, method, *key_fragments )
      key = Key.generate( *key_fragments )

      subscriber = Subscriber.new( subscriber_class, method, key )

      @subscribers.add( subscriber )
    end
  end
end