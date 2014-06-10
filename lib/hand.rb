# basically an array of card
class Hand
  attr_accessor :cards, :value
  include Enumerable

  def initialize
    @cards = []
    @value = 0
    @ace_count = 0
  end # initialize

  def each
    @cards.each do |card|
      yield card.value
    end # do each card
  end # each

  def size
    cards.size
  end # size

  def add_card(card)
    cards.push(card)
    if card.rank == :A
      @ace_count += 1
    end # if
    @value += card.value
  end # add_card

  def value_ace
    if @value > 21 && @ace_count > 0
      @value -= 10
      @ace_count -= 1
    end # if
    @value
  end

  def busted?
    value_ace > 21
  end # busted?
end # class Hand
