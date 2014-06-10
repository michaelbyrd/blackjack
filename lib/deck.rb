require 'card'

# ruby -Ilib lib/deck.rb
class Deck
  include Enumerable
  attr_accessor :deck

  def initialize
    @values = nil
    @suits = nil
    @deck = []
    build
  end # initialize

  def each
    @deck.each do |card|
      yield card.value
    end # do each card
  end # each

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
      @deck.push(Card.new(@values[v], @suits[s]))
      count += 1
    end # while
    # shuffle
  end # make_deck

  def draw
    if @deck.size == 0
      @deck = []
      build
      shuffle
      @deck.shift
    else
      @deck.shift
    end # if
  end # draw

  def size
    deck.size
  end # size

  def shuffle
    @deck.shuffle!
  end #

  def cards_left
    size
  end # cards_left
end # class card
