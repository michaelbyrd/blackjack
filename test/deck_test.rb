require "minitest/autorun"
require "deck"

class DeckTest < MiniTest::Unit::TestCase
  def setup
    @deck = Deck.new
  end

  def test_new_deck_has_52_cards
    assert_equal @deck.size, 52
  end

  # A new deck should be in the order:
  # - A, 2..10, J, Q, K of clubs
  # - A, 2..10, J, Q, K of diamonds
  # - A, 2..10, J, Q, K of hearts
  # - A, 2..10, J, Q, K of spades
  def test_new_deck_is_in_order
    card = @deck.draw
    assert_equal card, Card.new(:A, :clubs)

    card = @deck.draw
    assert_equal card, Card.new(2, :clubs)

    11.times { @deck.draw }

    card = @deck.draw
    assert_equal card, Card.new(:A, :diamonds)

    12.times { @deck.draw }

    card = @deck.draw
    assert_equal card, Card.new(:A, :hearts)

    12.times { @deck.draw }

    card = @deck.draw
    assert_equal card, Card.new(:A, :spades)
  end

  def test_deck_knows_how_many_are_left
    assert_equal @deck.cards_left, 52

    30.times { @deck.draw }

    assert_equal @deck.cards_left, 22
  end

  def test_empty_deck_does_not_return_nil
    52.times { @deck.draw }
    refute_nil @deck.draw
  end

  def test_deck_can_be_shuffled
    shuffled_deck = @deck.shuffle
    refute_equal @deck, shuffled_deck
  end

  def test_deck_is_enumerable
    test1 = @deck.all? { |cardvalue| cardvalue > 0 }
    test2 = @deck.all? { |cardvalue| cardvalue > 5 }
    assert_equal true, test1
    assert_equal false, test2
  end
end
