def prob_sep(num)
  puts "=> EXERCISE # #{num} -------------"
end

require "pry-byebug"

prob_sep 1
# 1 'Rotation (Part 1)'
# Understand the problem
#   Explicit requirements:
#   - Input:
#   - Output:
#   - Additional considerations (about the problem, not the solution):
#   - 
#   - 
#   Implicit requirements:
#   Questions:

# Examples and test cases:
#  

# Data structures:(stay abstract/ high level; avoid implementation detail; keeps from getting boxed in a particular approach)
# - 
# Algorithm:
# - 
# -  
# - 
# - 
# - 
# - 
# - 
# - 
# - 

# Code implementation:
#  (notes relevant to actual code; remember to code with intent--think about each line)
# 

def rotate_array(arr)
  new_arr = arr.clone
  new_arr.push(new_arr.shift)
end

puts rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
puts rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
puts rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
puts rotate_array(x) == [2, 3, 4, 1]   # => true
puts x == [1, 2, 3, 4]                 # => true

prob_sep 2
# 2 'Rotation (Part 2)'
# Understand the problem
#   Explicit requirements:
#   - Input:
#   - Output:
#   - Additional considerations (about the problem, not the solution):
#   - 
#   - 
#   Implicit requirements:
#   Questions:

# Examples and test cases:
#  

# Data structures:(stay abstract/ high level; avoid implementation detail; keeps from getting boxed in a particular approach)
# - 
# Algorithm:
# - 
# -  
# - 
# - 
# - 
# - 
# - 
# - 
# - 

# Code implementation:
#  (notes relevant to actual code; remember to code with intent--think about each line)
# 

def rotate_array(array)
  array[1..-1] + [array[0]]
end

def rotate_rightmost_digits(int, n)
  int = int.to_s.chars
  first_half = int[0...-n].join
  second_half = int[-n..]
  second_half = second_half.push(second_half.shift).join

  (first_half + second_half).to_i  
end

puts rotate_rightmost_digits(735291, 1) == 735291
puts rotate_rightmost_digits(735291, 2) == 735219
puts rotate_rightmost_digits(735291, 3) == 735912
puts rotate_rightmost_digits(735291, 4) == 732915
puts rotate_rightmost_digits(735291, 5) == 752913
puts rotate_rightmost_digits(735291, 6) == 352917

prob_sep 3
# 3 'Rotation (Part 3)'
# Understand the problem
#   Explicit requirements:
#   - Input:
#   - Output:
#   - Additional considerations (about the problem, not the solution):
#   - 
#   - 
#   Implicit requirements:
#   Questions:

# Examples and test cases:
#  

# Data structures:(stay abstract/ high level; avoid implementation detail; keeps from getting boxed in a particular approach)
# - 
# Algorithm:
# - 
# -  
# - 
# - 
# - 
# - 
# - 
# - 
# - 

# Code implementation:
#  (notes relevant to actual code; remember to code with intent--think about each line)
# 

def max_rotation(int)
  int.digits.size.downto(2) { |n| int = rotate_rightmost_digits(int, n) }
  int
end

puts max_rotation(12345)
puts max_rotation(735291) == 321579
puts max_rotation(3) == 3
puts max_rotation(35) == 53
puts max_rotation(105) == 15 # the leading zero gets dropped
puts max_rotation(8_703_529_146) == 7_321_609_845

prob_sep 4
# 4 '1000 Lights'
# Understand the problem
#   Explicit requirements:
#   - Input:
#   - Output:
#   - Additional considerations (about the problem, not the solution):
#   - 
#   - 
#   Implicit requirements:
#   Questions:

# Examples and test cases:
#  

# Data structures:(stay abstract/ high level; avoid implementation detail; keeps from getting boxed in a particular approach)
# - 
# Algorithm:
# - create a data structure `switches` of `n` lenght to track switch status
# - iterate over `switches` n times such that for i in 1 to `n`:
  # - the status of multiples of `i` have their status fliped
# - return an array which contains index+1 of each light which has an 'on' status 
# - 
# - 
# - 
# - 
# - 

# Code implementation:
#  (notes relevant to actual code; remember to code with intent--think about each line)

def flip_switches(n)
  switches = (1..n).to_a.zip(Array.new(n, false)).to_h
  1.upto(n) do |i|
    switches.each do |switch, status|
      switch % i == 0 ? switches[switch] = !status : next
    end
  end
  switches.select {|_, v| v}.keys
end

puts flip_switches(1000) == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 225, 256, 289, 324, 361, 400, 441, 484, 529, 576, 625, 676, 729, 784, 841, 900, 961]

prob_sep 5
# 5 'Diamonds!'
# Understand the problem
#   Explicit requirements:
#   - Input:
#   - Output:
#   - Additional considerations (about the problem, not the solution):
#   - 
#   - 
#   Implicit requirements:
#   Questions:

# Examples and test cases:
#  

# Data structures:(stay abstract/ high level; avoid implementation detail; keeps from getting boxed in a particular approach)
# - 
# Algorithm:
# - create a counter `i`
# - SET a flag `way_up` to true
# - LOOP: for each line `i` in the diamond:
  # - SET `sp_chars` to (i*2) - 1 
  # - SET `spaces` to n - sp_chars
  # - SET `line_string` to get_line_string(sp_chars, spaces)
    # return a string: ' '*(spaces/2) + '*'*sp_chars + ' '*(spaces/2)
  # - output line_string
  # - if i = (n/2).ceil SET way_up to false
  # - if way_up == true increment i by 1 else decrement by 1
  # - break if i == 0
# END



# Code implementation:
#  (notes relevant to actual code; remember to code with intent--think about each line)


def diamond(n)
  special_char = '*'
  way_up = true
  i = 1
  loop do
    sp_chars = (i * 2) - 1
    half_spaces = (n - sp_chars) / 2
    line_string = get_line_string(special_char, sp_chars, half_spaces)
    puts line_string
    # binding.pry
    way_up = i == (n/2.0).ceil ? false : way_up
    incrementer = way_up ? 1 : -1
    i += incrementer
    break if i == 0
  end
end

def get_line_string(special_char, sp_chars, half_spaces)
  # binding.pry
  "#{' '*half_spaces}#{special_char * sp_chars}#{' '*half_spaces}"
end

diamond(1)
diamond(3)
diamond(9)

prob_sep 6
# 6 'Stack Machine Interpretation'; time started: 12:23 
# Understand the problem
#   Explicit requirements:
#   - Input:
#   - Output:
#   - Additional considerations (about the problem, not the solution):
#   - 
#   - 
#   Implicit requirements:
#   Questions:
# Mental model: create a stack array and a register variable (set to 0).
# - create a structure to filter the commands through. Structure will need to be in a loop
# - 
# - 
# Algorithm:
# - set  `register` to 0
# - set `stack` to empty array
# - set commands to `commands` split into individuals commands in array
# - for each item in commands run it through an interpreter 
  # - LOOP
  # - set cur_cmd to last element of commands and remove item from commands
  # - if cur_cmd is one of: ADD SUB MULT DIV MOD then run `arith_cmd` 
    # set `stack_val` to popped val from stack
    # set `register` to result of arithmetic operation (op depends on command)
    # END
  # - else if cur_cmd is N PUSH or POP then run `push_pop_cmd`
  # - else print register value
  # - break if commands is empty
# - 

# Data structures:(stay abstract/ high level; avoid implementation detail; keeps from getting boxed in a particular approach)
# Code implementation:
#  (notes relevant to actual code; remember to code with intent--think about each line)

def minilang(commands)
  register = 0
  stack = []
  commands.split.each do |command|
    if %w(ADD SUB MULT DIV MOD).include? command
      register = arith_cmd(command, register, stack)
    else
      case command
      when 'PUSH'  then stack.push(register)
      when 'POP'   then register = stack.pop
      when 'PRINT' then puts register
      else              register = command.to_i
      end
    end
    break if commands.size == 0
  end
  puts 'END ===='
end


def arith_cmd(command, register, stack)
  stack_val = stack.pop
  case command
  when 'ADD'
    register + stack_val
  when 'SUB'
    register - stack_val
  when 'MULT'
    register * stack_val
  when 'DIV'
    register / stack_val
  else
    register % stack_val
  end
end


minilang('PRINT')
# 0

minilang('5 PUSH 3 MULT PRINT')
# 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

minilang('5 PUSH POP PRINT')
# 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

minilang('-3 PUSH 5 SUB PRINT')
# 8

minilang('6 PUSH')
# (nothing printed; no PRINT commands)

# finish time: 1:40

prob_sep 7
# 7 'Word to Digit'; time started: 1:48
# Understand the problem
#   Explicit requirements:
#   - Input:
#   - Output:
#   - Additional considerations (about the problem, not the solution):
#   - 
#   - 
#   Implicit requirements:
# - 
# Mental model: check if the word is one of: zero one two three four five six seven eight nine.
# if it is then check it against a hash which has those strings as keys and string digits for keys and add to out_str
# otherwise, append the word to an out string
# Algorithm:
# - set `digi_hsh` to a hash with alpha strings as keys and digit string as vals
# - set `out_str` to an empty string ''
# - set `words` to return of splitting the words into an array of strings by ' '
# - VERSIONS
# - # 1 
# - for each key in digi_hsh run it against the supplied str using gsub with digi_hsh as the second arg (MIGHT NEED each_with object)
  # store the result of each iteration such that it is the input for the next iteration
# return the modified string.
# - # 2 (incomplete )
# - for each |word| in words iterate through the keys of digi_hsh using gsub! to check for matches
  # - the substitution val will be the val of the matched key (simply put the hash as teh second arg to gsub!)
# - 
# - 

# Data structures:(stay abstract/ high level; avoid implementation detail; keeps from getting boxed in a particular approach)
# Code implementation:
#  (notes relevant to actual code; remember to code with intent--think about each line)
#


def word_to_digit(sentence)
  digi_hsh = %w(zero one two three four five six seven eight nine).zip(('0'..'9').to_a).to_h
  # out_str = ''

  digi_hsh.each_key do |key|
    sentence.gsub!(/\b#{key}\b/, digi_hsh)
  end

  sentence
end



puts word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
word_to_digit('Please call me at five five five one two three four. Thanks.')

# finish: 2:19

prob_sep 8
# 8 'Fibonacci Numbers'; time started: 2:32 
# Understand the problem
#   Explicit requirements:
#   - Input:integer
#   - Output:
#   - Additional considerations (about the problem, not the solution):
#   - must use recursion: recursive methods: call themselves at least once;
  #   - have a condition which stops the recursion (i.e. some condition which returns a value before calling itself)
  #   - use the result returned by itself
#   Implicit requirements:
# - 
# Mental model: use the n - 1 to cycle down to where the supplied arg is 1 which should return val of 2 

def fibonacci(n)
  return 1 if n <=2
  fibonacci(n - 2) + fibonacci(n - 1)
end

puts fibonacci(1) == 1
puts fibonacci(2) == 1
puts fibonacci(3) == 2
puts fibonacci(4) == 3
puts fibonacci(5) == 5
puts fibonacci(12) == 144
puts fibonacci(20) == 6765

#finished: 3:07


prob_sep 9
# 9 'Fibonacci (procedural)'; time started: 3:09 

def fibonacci(n)
  return 1 if n < 3
  result = nil
  lesser = 1
  greater = 1
  
  1.upto(n-2) do
    result = lesser + greater
    lesser = greater
    greater = result
  end
  result
end

#alternate version 
def fibonacci(n)
  first, last = [1, 1]
  3.upto(n) do
    first, last = [last, first + last]
  end
  last
end


puts fibonacci(20)
puts fibonacci(100)
puts fibonacci(100_001).to_s.slice(-10, 10)
# finish: 3:25

prob_sep 10
# 10 'Fibonacci Numbers (Last Digit)'; time started: 3:32 
# Understand the problem

# Mental model:
#
#
# Algorithm:
# - 
# - 
# - 
# 

def fibonacci_last(n)
  first, last = [1, 1]
  3.upto(n) do
    first, last = [last % 10, (first + last) % 10]
  end
  last
end

puts fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
puts fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
puts fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
puts fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
puts fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
puts fibonacci_last(123456789) # -> 4

# finish: 3:45