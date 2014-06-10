require 'deck'
require 'hand'

# the player that doesn't require a bank
class House < Player
  def initialize
    super
  end # initialize

  def hit?
    if @hand.value <= 16
      true
    else
      false
    end # if
  end # hit?
end # class Dealer
