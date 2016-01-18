require_relative 'blackjack_card'

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
