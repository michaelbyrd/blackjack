require 'minitest/autorun'
require 'game'

# test for blackjack's class Game
class GameTest < MiniTest::Unit::TestCase
  def setup
    @game = Game.new
  end # setup

  def test_deal
    @game.deal(@game.player.hand)
    assert_equal @game.player.hand.value, 3
    @game.deal(@game.house.hand)
    assert_equal @game.house.hand.value, 7
  end

  def test_hit
    @game.hit(@game.player.hand)
    assert_equal @game.player.hand.value, 1
    @game.hit(@game.house.hand)
    assert_equal @game.house.hand.value, 2
  end

  def test_new_round
    @game.new_round
    assert_equal @game.house.hand.size, 2
    assert_equal @game.player.hand.size, 2
  end
end # class GameTest
