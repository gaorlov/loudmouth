require 'test_helper'

class KeyTest < Minitest::Test
  def test_arrays_normalize
    assert_equal Symbol, Yeller::Key.normalize([:a, :b, :c]).class
    assert_equal Yeller::Key.normalize([:a, :b, :c]), Yeller::Key.normalize([:b, :c, :a])
    assert_equal Yeller::Key.normalize([:a, :b, :c]), Yeller::Key.normalize(["b", :c, "a"])
  end

  def test_hashes_normalize
    assert_equal Symbol, Yeller::Key.normalize({a: :b}).class
    assert_equal Yeller::Key.normalize( { a: :b, c: :d } ), Yeller::Key.normalize( { c: :d, a: :b })
    assert_equal Yeller::Key.normalize( { a: :b, c: :d } ), Yeller::Key.normalize( { c: "d", "a" => :b })
  end

  def test_strings_normalize
    assert_equal Symbol, Yeller::Key.normalize("lol").class
    assert_equal :lol, Yeller::Key.normalize("lol")
    assert_equal :_______________________, Yeller::Key.normalize("~!@#:\"':;/.,{$%^&*()_+}")
  end
end
