require 'test_helper'

class BroadcasterTest < Minitest::Test
  def test_broadcaster_raises_on_missing_options
    assert_raises KeyError do
      Yeller::Broadcaster.new.subscribe NilClass, garbage: :lol
    end
  end
end