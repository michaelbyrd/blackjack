# the printed output for Blackjack
class Prompt
  def initialize
  end # initialize

  def welcome
    puts '-------------------------------------------'
    puts '-         Welcome to my game of           -'
    puts '-                                         -'
    puts '-               Blackjack!                -'
    puts '-------------------------------------------'
    puts '-     You will start with 100 chips       -'
    puts '-                                         -'
    puts '-          Use them carefully!            -'
  end

  def what_would_you_like_to_bet(player)
    puts '-------------------------------------------'
    print 'What would you like to bet? bank = '
    print player.bank.to_s
    print ': '
  end

  def house_is_showing(house)
    print 'The house is showing: '
    puts house.hand.cards[0].to_s
  end

  def show_cards(hand)
    print 'Your cards are: '
    hand.cards.each do |card|
      print card.to_s
      print ' '
    end # do each card
    puts ''
  end

  def show_cards_house(hand)
    print 'The houes\'s cards are: '
    hand.cards.each do |card|
      print card.to_s
      print ' '
    end # do each card
    puts ''
  end

  def h_or_s
    print 'Would you like to (H)it or (S)tand? '
  end

  def busted
    puts 'Busted!'
  end

  def house_busted
    puts 'The house busted!'
  end
end # class Prompt
