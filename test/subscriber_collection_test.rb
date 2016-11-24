require 'test_helper'

class SubscriberCollectionTest < Minitest::Test
  def test_can_find_subscriber
    subscriber = Loudmouth::Subscriber.new(Listener, :update, :a)
    collection = Loudmouth::SubscriberCollection.new()
    collection.add(subscriber)
    refute_equal [], collection.find( :a )
  end
end