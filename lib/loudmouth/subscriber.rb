module Loudmouth
  class Subscriber
    attr_accessor :subscriber_class, :method, :key

    def initialize( subscriber_class, method, key )
      @subscriber_class = subscriber_class
      @method           = method
      @key              = key
    end

    def ==( comparison_object )
      comparison_object.equal?(self) ||
      ( comparison_object.instance_of?(self.class) &&
        comparison_object.method == method &&
        comparison_object.key == key )
    end

    def notify( message )
      Thread.new do
        subscriber_class.send( method, message )
      end
    end
  end
end