class Game

  player = Hand.new
  dealer = Hand.new
  deck = Deck.new
  deck.shuffle

  2.times do
    player.cards << deck.deal
  end

  2.times do
    dealer.cards << deck.deal
  end

  puts "Your Cards:"
  puts player.cards
  puts "Your TOTAL: #{player.total}"
  puts "---------"
  puts "Dealer FaceUp Card:"
  puts dealer.cards[0]
  puts "---------"
  
  until dealer.total > 16
    dealer.cards << deck.deal
  end

  puts "Would you like to hit?"
  answer = gets.chomp
  until answer.downcase == "n" || player.total > 21
    player.cards << deck.deal
    puts "Cards: "
    puts player.cards
    puts "New Total: #{player.total}"
    if player.total < 21
      puts "Would you like to hit again? (y/n)"
      answer = gets.chomp
    end
  end
  
  if player.total > 21
    puts "BUST! You lose. Maybe you should try a different game?"
  elsif player.total > dealer.total || player.total == 21
    puts "You win. Good job!  Dealer Total: #{dealer.total}"
  elsif dealer.total > 21
    puts "Dealer Busts! You Win!"
    puts "Dealer Total: #{dealer.total}"
  elsif player.total == dealer.total 
    puts "Draw. You didn't win any money but at least you didn't lose any."
  else puts "You Lose. Dealer Total: #{dealer.total}"
  end
  
  
end