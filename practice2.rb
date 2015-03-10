class Card
  attr_accessor :value, :suit, :name

  def initialize(suit, name)
    @suit = suit
    @name = name
    if ["King", "Queen", "Jack"].include? name
     @value = 10
    elsif name == "Ace"
     @value = 11
    else
     @value = name
    end

    # if (2..10).include? name
    #   @value = name
    # elsif "J" == name
    #   @value = 10
    # elsif "Q" == name
    #   @value = 10
    # elsif "K" == name
    #   @value = 10
    # elsif "A" == name
    #   @value = 11
    # end
  end

  def to_s
    "The #{name} of #{suit}"
  end
end


class Deck
  attr_accessor :cards, :deal

  def initialize
    @cards = []
    suits = [:hearts, :diamonds, :spades, :clubs]
    suits.each do |suit|
      (2..10).each do |value|
        @cards << Card.new(suit, value)
      end
      @cards << Card.new(suit, "Jack")
      @cards << Card.new(suit, "Queen")
      @cards << Card.new(suit, "King")
      @cards << Card.new(suit, "Ace")
    end
  end

  def shuffle
    cards.shuffle!
  end

  def deal
    @cards.shift
  end
end


class Hand
  attr_accessor :cards

  def initialize
    @cards = []
    #@total = @cards[0].value + @cards[1].value
  end
end




class Game
  attr_accessor :total#, :hand, :house

  def initialize
    @total = player.cards[0].value + player.cards[1].value
    # @house = dealer.cards[0].value + dealer.cards[1].value
  end

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

  if player.cards == 21
    puts "BLACKJACK - YOU WIN!"
  elsif dealer.cards == 21
    puts "DEALER BLACKJACK! - GAME OVER"
  end

  puts "Your cards are: " + player.cards.join(", ")
  puts "The dealer is showing: " + dealer.cards.last.to_s
  puts "Your TOTAL is: #{player.cards[0].value.to_i + player.cards[1].value.to_i}"

  puts "Would you like another card?"
  puts "please type 'yes' or 'no'"
    answer = gets.chomp
    if answer == "yes"
      player.cards << deck.deal
      puts "Your next card is: " + player.cards.last.to_s
      puts "Your new TOTAL is:
      #{player.cards[0].value.to_i +
      player.cards[1].value.to_i +
      player.cards[2].value.to_i}"

    elsif answer == "no"
      puts "STAYING, with a total of: #{player.cards[0].value + player.cards[1].value}"
      puts "The Dealer TOTAL is: #{dealer.cards[0].value +
      dealer.cards[1].value}"
    end
end