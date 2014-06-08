require 'pry'
# n next
# s step
# f finish
# c continue
# class Card: Card is used in class Deck
class Card
  include Comparable
  attr_reader :rank, :suit
  attr_writer :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
    @hash = nil
    run
  end # initialize

  def to_s
    print rank
    print ' '
    print suit.capitalize
  end # to_s

  def <=>(other)
    if value < other.value
      -1
    elsif value == other.value
      0
    else
      1
    end # if
  end # <=>(other)

  def run
    make_hash
  end # run

  def make_hash
    @hash = Hash.new { | _hash, key| key }
    h = { A: 1, J: 10, Q: 10, K: 10 }
    @hash.merge!(h)
  end # make_hash

  def value
    @hash[@rank]
  end # rank

  def greater_than?(other_card)
    self > other_card
  end # greater_than?
end # class Card
