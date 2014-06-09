# the printed output for Blackjack
module Prompt
  def initialize
  end # initialize

  def self.welcome
    puts '-------------------------------------------'
    puts '-         Welcome to my game of           -'
    puts '-                                         -'
    puts '-               Blackjack!                -'
    puts '-------------------------------------------'
    puts '-     You will start with 100 chips       -'
    puts '-                                         -'
    puts '-          Use them carefully!            -'
  end

  def self.what_would_you_like_to_bet(player)
    puts '-------------------------------------------'
    print 'What would you like to bet? bank = '
    print player.bank.to_s
    print ': '
  end

  def self.house_is_showing(house)
    print 'The house is showing: '
    puts house.hand.cards[0].to_s
  end

  def self.show_cards(hand)
    print 'Your cards are: '
    hand.cards.each do |card|
      print card.to_s
      print ' '
    end # do each card
    puts ''
  end

  def self.show_cards_house(hand)
    print 'The houes\'s cards are: '
    hand.cards.each do |card|
      print card.to_s
      print ' '
    end # do each card
    puts ''
  end

  def self.h_or_s
    print 'Would you like to (H)it or (S)tand? '
  end

  def self.busted
    puts 'Busted!'
  end

  def self.house_busted
    puts 'The house busted!'
  end
end # class Prompt
