require 'card'

# ruby -Ilib lib/deck.rb
class Deck
  attr_reader :deck
  attr_writer :deck

  def initialize
    @values = nil
    @suits = nil
    @deck = []
    build
  end # initialize

  def build
    make_arrays
    make_deck
  end # build

  def make_arrays
    @values =
    [:A, 2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K]
    @suits = [:clubs, :diamonds, :hearts, :spades]
  end # make_arrays

  def make_deck
    count = 0
    while count < 52
      v = count % 13
      s = (count / 13 % 4)
      deck.push(Card.new(@values[v], @suits[s]))
      count += 1
    end # while
    # shuffle
  end # make_deck

  def draw
    if deck.size > 0
      deck.shift
    end # if
  end # draw

  def size
    deck.size
  end # size

  def shuffle
    if deck.size < 20
      @deck = Deck.new
    end # if
    @deck.shuffle!
  end #

  def cards_left
    size
  end # cards_left
end # class card
