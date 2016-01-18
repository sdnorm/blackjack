require_relative 'blackjack_hand'

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
