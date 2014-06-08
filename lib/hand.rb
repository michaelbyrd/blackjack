# basically an array of card
class Hand
  attr_reader :cards, :value
  attr_writer :cards, :value

  def initialize
    @cards = []
    @value = 0
  end # initialize

  def size
    cards.size
  end # size

  def add_card(card)
    cards.push(card)
    @value += card.value
  end # add_card

  def busted?
    @value > 21
  end # busted?
end # class Hand
