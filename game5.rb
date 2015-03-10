class Game
   attr_accessor :deck, :player, :cpu, :value
 
   def initialize
      @player = []
      @cpu = []
      @cpu_array = []
      #create a new deck and shuffles
      game = Deck.new
      game.build_cards
      @deck = game.cards.shuffle
   end
 
   def dealsecond which
      card_dealt = deck.shift(1)
      p "**HIDDEN**"
      validate card_dealt, which
   end
 
   def deal which
      card_dealt = deck.shift(1)
      display card_dealt
      validate card_dealt, which
   end
 
   def display a
       a.each do |b|
        puts "#{b.value} of #{b.suit}"
       end
   end
 
   def hidden
      card_dealt = deck.shift(1)
   end
 
   def show
      puts "Dealer shows a #{cpu[1]}"
   end
 
   def hit a
      until (sum a) >= 21
         puts "Do you want to Hit? (Y/N)"
         response = gets.chomp
         if response.downcase == "y"
            deal a
            puts "Your Total: #{sum a}"
            evaluate a
         elsif response.downcase == "n"
            show
            dealerhit
            break
         end
      end
   end
 
   def dealerhit
      until (sum cpu) > 16
         puts "Dealer Hits"
         deal cpu
         evaluate cpu
      end
   end
 
   #controls player array
   def validate a, b
      if a[0].value == "J" || a[0].value == "Q" || a[0].value == "K"
         b << 10
      elsif a[0].value == "A"
         b << 11
      else
         b << a[0].value
      end
   end
 
   #sums up array, passes either player or cpu array as x
   def sum x
      x.map{|i| i.to_i}.inject(:+)
   end
 
   def evaluate a
      if (sum a) == 21
         puts "BLACKJACK!"
      elsif (sum a) > 21
         puts "BUSTED!"
      end
   end
 
   def winner
      if ((sum player) > (sum cpu) && (sum player) <= 21) || (sum cpu) > 21
         puts "You Win!"
      elsif ((sum cpu) > (sum player) && (sum cpu) <= 21) || (sum player) > 21
         puts "You Lose!"
      else
         puts "PUSH!"
      end
   end
 
class Card
   attr_accessor :suit, :value
   def initialize(suit, value)
      @suit = suit
      @value = value
   end
end
 
class Deck
   attr_accessor :cards
 
   def initialize
      @cards = []
   end
 
   def build_cards
      suits = [:hearts, :diamonds, :spades, :clubs]
      suits.each do |suit|
         (2..10).each do |value|
            @cards << Card.new(suit, value)
      end
         @cards << Card.new(suit, "J")
         @cards << Card.new(suit, "Q")
         @cards << Card.new(suit, "K")
         @cards << Card.new(suit, "A")
      end
   end
end
end
 
 
ng = Game.new
puts "\nDealer's Hand: "
ng.deal ng.cpu
ng.dealsecond ng.cpu
puts "-------------------------"
puts "Your Hand: "
ng.deal ng.player
ng.deal ng.player
puts "\nYour Total: #{ng.sum ng.player}"
ng.hit ng.player
puts "\nDealer Total: #{ng.sum ng.cpu}"
ng.winner