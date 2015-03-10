class Card
  attr_accessor :suit,
                :face,
                :value,
                :dealt
  def initialize(cardnumber, suit)
    @dealt = false
    @suit = suit
    case cardnumber
    when 2..10
      @face = cardnumber
      @value = cardnumber
    when 11
      @face = "Jack"
      @value = 10
    when 12
      @face = "Queen"
      @value = 10
    when 13
      @face = "King"
      @value = 10
    else
      @face = "Ace"
      @value = 11
    end
  end

  def show
    "#{@face} of #{@suit}"
  end

  def dealt?
    @dealt
  end

  def just_dealt
    @dealt = true
  end

end


class Deck
  @@deck = []
  (1..13).each do |x|
    @@deck << Card.new(x, "Hearts")
    @@deck << Card.new(x, "Diamonds")
    @@deck << Card.new(x, "Spades")
    @@deck << Card.new(x, "Clubs")
  end

  def self.show
    @@deck.each {|card| p card.show}
  end

  def self.shuffle
    @@deck.each {|card| card.dealt = false}
  end

  def self.deal
    c = @@deck.sample
    while c.dealt?
      c = @@deck.sample
    end
    c.just_dealt
    return c
  end
end


class Hand
  attr_accessor :hand,
                :total,
                :owner
  def initialize(owner)
    @owner = owner
    @hand = []
    @hand << Deck.deal
    @hand << Deck.deal
    @total = @hand[0].value + @hand[1].value
  end

  def hit
    c = Deck.deal
    @hand << c
    @total += c.value
  end

  def show
    puts "Hand for #{@owner}:"
    @hand.each do |c|
      puts "#{c.face} of #{c.suit}"
    end
    puts "total: #{@total}"
  end
end

class Game

  def self.new
    Deck.shuffle
    dealer = Hand.new("Dealer")
    player = Hand.new("Player")
    puts "Dealer's up card is #{dealer.hand.first.show}"
    player.show
    if player.total == 21
      puts "BlackJack!!! You win!"
      return
    end
    puts "Would you like to hit? (y/n)"
    one_more = gets.chomp
    until player.total > 21 || one_more == "n" do
      player.hit
      player.show
      if player.total > 21
        puts "You busted! You get nothing! You lose! Good day, sir!"
        return
      else
        puts "Would you like to hit? (y/n)"
        one_more = gets.chomp
      end
    end
    dealer.show
    until (dealer.total >= 17) do
      puts "Dealer has #{dealer.total}. Dealer hits."
      dealer.hit
      dealer.show
    end
    if dealer.total > 21
      puts "Dealer busts.  You win!"
      return
    end
    case
    when player.total > dealer.total
      puts "You win!"
    when player.total < dealer.total
      puts "Dealer wins and takes your money."
    else
      puts "Push! Try again"
    end

  end

end

another = "y"
until (another.eql? "n") do
  Game.new
  puts "Would you like to play another hand?(y/n)"
  another = gets.chomp
end