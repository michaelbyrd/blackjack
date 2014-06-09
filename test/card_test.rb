require "minitest/autorun"
require "card"

class CardTest < MiniTest::Unit::TestCase
  def test_that_card_has_a_suit
    card = Card.new(:A, :spades)
    assert_equal card.suit, :spades
  end # test that card has suit

  def test_that_card_has_a_rank
    card = Card.new(:A, :spades)
    assert_equal card.rank, :A
  end # test that card has rank

  def test_that_ace_is_high
    ace = Card.new(:A, :spades)
    two = Card.new(2, :hearts)

    refute two.greater_than?(ace)
    assert ace.greater_than?(two)
  end # test that ace is low

  def test_face_card_ranks
    ten = Card.new(10, :hearts)
    jack = Card.new(:J, :spades)
    queen = Card.new(:Q, :diamonds)
    king = Card.new(:K, :clubs)

    assert_equal ten.value, jack.value
  end
end
