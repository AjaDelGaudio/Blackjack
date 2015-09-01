require 'pry'
#Paired Casey Kim & Aja
#!/usr/bin/env ruby

# YOUR CODE HERE
require_relative "card"
require_relative "deck"
require_relative "hand"
require 'pry'

puts "Welcome to Blackjack!\n\n"


deck = Deck.new
player = Hand.new("Player")
dealer = Hand.new("Dealer")

def initial_hand(deck, hand)
  2.times {hand.new_card(deck.deal!)}
end

initial_hand(deck, player)
player.current_total
player.best_score
puts "Player score: #{player.total}\n"


def hit_or_stand(deck, player)
  continue = true
  while player.total < 21 && continue
    print "\nHit or stand? (H/S): "
    input = gets.chomp
    if !['h', 's'].include?(input.downcase)
      puts "Invalid input!"
      hit_or_stand(deck, player)
    elsif input == 's'
      continue = false
    elsif input == 'h'
      player.new_card(deck.deal!)
      player.current_total
      player.best_score
      puts "Player score: #{player.total}\n"
       if player.total == 21
         puts "Blackjack!"
       elsif player.total > 21
         puts "Bust!"
       end
      hit_or_stand(deck, player)
    end
  end
end
hit_or_stand(deck, player)

puts "\n"
initial_hand(deck, dealer)
dealer.current_total
dealer.best_score

while dealer.total < 17
  dealer.new_card(deck.deal!)
  dealer.current_total
  dealer.best_score
end
puts "Dealer score: #{dealer.total}\n"
if dealer.total == player.total
  puts "Draw - dealer and player tie"
elsif dealer.total == 21
  puts "Dealer wins"
elsif dealer.total > 21
  puts "Dealer busts"
end

if dealer.total > player.total && dealer.total <= 21
  puts "Dealer wins"
elsif dealer.total <= 21 && player.total > 21
  puts "Dealer wins"
elsif player.total > dealer.total && player.total <= 21
  puts "Player wins"
end
