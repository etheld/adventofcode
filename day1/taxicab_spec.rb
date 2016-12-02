require "test/unit"
require_relative "taxicab"

class TestSimpleNumber < Test::Unit::TestCase

  def test_R2L3_should_return_5
    p = Position.new("N", 0, 0)
    p.move("R","2")
    p.move("L","3")
    assert_equal(p.posx, 2)
    assert_equal(p.posy, -3)
    assert_equal(p.distance(), 5)
  end

  def test_R2R2R2_should_return_2
    p = Position.new("N", 0, 0)
    p.move("R","2")
    p.move("R","2")
    p.move("R","2")
    assert_equal(p.posx, 0)
    assert_equal(p.posy, 2)
    assert_equal(p.distance(), 2)
  end

end
