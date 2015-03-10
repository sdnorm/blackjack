class Card
  attr_accessor :value, :suit, :name

  def initialize (suit, name) #@cards from Deck gets looped through here and assigns value
    @suit = suit
    @name = name
    if (2..10).include? "K" || "Q" || "J"
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
      (2..10).each do |value|
        @cards << Card.new(suit, value)
      end
      @cards << Card.new(suit, "J")
      @cards << Card.new(suit, "Q")
      @cards << Card.new(suit, "K")
      @cards << Card.new(suit, "Ace")
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

# deck = Deck.new
# deck.shuffle
# card = deck.deal
# puts card

class Hand
  attr_accessor :cards, :total, :value,

  def initialize
    @cards = []
    # @deck = Deck.new
    #@cards << Deck.deal
    # @player = Hand.new
    # @dealer = Hand.new
    @player_total = player_total
  end

  # def show
  #   deck.shuffle
  #   2.times do
  #   player.cards 
  #   end
  #   2.times do
  #   dealer.cards
  #   end
  # end

end

# puts "Your cards: " + player.cards.join(", ")
# puts "Your Total = " + player.cards.total 
# puts "The dealer is showing: " + dealer.cards.last.to_s

# player = Hand.new
# dealer = Hand.new
# deck = Deck.new

# #check to see if the card was delt
# #end

# deck.shuffle
# 2.times do
#   player.cards << deck.deal
# end
# 2.times do
#   dealer.cards << deck.deal
# end

# puts "Your cards: " + player.cards.join(", ")
# puts "Your Total = " + player.cards.total
# puts "The dealer is showing: " + dealer.cards.last.to_s

# class Play
# # shows the dealers hand, allows hits, finishes the game decides who won,
# end
class Game
  attr_accessor :player, :dealer, :deck
  @player = Hand.new
  @dealer = Hand.new
  game = Deck.new
  @deck = game.shuffle

  2.times do
    player.cards << deck.deal
  end

  2.times do
    dealer.cards << deck.deal
  end

  # def total
  #   player.cards[0].value + player.cards[1].value
  # end

  puts "Your cards: " + player.cards.join(", ")
  puts "The dealer is showing: " + dealer.cards.last.to_s
  puts "Your TOTAL: #{total}"
  puts "Would you like to hit (type 'h') or stay (type 's')?"
    answer = gets.chomp
    if answer == "h"
      player.cards << deck.deal
      puts "Your next card is: " + player.cards.last.to_s
    elsif answer == "s"
      puts "STAYING, with a total of: #{player.cards.value} "
    else
      puts "Please type either 'h' or 's'."
    until answer == "s" do
      player.cards << deck.deal
    end

  def player_total
    player.cards.value.inject(:+)
  end


    
  def player_hit x
      until (total x) >= 21
        puts "Do you want to hit? (y/n)"
        answer = gets.chomp
        if answer.downcase == "y"
          deal x
          puts "Your New Total: #{total x}"

end
