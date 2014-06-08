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
    puts '-------------------------------------------'
  end

  def what_would_you_like_to_bet(player)
    print 'What would you like to bet? bank = '
    print player.bank.to_s
    print ': '
  end

  def dealer_is_showing(house)
    print 'The dealer is showing: '
    puts house.hand.cards[0].to_s
  end

  def show_player_cards(player)
    print 'Your cards are: '
    player.hand.cards.each do |card|
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
end # class Prompt
