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
    @bet = 0
  end # initialize

  def deal(hand)
    hand.add_card(@deck.draw)
    hand.add_card(@deck.draw)
  end # deal(hand)

  def hit(hand)
    hand.add_card(@deck.draw)
  end # hit(hand)

  def run
    new_round
    hit_or_stand
  end # run
  def new_round
    @deck.shuffle
    deal(@house.hand)
    deal(@player.hand)
    @prompt.what_would_you_like_to_bet(@player)
    @bet = gets.to_i
    @player.bet(@bet)
    @prompt.dealer_is_showing(@house)
  end # new_round

  def hit_or_stand
    @prompt.show_player_cards(@player)
    @prompt.h_or_s
    if @player.hit?
      hit(@player.hand)
      if @player.hand.busted? == false
        hit_or_stand
      else
        @prompt.busted
      end # if
    end # if
  end
end # class Game

g = Game.new
g.run
