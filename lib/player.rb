require 'hand'

# player has a hand and a bank
class Player
  attr_reader :bank, :hand
  attr_writer :bank, :hand
  def initialize
    @bank = 100
    @hand = Hand.new
  end # initialize

  def hit?
    if gets.chomp.downcase == 'h'
      true
    else
      false
    end # if
  end # hit?

  def bet(bet)
    @bank -= bet
  end # bet(bet)

  def add_pot(bet)
    @bank += bet
  end # @pot(bet)
end # class Player
