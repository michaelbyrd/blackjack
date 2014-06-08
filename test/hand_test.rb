require 'minitest/autorun'
require 'hand'

# basic test for my class Hand
class HandTest < MiniTest::Unit::TestCase
  def setup
    @hand = Hand.new
  end

  def test_new_hand
    assert_equal @hand.size, 0
    assert_equal @hand.value, 0
  end

  def test_hand_value
    ace = Card.new(:K, :spades)
    two = Card.new(2, :spades)

    # add one card then check value
    @hand.add_card(ace)
    assert_equal @hand.value, 10

    # add another card then check value
    @hand.add_card(two)
    assert_equal @hand.value, 12
  end

  def test_a_busted_hand
    ten = Card.new(10, :spades)
    king = Card.new(:K, :diamonds)
    ace = Card.new(:A, :hearts)
    three = Card.new(3, :clubs)
    @hand.add_card(ten)
    @hand.add_card(king)
    @hand.add_card(ace)
    @hand.add_card(three)

    assert_equal @hand.busted?, true
  end
end
