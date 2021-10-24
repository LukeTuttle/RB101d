# A POKER GAME OF 21 (BLACK JACK)
require 'pry-byebug'

# OUTPUT to STDOUT (& helpers)
def card_to_s(arr)
  "#{arr[1]} of #{arr[0]}"
end

def msg(str)
  puts "=> " + str
end


def print_hand(arr, person = 'p', cards_val = p_cards_val) # p = player, d = dealer
  if person == 'p'
    msg 'Player shows:'
    arr.each { |card| puts card_to_s(card) }
    puts "Total: #{cards_val}"
  elsif person == 'd'
    msg 'Dealer shows:'
    arr.slice(1..).each { |card| puts card_to_s(card) }
    hidden_val = card_value(arr[0][1], cards_val)
    puts "Total: #{cards_val - hidden_val}" 
    end
end

# CREATE and DEAL CARDS
def get_deck
  suits = ['Hearts', 'Clovers', 'Diamonds', 'Spades']
  values = ['Jack', 'Queen', 'King', 'Ace'].union(('2'..'10').to_a)
  suits.product(values).shuffle
end
  
def deal_cards!(dekk, n_cards)
  cards = []
  n_cards.times { cards << dekk.pop }
  cards
end


# TURNS and LOOPING
def hit?
  usr_input = nil
  msg "Do you want to 'hit' or 'stay'? (h/s):"
  loop do
    usr_input = gets.chomp.downcase
    ['h', 's'].include?(usr_input) ? break : msg('Invalid input!')
  end
  usr_input == 'h'
end

def play_again?
  usr_input = nil
  msg "Do you want to play again? (y/n):"
  loop do
    usr_input = gets.chomp.downcase
    ['n', 'y'].include?(usr_input) ? break : msg('Invalid input!')
  end
  usr_input.start_with?('y')
end
  
# CALC HAND VALUES and COMPUTER LOGIC

def card_value(str, cards_value)
  if str == 'Ace'
    cards_value >= 11 ? 1 : 11
  elsif ('A'..'Z').include?(str[0]) # face card
    10
  else
    str.to_i
  end
end

def hand_value(cards) # taken from LS solution
  # cards = [['Hearts', '3'], ['Spades', 'Queen'], ... ]
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    if value == "Ace"
      sum += 11
    elsif value.to_i == 0 # J, Q, K
      sum += 10
    else
      sum += value.to_i
    end
  end

  # correct for Aces
  values.select { |value| value == "Ace" }.count.times do
    sum -= 10 if sum > 21
  end

  sum
end
  
  
# MAIN PROGRAM
p_score = 0
d_score = 0

msg 'Welcome to 21! Good Luck!'
loop do
  puts '=========================\n\n'
  msg "The score is: Dealer #{d_score} ; Player #{p_score}\n\n"
  msg "Dealing cards...\n\n"
  sleep(1)

  # deal cards
  deck = get_deck
  p_cards = deal_cards!(deck, 2)
  d_cards = deal_cards!(deck, 2)
  
  p_cards_val = hand_value(p_cards)
  d_cards_val = hand_value(d_cards)
  # show cards  
  print_hand(d_cards, 'd', d_cards_val)
  
  sleep(0.2)
  print_hand(p_cards, 'p', p_cards_val)
  puts ''
  
  # player turn
  puts "Player turn! ==================\n\n"
  loop do
    if hit?
      p_cards << deal_cards!(deck, 1)[0]
      p_cards_val = hand_value(p_cards)
      sleep(0.2)
      if p_cards_val > 21
        break
      elsif p_cards_val == 21
        msg 'You have 21! You must stay.'
        break
      end
    else
      msg 'You chose to stay!'
      break
    end
    print_hand(p_cards, 'p', p_cards_val)
    sleep(0.2)
  end

  if p_cards_val > 21 
    msg "You busted! Dealer wins!"
    p_score += 1 
    if d_score == 5 || p_score == 5
      break
    elsif play_again?
      next
    else
      break
    end
  end

  puts "Dealer turn!=================\n\n"
  loop do 
    break if d_cards_val > 17
    puts "reads less than 17" if d_cards_val < 17
    puts ''
    print_hand(d_cards, 'd', d_cards_val)
    sleep(1)
    
    d_cards << deal_cards!(deck, 1)[0]
    d_cards_val = hand_value(d_cards)
    msg 'Dealer chose to hit!'
    sleep(1.2)
  end

  if d_cards_val > 21
    puts ''
    msg "Dealer busted! You win!"
    sleep (0.2)
    msg "Dealer's full hand was:"
    puts card_to_s(d_cards[0]) + '  (hidden card)'
    d_cards.slice(1..).each { |card| puts card_to_s(card)}
    p_score += 1 
    if d_score == 5 || p_score == 5
      break
    elsif play_again?
      next
    else
      break
    end
  else
    msg 'Dealer chose to stay!'
    print_hand(d_cards, 'd', d_cards_val)
    sleep(0.6)
  end
  
  puts "Compare cards ===================\n\n"
  sleep(0.2)
  msg "Let's see what the dealer's full hand is:"
  sleep(0.2)
  puts card_to_s(d_cards[0]) + '  (hidden card)'
  d_cards.slice(1..).each { |card| puts card_to_s(card)}
  sleep(0.7)
  puts ''    
  
  msg "Value of dealer hand: #{d_cards_val} ; Value of player hand: #{p_cards_val}\n\n"
  sleep(0.5)

  # declare winner (utilize winner variable)
  if p_cards_val > d_cards_val
    msg 'PLAYER WINS!'
    p_score += 1
  elsif d_cards_val > p_cards_val
    msg 'DEALER WINS!'
    d_score += 1
  else
    msg "It's a tie!"
  end

  msg "The score is now: Dealer #{d_score} ; Player #{p_score}"

  sleep(0.2)
  break if d_score == 5 || p_score == 5 || !play_again?
 
end
msg "Thanks for playing! Goodbye."

# Todo: 
# - check if program ends when a player reaches 5 wins. 
# - I haven't figured out how to subtract the hidden card's value from hand value when displayin the dealer hand.
# - bonus features 3 & 5 I havent even tried implementing yet. 