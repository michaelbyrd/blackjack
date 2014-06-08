require 'player'
require 'house'
require 'deck'
require 'prompt'

# Highest level class for blackjack
class Game
  attr_reader :house, :player, :deck, :prompt
  attr_writer :house, :player, :deck, :prompt
  def initialize
    @house = House.new
    @player = Player.new
    @deck = Deck.new
    @prompt = Prompt.new
  end # initialize

  def deal(hand)
    hand.add_card(@deck.draw)
    hand.add_card(@deck.draw)
  end # deal(hand)

  def hit(hand)
    hand.add_card(@deck.draw)
  end # hit(hand)
end # class Game

g = Game.new
g.prompt.welcome
