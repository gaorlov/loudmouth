require 'test_helper'

class KeyTest < Minitest::Test
  def test_arrays_normalize
    assert_equal Symbol, Loudmouth::Key.normalize([:a, :b, :c]).class
    assert_equal Loudmouth::Key.normalize([:a, :b, :c]), Loudmouth::Key.normalize([:b, :c, :a])
    assert_equal Loudmouth::Key.normalize([:a, :b, :c]), Loudmouth::Key.normalize(["b", :c, "a"])
  end

  def test_hashes_normalize
    assert_equal Symbol, Loudmouth::Key.normalize({a: :b}).class
    assert_equal Loudmouth::Key.normalize( { a: :b, c: :d } ), Loudmouth::Key.normalize( { c: :d, a: :b })
    assert_equal Loudmouth::Key.normalize( { a: :b, c: :d } ), Loudmouth::Key.normalize( { c: "d", "a" => :b })
  end

  def test_strings_normalize
    assert_equal Symbol, Loudmouth::Key.normalize("lol").class
    assert_equal :lol, Loudmouth::Key.normalize("lol")
    assert_equal :_______________________, Loudmouth::Key.normalize("~!@#:\"':;/.,{$%^&*()_+}")
  end
end
