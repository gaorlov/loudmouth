require 'test_helper'

class SubscriberCollectionTest < Minitest::Test
  def test_can_find_subscriber
    subscriber = Yeller::Subscriber.new(Listener, :update, :a)
    collection = Yeller::SubscriberCollection.new()
    collection.add(subscriber)
    refute_equal [], collection.find( :a )
  end

  def test_can_find_wildcard_subscriber
    subscriber = Yeller::Subscriber.new(Listener, :update, "something.*thing")
    collection = Yeller::SubscriberCollection.new()
    collection.add(subscriber)
    refute_equal [], collection.find( "something_something" )
  end

  def test_can_remove_subsciber
    subscriber = Yeller::Subscriber.new(Listener, :update, :a)
    collection = Yeller::SubscriberCollection.new()
    collection.add(subscriber)
    collection.remove Yeller::Subscriber.new(Listener, :update, :a)
    assert_equal [], collection.find( :a )
  end
end