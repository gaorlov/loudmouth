require 'test_helper'

class KeyTest < Minitest::Test
  def test_arrays_normalize
    assert_equal String, Yeller::Key.normalize([:a, :b, :c]).class
    assert_equal Yeller::Key.normalize([:a, :b, :c]), Yeller::Key.normalize([:b, :c, :a])
    assert_equal Yeller::Key.normalize([:a, :b, :c]), Yeller::Key.normalize(["b", :c, "a"])
  end

  def test_hashes_normalize
    assert_equal String, Yeller::Key.normalize({a: :b}).class
    assert_equal Yeller::Key.normalize( { a: :b, c: :d } ), Yeller::Key.normalize( { c: :d, a: :b })
    assert_equal Yeller::Key.normalize( { a: :b, c: :d } ), Yeller::Key.normalize( { c: "d", "a" => :b })
  end
end
