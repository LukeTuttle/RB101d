# 1. Initialize deck
# 2. Deal cards to player and dealer
# 3. Player turn: hit or stay
#   - repeat until bust or "stay"
# 4. If player bust, dealer wins.
# 5. Dealer turn: hit or stay
#   - repeat until total >= 17
# 6. If dealer bust, player wins.
# 7. Compare cards and declare winner.

require 'pry-byebug'

# GLOBALS
CARD_VALS = {
  '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6,
  '7' => 7, '8' => 8, '9' => 9, '10' => 10, 'J' => 10, 'Q' => 10,
  'K' => 10, 'A' => 11
}

TRANS = {
  'faces' => {
    'J' => 'Jack', 'Q' => 'Queen', 'K' => 'King', 'A' => 'Ace'
  },
  'suits' => {
    'H' => 'Hearts', 'C' => "Clovers", 'D' => 'Diamonds', 'S' => 'Spades'
  }
}

# OUTPUT to STDOUT (& helpers)
def card_to_s(arr)
  "#{arr[1]} of #{arr[0]}"
end

def msg(str)
  puts "=> " + str
end

def print_hand(arr, person = 'p') # p = player, d = dealer
  if person == 'p'
    msg 'Player shows:'
    arr.each { |card| puts card_to_s(card) }
  elsif person == 'd'
    msg 'Dealer shows:'
    arr.slice(1..).each { |card| puts card_to_s(card )}
  end
end



# CREATE and DEAL CARDS
def get_deck
  stack = []
  suits = ['Hearts', 'Clovers', 'Diamonds', 'Spades']
  suits.each do |suit|
    (2..10).each { |card| stack << [suit, card.to_s] }
    ['Jack', 'Queen', 'King', 'Ace'].each { |card| stack << [suit, card] }
  end
  stack
end
  
  def deal_cards!(dekk, n_cards)
    cards = []
    indexes = (0..dekk.size-1).to_a.sample(n_cards)
    indexes.each { |i| cards << dekk[i] }
    cards.each { |card| dekk.delete(card) }
    cards
  end
  
  def hit_me!(hand, dekk)
    hand.push(deal_cards!(dekk, 1).flatten)
  end
  
  # TURNS and LOOPING
  def hit_or_stay
    usr_input = nil
    msg "Do you want to 'hit' or 'stay'? (h/s):"
    loop do
      usr_input = gets.chomp.downcase
      ['h', 's'].include?(usr_input) ? break : msg('Invalid input!')
    end
    usr_input
  end
  
  def play_again?
    usr_input = nil
    msg "Do you want to play again? (y/n):"
    loop do
      usr_input = gets.chomp.downcase
      ['n', 'y'].include?(usr_input) ? break : msg('Invalid input!')
    end
    usr_input == 'y'
  end
  
  # CALC HAND VALUES and COMPUTER LOGIC
  def hand_value(hand)
    false
  end
  
  
  
  # MAIN PROGRAM
loop do
  busted = false
  winner = nil
  loop do
    msg 'Welcome to 21! Good Luck!'
    puts '========================='
    2.times {puts ''}
    msg "Dealing cards..."
    puts ''
    

    # deal cards
    deck = get_deck
    p_cards = deal_cards!(deck, 2)
    d_cards = deal_cards!(deck, 2)
    # show cards  
    print_hand(d_cards, 'd')
    puts ''
    print_hand(p_cards, 'p')
    
    # player turn
    loop do
      if hit_or_stay == 'h'
        hit_me!(p_cards, deck)
        print_hand(p_cards, 'p')
    
        if hand_value(p_cards) # > 21
          msg 'Bust!'
          busted = 'p'
          break
        elsif hand_value(p_cards) # == 21
          msg 'You have 21! You must stay.'
          break
        end
      else
        msg 'You chose to stay!'
        break
      end
    end

    break if busted
    # computer turn


    # compare cards

    # declare winner (utilize winner variable)

  end

  if !!busted
    msg busted == 'p' ? 'Dealer wins!' : 'Player wins!'
  else
    msg "#{winner} wins!"
  end

  break unless play_again?
end

# TODOS: create `hand_value` which takes an array of arrays and returns an integer = to 
#       the value of the hand. dont forget about handling an ace (or multiple aces). 


