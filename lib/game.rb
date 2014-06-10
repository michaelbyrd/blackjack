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

    @bet = 0
    Prompt.welcome
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
    hit_or_stand_house
    win_or_lose
  end # run
  def new_round
    @deck.shuffle
    @player.hand = Hand.new
    @house.hand = Hand.new
    deal(@house.hand)
    deal(@player.hand)
    Prompt.what_would_you_like_to_bet(@player)
    @bet = gets.to_i
    @player.bet(@bet)
    Prompt.house_is_showing(@house)
  end # new_round

  def hit_or_stand
    Prompt.show_cards(@player.hand)
    Prompt.h_or_s
    if @player.hit?
      hit(@player.hand)
      if @player.hand.busted?
        Prompt.show_cards(@player.hand)
        Prompt.busted
      else
        hit_or_stand
      end # if
    end # if
  end # hit_or_stand

  def hit_or_stand_house
    if @house.hit?
      hit(@house.hand)
      if @house.hand.busted?
        Prompt.house_busted
        win_or_lose
      else
        hit_or_stand_house
      end # if
    end # if
    win_or_lose
  end # hit_or_stand_house

  def win_or_lose
    Prompt.show_cards_house(@house.hand)
    if @player.hand.value > @house.hand.value\
      && !@player.hand.busted? || @house.hand.busted?
      @player.add_pot(@bet * 2)
    elsif @player.hand.busted? && @house.hand.busted?
      @player.add_pot(@bet)
    end # if
    run
  end # end_round
end # class Game

# g = Game.new
# g.run
