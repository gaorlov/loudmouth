require 'test_helper'

class LoudmouthTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Loudmouth::VERSION
  end

  def test_full_stack
    Yeller.yell
    sleep 0.5
    assert_equal "Boo!", Listener._message

    Yeller.yell_block
    sleep 0.5
    assert_equal :unique, Listener._message
  end
end
