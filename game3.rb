class Card
  attr_accessor :value, :suit, :name

  def initialize(suit, name)
    @suit = suit
    @name = name

    if (2..10).include? name
      @value = name
    elsif "J" == name
      @value = 10
    elsif "Q" == name
      @value = 10
    elsif "K" == name
      @value = 10
    elsif "A" == name
      @value = 11
    end
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
  attr_accessor :cards, :total, :value

  def initialize
    @cards = []
    # @total = (@cards[0].@value) #+ @cards[1].value
  end
end

  # def total
  #  @total = @cards[0].value #+ @value[1] + @value[2] + @value[3]
  # end
# end


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

  puts "Your cards are: " + player.cards.join(", ")
  puts "The dealer is showing: " + dealer.cards.last.to_s
  puts "Your TOTAL is: #{player.cards[0].value + player.cards[1].value}"
  #player.cards[0].value
  puts "Would you like another card?"
  puts "please type 'yes' or 'no'"
    answer = gets.chomp
    if answer == "yes"
      player.cards << deck.deal
      puts "Your next card is: " + player.cards.last.to_s
    elsif answer == "no"
      puts "STAYING, with a total of: #{player.cards.map} "
    else
      puts "Please type either 'yes' or 'no'."
    until answer == ("yes" || "no") do
      player.cards << deck.deal
    return
    end
  end
end