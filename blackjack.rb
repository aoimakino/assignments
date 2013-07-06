suits = ['Clubs', 'Diamonds', 'Spades', 'Hearts']
cards = ['A', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K'] 
$deck = suits.product(cards)

puts "***Welcome to Las Vegas!***"
puts ""
puts "What's your name?"
$player = gets.chomp

def hand_total(cards) 
  arr = cards.map{|e| e[1] }

  total = 0
  arr.each do |value|
    if value == "A"
      total += 11
    elsif value.to_i == 0
      total += 10
    else
      total += value.to_i
    end
  end

  arr.select{|e| e == "A"}.count.times do
    total -= 10 if total > 21
  end

  total
end

continue = true

while continue == true

  puts ""
  puts "Ok #{$player}, let's play Blackjack!"
  puts ""
  puts "Shuffling and dealing the cards"
  puts ""


  $deck.shuffle!
  player_cards = []
  dealer_cards = []


  player_cards.push($deck.pop)
  dealer_cards.push($deck.pop)
  player_cards.push($deck.pop)
  dealer_cards.push($deck.pop)

  player_points = hand_total(player_cards)
  dealer_points = hand_total(dealer_cards)

  puts "#{$player}'s cards are: #{player_cards}"
  puts "#{$player}'s points are: #{player_points}"
  puts "Dealer's cards are: #{dealer_cards}"
  puts "Dealer's points are: #{dealer_points}"
  puts ""

  if player_points == 21
    puts "BLACKJACK!!"
    puts "#{$player} win!" 
    exit
  end

  while player_points < 21
    puts "What do you choose? Hit (press 1) or Stay (press 2)"
    choose = gets.chomp
    
    if choose == "2"
       break
    end
    
    card = $deck.pop
    puts "Your new card is: #{card}"
    player_cards.push(card)
    puts "#{$player} cards are: #{player_cards}"
    player_points = hand_total(player_cards)
    puts "You have: #{player_points} points"
    
  end


  if dealer_points == 21
    puts "Dealer hit BLACKJACK!"
    puts "#{$player} loses!"
    exit
  end

  while dealer_points < 17
    card = $deck.pop
    puts "Dealer's new card is: #{card}"
    dealer_cards.push(card)
    puts "Dealer's cards are: #{dealer_cards}"
    dealer_points = hand_total(dealer_cards)
    puts "Dealer have: #{dealer_points} points"

  end

  puts "Dealer's cards are: "
  dealer_cards.each do |card|
    puts "#{card}"
  end
  puts "Dealer have: #{dealer_points} points"
  puts ""

  puts "#{$player} cards are: "
  player_cards.each do |card|
    puts "#{card}"
  end
  puts "You have: #{player_points} points"
  puts ""


  if dealer_points > player_points
    if dealer_points <= 21
      puts "Sorry #{$player} not enough points"
      puts "Dealer wins!"
    elsif dealer_points > 21
      puts "Dealer busted"
    end
  elsif dealer_points < player_points
    if player_points <= 21
      puts "Hey! That's lucky!"
      puts "#{$player} wins!"
    elsif player_points > 21
      puts "Sorry #{$player} you busted, you lose!"
    end
  elsif dealer_points < 21 && player_points < 21 && dealer_points == player_points
    puts "It's a TIE!"
  end

  puts ""
  puts "Would you like to play again?"
  reply = gets.chomp
  if reply == "yes" 
    "Let's play again!"
  elsif reply == "no"
    break
  end
end
  


