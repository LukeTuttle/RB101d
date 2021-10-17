# 1. Display the initial empty 3x3 board.
# 2. Ask the user to mark a square.
# 3. Computer marks a square.
# 4. Display the updated board state.
# 5. If winner, display winner.
# 6. If board is full, display tie.
# 7. If neither winner nor board is full, go to #2
# 8. Play again?
# 9. If yes, go to #1
# 10. Good bye!



def msg(str)
  puts "=> #{str}"
end

def open_msg(brd)
  puts " TIC - TAC - TOE"
  disp_board(brd)
  puts ""
  msg "Where would you like to make your first move?"
end

def joiner(arr, delim = ', ', final_delim = 'or')
  return arr[0].to_s if arr.size < 2
  return "#{arr[0]} #{final_delim} #{arr[1]}" if arr.size == 2
  last = arr.pop.to_s
  arr.join(delim) + delim + final_delim + ' ' + last
end

def user_move(board)
  usr_input = ''
  loop do
    msg "Choose a position to place a piece: " +
        joiner(board.select { |_, value| value == ' ' }.keys, ', ') # provides available spots
    usr_input = gets.chomp.to_i
    possible_moves = board.select { |_, value| value == ' ' }.keys

    if possible_moves.include?(usr_input)
      break
    elsif (1..9).include?(usr_input)
      msg "It looks like that spot is taken..."
    else
      msg "Invalid input! Enter any integer from 1 to 9."
    end
  end
  board[usr_input] = 'X'
end

def computer_move(board)
  possible_moves = board.select { |_, value| value == ' ' }.keys
  computer_choice = possible_moves.sample
  board[computer_choice] = 'O'
  msg "Computer chose box #{computer_choice}!"
end

def wipe_board(brd)
  (1..9).each do |i|
    brd[i] = ' '
  end
end

def board_full?(board)
  board.values.all? { |value| value != ' ' }
end

def play_again?
  usr_input = nil
  loop do
    msg "Want to play again? y/n: "
    usr_input = gets.chomp.downcase
    ['y', 'n'].include?(usr_input) ? break : msg('Invalid input!')
  end
  usr_input == 'y'
end

def win_msg(board)
  winner = winner_check(board)
  msg winner == 'player' ? 'You won!' : 'Shoot...computer won this time.'
end

SOLUTIONS = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
            [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
            [[1, 5, 9], [3, 5, 7]]              # diagonals

def winner_check(board)
  winner = nil
  SOLUTIONS.each do |line|
    winner = 'player' if line.all? { |box| board[box] == 'X' }
    winner = 'computer' if line.all? { |box| board[box] == 'O' }
  end
  winner
end

def disp_board(brd)
  puts %(

      |     |
   #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}
 _____|_____|_____
      |     |
   #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}
 _____|_____|_____
      |     |
   #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}
      |     |
    )
end

board = {}
(1..9).each do |i|
  board[i] = i.to_s
end

def score_to_s(score)
  score = score.to_a.map { |arr| joiner(arr, '', ':') }
  score[0] + ', ' + score[1]
end

score = { player: 0, computer: 0 }

# MAIN PROGRAM
open_msg board # board is initialized with boxes numbered
loop do
  wipe_board board
  loop do
    user_move board
    disp_board board

    if !!winner_check(board)
      win_msg board
      break
    end
    if board_full?(board)
      msg 'A tie!'
      break
    end

    computer_move board
    disp_board board

    if !!winner_check(board)
      win_msg board
      break
    end
    if board_full?(board)
      msg 'A tie!'
      break
    end
  end # single game loop ends here

  if !!winner_check(board)
    score[winner_check(board).to_sym] += 1
  end
  if score.values.any? { |wins| wins == 5 }
    msg "#{winner_check(board)} won the game! #{score_to_s(score)}."
    break
  end
  msg "The score is now #{score_to_s score}. First one to score 5 wins."
  if play_again?
    msg "Ok the board has been reset. Good luck!"
    puts '--------------------------------------'
    2.times { puts '' }
  else
    break
  end
end
msg "Thanks for playing! Bye!"
