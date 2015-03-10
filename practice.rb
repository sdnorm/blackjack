class Card
  attr_accessor :value, :suit, :name

  def initialize (suit, name) #@cards from Deck gets looped through here and assigns value
    @suit = suit
    @name = name
    if ["K", "Q", "J"].include? name
      @value = 10
    elsif name == "Ace"
      @value = 11
    else
      @value = name
    end
  end

  def to_s #prints card out in a readable format
    "#{name} - #{suit}"
  end
end

class Deck
  attr_accessor :cards, :deal
  
  def initialize
    @cards = []
    suits = [:Hearts, :Diamonds, :Spades, :Clubs]
    suits.each do |suit|
      (2..10).each do |name|
        @cards << Card.new(suit, name)
      end
      ["K", "Q", "J", "Ace"].each do |face|
      @cards << Card.new(suit, face)
      end
    end
  end
#creates the deck of cards 
  def shuffle
    @cards.shuffle!
  end

  def deal
    @cards.shift
  end
end

class Hand
  attr_accessor :cards, :deck

  def initialize
    @cards = []
    @deck = Deck.new
  end

  def total
    @cards.inject(0) do |sum, card|
      sum += card.value
    end
  end
end

class Game
  attr_accessor :determine_winner

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
  # def determine_winner (player_total, dealer_total)
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

Game.new





