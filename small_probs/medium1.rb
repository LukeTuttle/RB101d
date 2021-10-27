require 'pry-byebug'

def prob_sep(num)
  puts "=> EXERCISE # #{num} -------------"
end


prob_sep 1
# 1 'Rotation (Part 1)'
# Understand the problem
#   Explicit requirements: write method which rotates an array by movin the first 
#      element to the end of the array. do not modify original array
#   - Input: array
#   - Output: a new array
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
  result = []
  first_element = nil
  arr.each_with_index do |x, i|
    if i == 0
      first_element = x
      next
    end
    result << x
  end
  result << first_element
end

puts rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
puts rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
puts rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
puts rotate_array(x) == [2, 3, 4, 1] # => true
puts x == [1, 2, 3, 4]

# LS Solution
# def rotate_array(array)
#   array[1..-1] + [array[0]]
# end


prob_sep 2
# 2 'Rotation (Part 2)'
# Understand the problem
#   Explicit requirements: rotate the last n digits of a number
#   - Input: integer
#   - Output: integer
#   - Additional considerations (about the problem, not the solution):
#   - 
#   - 
#   Implicit requirements:
#   Questions:

# Examples and test cases:
#  rotate_rightmost_digits(735291, 1) == 735291
# rotate_rightmost_digits(735291, 2) == 735219
# rotate_rightmost_digits(735291, 3) == 735912
# rotate_rightmost_digits(735291, 4) == 732915
# rotate_rightmost_digits(735291, 5) == 752913
# rotate_rightmost_digits(735291, 6) == 352917

# Data structures:(stay abstract/ high level; avoid implementation detail; keeps from getting boxed in a particular approach)
# - will need to use an array at some point.
# Mental model:
# - seperate the individual digits of a number into an array. Then, take the last n elements
#   and insert them just before the digit to the left of the left most digit selected
# Algorithm:
# - split number into individual digits
# - collect the last n digits and remove from array
# - insert the collection just before the final element in the array
# - join digits into an integer
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
  arr = int.to_s.chars
  arr[-n..-1] = rotate_array(arr[-n..-1])
  arr.join.to_i
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
# - split number into array
# - for each index, rotate the element at that index to the end of the array
#   updatin array as you go
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
  num = int
  num.digits.size.downto(2) do |i|
    num = rotate_rightmost_digits(num, i)
  end
  num
end

puts max_rotation(735291) == 321579
puts max_rotation(3) == 3
puts max_rotation(35) == 53
puts max_rotation(105) == 15 # the leading zero gets dropped
puts max_rotation(8_703_529_146) == 7_321_609_845


prob_sep 4
# 4 '1000 Lights'
# Understand the problem
#   Explicit requirements: write a method which takes 1 argument-- the number of switches.
#     should return an array of which switches are switched on (not the index but 
#     the ordinal of the switch).
#   - Input: integer
#   - Output: array
#   - Additional considerations (about the problem, not the solution):
#   - 
#   - 
#   Implicit requirements:
#   Questions:

# Examples and test cases:
#  switches(5) = [1,4]
#  switches(10) = [1,4, 9]

# Data structures:(stay abstract/ high level; avoid implementation detail; keeps from getting boxed in a particular approach)
# - 
# Algorithm:
# - create an array of `false` values n in length
# - if n < 1 return array, otherwise flip all switches
# - from 1 to n times starting at index i, flip the switch at index i * 1, then 
#   i * 2, then i * 3, and so on until i * x >= n 
# - get an array of which lights are on (i.e. index + 1 where true)
# - 
# - 
# - 
# - 
# - 
# - 

# Code implementation:
#  (notes relevant to actual code; remember to code with intent--think about each line)
# 

def switches(n)
  lights = Array.new(n, true)
  return lights if n == 1
  2.upto(n) do |i|
    index = i - 1
    loop do
      break if index >= n
      lights[index] = !lights[index]
      index += i
    end
  end
  result = []
  lights.each_with_index { |x, i| result << i + 1 if x == true}
  result
end

p switches(5)
p switches(10)


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
# - n times puts a line with at least one star on a line of n width
# - the number of stars in the line is equal to line # * 2 less 1
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

def print_line(line, n)
  stars = (line * 2) - 1
  spaces_half = (n - stars) / 2
  puts ' '*spaces_half + '*'*stars + ' '*spaces_half
end

def diamond(n)
  1.upto((n/2)+1) { |line| print_line(line, n) }
  (n/2).downto(1) { |line| print_line(line, n) }
end


diamond 9


def print_hollow_line(line, n)
  if line == 1
    puts ' '*(n/2) + '*' + ' '*(n/2)
  else
    stars = (line * 2) - 1
    spaces_half = (n - stars) / 2
    puts ' '*spaces_half + '*' + ' '*(stars-2).abs + '*' + ' '*spaces_half
  end  
end

def diamond_bonus(n)
  1.upto((n / 2) + 1) { |line| print_hollow_line(line, n) }
  (n / 2).downto(1) { |line| print_hollow_line(line, n) }
end

diamond_bonus 9


prob_sep 6
# 6 'Stack Machine Interpretation'
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
# - convert the string into an array of commands
# - initialize stack to [] and register to 0
# - loop through array of commands
# - 
# - 
# - 
# - 
# - 
# - 

# Code implementation:
#  (notes relevant to actual code; remember to code with intent--think about each line)
# probs can use a case statement

# def cmd_logic(cmd, stack, register)
#   case cmd
#   when cmd.integer? then register = cmd
#   when 'PUSH'       then stack.unshift(register)
#   when 'ADD'        then register += stack.pop
#   when 'SUB'        then register -= stack.pop
#   when 'MULT'       then register *= 
#   when 'PRINT'      then puts register
#   else
#     puts 'COMMAND NOT RECOGNIZED!'
#   end
# end

commands = {
  'PUSH' => :unshift,
  'ADD' => :+,
  'SUB' => :-,
  'MULT' => :*,
  'DIV' => :/,
  'MOD' => :%,
  'POP' => :pop,
  'PRINT' => :puts
}

# def minilang(str)
#   cmds = str.split.map { |x| x.to_i.to_s == x ? x.to_i : x }
#   stack = []
#   register = 0 

#   cmds.each do |cmd|
#     cmd_logic(cmd, stack, register)
#   end
# end


COMMANDS = {
  'ADD' => :+,
  'SUB' => :-,
  'MULT' => :*,
  'DIV' => :/,
  'MOD' => :%,
  'POP' => :pop,
  'PRINT' => :puts
}

def command_logic(cmd, stack, register)
  if cmd.to_s.to_i == cmd
    register << cmd
  elsif cmd == 'PRINT'
    puts register
  elsif cmd == 'PUSH'
    stack.unshift register
  elsif cmd == 'POP'
    register << stack.pop
  else
    right_side = stack.pop
    register << register.method(COMMANDS[cmd]).call(right_side)
  end
end


def minilang(str)
  cmds = str.split.map { |x| x.to_i.to_s == x ? x.to_i : x }
  stack = []
  register = 0
  cmds.each do |cmd|
    if cmd.to_s.to_i == cmd
      register = cmd
    elsif cmd == 'PRINT'
      puts register
    elsif cmd == 'PUSH'
      stack.push register
    elsif cmd == 'POP'
      register = stack.pop
    else
      right_side = stack.pop
      register = register.method(COMMANDS[cmd]).call(right_side)
    end
  end
  nil
end

# minilang('5 PUSH 6 ADD PRINT')
# puts '=========='
# minilang('1 PUSH 2 PUSH 3 PUSH 4 PUSH POP PRINT POP PRINT POP PRINT')

# Bonus
minilang('3 PUSH 5 MOD PUSH 7 PUSH 5 PUSH 4 MULT SUB PUSH 3 ADD DIV PRINT')


prob_sep 7
# 7 'Word to Digit'
# Understand the problem
#   Explicit requirements: when digits (one, two, three, etc) are spelled out, replace them with 1,2,3 etc
#   - Input: a string
#   - Output: a new string
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
# - split string into words
# -  check each word against list of digit words
#   -  if it is a digit word then substitute it for its string digit, otherwise return the word as is
# - join words into a single string
# - 
# - 
# - 
# - 
# - 

# Code implementation:
#  (notes relevant to actual code; remember to code with intent--think about each line)
# 

words_arr = [
  'zero', 'one', 'two', 'three', 'four',
  'five', 'six', 'seven', 'eight', 'nine'
]

NUMS = words_arr.zip(('0'..'9').to_a).to_h

def word_to_digit(str)
  NUMS.keys.each do |word|
    str.gsub!(/\b#{word}\b/, NUMS)
  end
  str
end

puts word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

puts word_to_digit('Please call me at five five five one two three four. Thanks.')

prob_sep 8
# 8 'Fibonacci Numbers (Recursion)'
# Understand the problem
#   Explicit requirements:
#   - Input: an integer
#   - Output: the nth fibonacci number where n is the integer supplied
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
# - return 1 if < 3
# - return 
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

def fibonacci(n)
  return 1 if n < 3
  fibonacci(n - 1) + fibonacci(n - 2)
end

puts fibonacci(1) == 1
puts fibonacci(2) == 1
puts fibonacci(3) == 2
puts fibonacci(4) == 3
puts fibonacci(5) == 5
puts fibonacci(12) == 144
puts fibonacci(20) == 6765


prob_sep 9
# 9 'Fibonacci Numbers (Procedural)'

# My Solution
# def fibonacci(n)
#   first = 1
#   second = 1
#   (n-2).times do 
#     tmp = second
#     second = first + second
#     first = tmp
#   end
#   second
# end

# LS Solution
def fibonacci(nth)
  first, last = [1, 1]
  3.upto(nth) do
    first, last = [last, first + last]
  end

  last
end

puts fibonacci(20)
puts fibonacci(100)
puts fibonacci(20) == 6765
puts fibonacci(100) == 354224848179261915075
# puts fibonacci(100_001) # => 4202692702.....8285979669707537501

prob_sep 10
# 10 'Fibonacci Numbers (Last Digit)'
def fibonacci_last(n)
  fibonacci(n).to_s[-1].to_i
end

puts fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
puts fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
puts fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
puts fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
puts fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
puts fibonacci_last(123456789) # -> 4
