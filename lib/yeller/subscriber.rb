module Yeller
  class Subscriber
    attr_accessor :subscriber_class, :method, :key, :async

    def initialize( subscriber_class, method, key, options = {} )
      @subscriber_class = subscriber_class
      @method           = method
      @key              = key
      @async            = options.fetch :async, true
    end

    def ==( comparison_object )
      comparison_object.equal?(self) ||
      ( comparison_object.instance_of?(self.class) &&
        comparison_object.method == method &&
        comparison_object.key == key )
    end

    def notify( message )
      thread = Thread.new do
        subscriber_class.send( method, message )
      end
      thread.join unless async
    end
  end
end