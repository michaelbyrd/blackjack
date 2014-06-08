require 'deck'
require 'hand'

# the player that doesn't require a bank
class House
  attr_reader :hand
  attr_writer :hand

  def initialize
    @hand = Hand.new
  end # initialize

  def hit?
    if @hand.value <= 16
      true
    else
      false
    end # if
  end # hit?
end # class Dealer
