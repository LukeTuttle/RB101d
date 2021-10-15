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
# require 'pry'
# require 'pry-byebug'

tracker = {}
(1..9).each do |i|
  tracker[i] = i.to_s
end

disp_board = Proc.new {
  puts %(
      |     |
   #{tracker[1]}  |  #{tracker[2]}  |  #{tracker[3]}
 _____|_____|_____
      |     |
   #{tracker[4]}  |  #{tracker[5]}  |  #{tracker[6]}
 _____|_____|_____
      |     |
   #{tracker[7]}  |  #{tracker[8]}  |  #{tracker[9]}
      |     |)
}


def open_msg(board)
  puts " TIC - TAC - TOE"
  board.call
  puts ""
  puts "Where would you like to make your first move?"
end

def usrmv()
  puts "Your turn. Input 1-9:"
  gets.chomp.to_i
end

# wipes board
def wipe_board(t)
  (1..9).each do |i|
    t[i] = ' '
  end
end
## 1 Display Board
open_msg disp_board
wipe_board tracker

tracker[usrmv] = 'X'
puts tracker
disp_board.call






puts '---END---'