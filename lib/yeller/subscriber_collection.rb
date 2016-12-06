module Yeller
  class SubscriberCollection
    def initialize( )
      @subscribers = []
    end

    def add( subscriber )
      @subscribers << subscriber
    end

    def remove( subscriber )
      @subscribers = @subscribers.delete_if do |sub|
        sub == subscriber
      end
    end

    def find( key )
      @subscribers.select do |subscriber|
        key.to_s.match(Regexp.new(subscriber.key.to_s)).present?
      end
    end
  end
end