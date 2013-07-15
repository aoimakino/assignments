
class Card
  attr_accessor :value, :suit

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def output
    "#{value} of #{suit}"
  end

   def to_s
    output
  end
end

class Deck
  attr_accessor :cards

   def initialize
    @cards = []
      ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace'].each do |value|
        ['Hearts', 'Diamonds', 'Spades', 'Clubs'].each do |suit|
        @cards << Card.new(value, suit)
      end
    end
    cards.shuffle!
  end

  def deal_one_card
    cards.pop
  end
end

module Hand
  def show_hand
    puts "#{name}'s cards are:"
    cards.each do|card|
      puts "#{card}"
    end
    puts "Your total is: #{total}"
    puts "o-o-o-o-o-o-o-o-o-o-o-o-o"
  end

  def total
    hand = cards.map{|card| card.value }

    total = 0
    hand.each do |val|
      if val == "Ace"
        total += 11
      else
        total += (val.to_i == 0 ? 10 : val.to_i)
      end
    end

    hand.select{|val| val == "Ace"}.count.times do
      break if total <= 21
      total -= 10
    end

    total
  end

  def add_card(new_card)
    cards << new_card
  end

  def busted?
    total > 21
  end
end

class Player
  include Hand

  attr_accessor :name, :cards

  def initialize(name)
    @name = name
    @cards = []
  end

  def show_flop
    show_hand
  end

end

class Dealer
  include Hand

  attr_accessor :name, :cards

  def initialize
    @name = "Dealer"
    @cards = []
  end

  def show_flop
    puts "Dealer's cards are:"
    cards.each do|card|
      puts "#{card}"
    end
    puts "Dealer total is: #{total}"
  end
end

class Blackjack
  attr_accessor :deck, :player, :dealer

  def initialize
    @deck = Deck.new
    @player = Player.new("New_player")
    @dealer = Dealer.new
  end

  def start_game
    puts "***WELCOME TO THE LUCKY SAVAGE CASINO*** "
    puts "What's your name?"
    player.name = gets.chomp
  end

  def deal_cards
    puts "LET'S PLAY BLACKJACK!!"
    puts "\u2660 \u2665 \u2666 \u2663 \u2660 \u2665 \u2666 \u2663 \u2660 \u2665 \u2666 \u2663"
    player.add_card(deck.deal_one_card)
    dealer.add_card(deck.deal_one_card)
    player.add_card(deck.deal_one_card)
    dealer.add_card(deck.deal_one_card)
  end

  def show_flop
    player.show_flop
    dealer.show_flop
  end

  def choose_winner?(player_or_dealer)
    if player_or_dealer.total == 21
      if player_or_dealer.is_a?(Dealer)
        puts "Dealer hit blackjack"
        puts "#{player.name} loses."
      else
        puts "You hit blackjack!"  
        puts "#{player.name} wins!"
      end
      play_again?
    elsif player_or_dealer.busted?
      if player_or_dealer.is_a?(Dealer)
        puts "Dealer busted."
        puts "#{player.name} win!"
      else
        puts "Sorry, you busted."
        puts "#{player.name} loses."
      end
      play_again?
    end
  end

  def player_turn
    

    choose_winner?(player)

    while !player.busted?
      puts "o-o-o-o-o-o-o-o-o-o-o-o-o"
      puts "What would you chose? HIT or STAY"
      response = gets.chomp.downcase

      if !['hit', 'stay'].include?(response)
        puts "Error: you must enter HIT or STAY"
        next
      end

      if response == 'stay'
        puts "#{player.name} chose to stay."
        break
      end

      new_card = deck.deal_one_card
      puts "New card for #{player.name}: #{new_card}"
      player.add_card(new_card)
      puts "#{player.name}'s total is now: #{player.total}"

      choose_winner?(player)
    end
    puts "#{player.name} stays at: #{player.total}."
    puts "o-o-o-o-o-o-o-o-o-o-o-o-o"
  end

  def dealer_turn
    puts "Now it's Dealer's turn."

    choose_winner?(dealer)
    while dealer.total < 17
      new_card = deck.deal_one_card
      puts "New card for dealer: #{new_card}"
      dealer.add_card(new_card)
      puts "Dealer total is now: #{dealer.total}"

      choose_winner?(dealer)
    end
    puts "Dealer stays at #{dealer.total}."
  end



    def dealer_turn
    puts "Dealer's turn."

    choose_winner?(dealer)
    while dealer.total < 17
      new_card = deck.deal_one_card
      puts "New card for dealer: #{new_card}"
      dealer.add_card(new_card)
      puts "Dealer total is now: #{dealer.total}"

      choose_winner?(dealer)
    end
    puts "Dealer stays at #{dealer.total}."
  end



  def who_won?
    if player.total > dealer.total
      puts "Congratulations, #{player.name} wins!"
    elsif player.total < dealer.total
      puts "Sorry, #{player.name} loses."
    else
      puts "It's a tie!"
    end
    play_again?
  end

  def play_again?
    puts "o-o-o-o-o-o-o-o-o-o-o-o-o"
    puts ""
    puts "Would you like to play again? YES or NO"
    continue = gets.chomp.downcase
    if continue == 'yes'
      puts "Starting new game..."
      puts ""
      deck = Deck.new
      player.cards = []
      dealer.cards = []
      continue_game
    else
      puts "Was a pleasure playing with you"
      puts "Thank you #{player.name}, I hope see you soon!"
      puts "\u2660 \u2665 \u2666 \u2663 \u2660 \u2665 \u2666 \u2663 \u2660 \u2665 \u2666 \u2663"
      exit
    end
  end

  def start
    start_game
    deal_cards
    show_flop
    player_turn
    dealer_turn
    who_won?
  end

  def continue_game
    deal_cards
    show_flop
    player_turn
    dealer_turn
    who_won?
  end
end

game = Blackjack.new
game.start

