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