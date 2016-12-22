require 'test_helper'

class SubscriberTest < Minitest::Test
  def test_subscriber_executes_job
    $global_thing = :a
    subscriber = Yeller::Subscriber.new(Listener, :update, :a)
    subscriber.notify "hello"
    sleep 0.1
    assert_equal "hello", Listener._message
  end

  def test_subscriber_can_execute_sync
    $global_thing = :a
    subscriber = Yeller::Subscriber.new(Listener, :slow_update, :a, async: false)
    subscriber.notify "hello"
    assert_equal "hello", $global_thing
  end

  def test_subscriber_can_execute_async
    $global_thing = :a
    subscriber = Yeller::Subscriber.new(Listener, :slow_update, :a)
    subscriber.notify "hello"
    refute_equal "hello", $global_thing
    assert_equal :a, $global_thing
    sleep 2
    subscriber.notify "hello"
    assert_equal "hello", $global_thing
  end
end