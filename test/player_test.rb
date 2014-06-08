require 'minitest/autorun'
require 'player'

# test for blackjack's class Game
class PlayerTest < MiniTest::Unit::TestCase
  def setup
    @player = Player.new
  end # setup

  def test_bet
    @player.bet(30)
    assert_equal @player.bank, 70
  end
end # class GameTest
