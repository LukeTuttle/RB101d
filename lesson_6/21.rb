# A POKER GAME OF 21 (BLACK JACK)

# GLOBALS
CARD_VALS = {
  '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, 
  '9' => 9, '10' => 10, 'Jack' => 10, 'Queen' => 10, 'King' => 10
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
    arr.slice(1..).each { |card| puts card_to_s(card) }
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
  total = 0
  aces = 0

  hand.each do |card|
    if card[1] == 'Ace'
      aces += 1 
      next
    end
    total += CARD_VALS[card[1]]
  end

  aces.times do 
    if total >= 10
      total += 1
    else
      total += 11
    end
  end
  
  total
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
    
    sleep(1)
    # deal cards
    deck = get_deck
    p_cards = deal_cards!(deck, 2)
    d_cards = deal_cards!(deck, 2)
    # show cards  
    print_hand(d_cards, 'd')
    puts ''
    sleep(0.2)
    print_hand(p_cards, 'p')
    puts ''
    
    # player turn
    puts 'Player turn! =================='
    loop do
      if hit_or_stay == 'h'
        hit_me!(p_cards, deck)
        puts ''
        sleep(0.2)
        print_hand(p_cards, 'p')
        sleep(0.2)
        if hand_value(p_cards) > 21
          msg 'Bust!'
          busted = 'p'
          break
        elsif hand_value(p_cards) == 21
          msg 'You have 21! You must stay.'
          break
        end
      else
        msg 'You chose to stay!'
        break
      end
    end
    puts ''
    puts ''
    sleep(0.2)
    break if !!busted

    puts 'Dealer turn! ================='
    print_hand(d_cards, 'd')
    puts ''
    while hand_value(d_cards) < 17
      sleep(1)
      hit_me!(d_cards, deck)
      msg 'Dealer chose to hit!'
      sleep(1.5)
      if hand_value(d_cards) > 21
        puts ''
        msg 'Bust!'
        sleep (0.2)
        msg "Dealer's full hand was:"
        puts card_to_s(d_cards[0]) + '  (hidden card)'
        d_cards.slice(1..).each { |card| puts card_to_s(card)}
        busted = 'd'
        break
      end
      print_hand(d_cards, 'd')
      sleep(0.6)
    end
    break if !!busted
    sleep(0.4)
    msg 'Dealer chose to stay!'
    puts ''
    puts ''
    
    
    sleep(0.7)
    puts 'Compare cards ==================='
    puts ''
    sleep(0.2)
    msg "Let's see what the dealer's full hand is:"
    sleep(0.2)
    puts card_to_s(d_cards[0]) + '  (hidden card)'
    d_cards.slice(1..).each { |card| puts card_to_s(card)}
    puts ''    
    
    sleep(0.7)
    p_value = hand_value(p_cards)
    d_value = hand_value(d_cards)
    msg "Value of dealer hand: #{d_value} ; Value of player hand: #{p_value}"
    puts ''
    winner = 
      if d_value > p_value
        'dealer'
      elsif p_value > d_value
        'player'
      else
        'tie'
      end
    
    break

    end
    
  sleep(0.5)
  # declare winner (utilize winner variable)
  if !!busted
    msg busted == 'p' ? 'DEALER WINS!' : 'PLAYER WINS!'
  elsif winner != 'tie'
    msg "It's a tie!"
  else
    msg "#{winner.upcase} WINS!"
  end

  sleep(0.2)
  break unless play_again?
end
msg "Thanks for playing! Goodbye."
