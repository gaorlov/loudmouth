require 'test_helper'

class YellerTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Yeller::VERSION
  end

  def test_full_stack
    AngryMan.yell
    sleep 0.5
    assert_equal "Boo!", Listener._message

    AngryMan.yell_block
    sleep 0.5
    assert_equal :unique, Listener._message
  end
end
