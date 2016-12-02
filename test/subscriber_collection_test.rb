require 'test_helper'

class SubscriberCollectionTest < Minitest::Test
  def test_can_find_subscriber
    subscriber = Loudmouth::Subscriber.new(Listener, :update, :a)
    collection = Loudmouth::SubscriberCollection.new()
    collection.add(subscriber)
    refute_equal [], collection.find( :a )
  end

  def test_can_remove_subsciber
    subscriber = Loudmouth::Subscriber.new(Listener, :update, :a)
    collection = Loudmouth::SubscriberCollection.new()
    collection.add(subscriber)
    collection.remove Loudmouth::Subscriber.new(Listener, :update, :a)
    assert_equal [], collection.find( :a )
  end
end