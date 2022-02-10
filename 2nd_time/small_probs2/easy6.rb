def prob_sep(num)
  puts "=> EXERCISE # #{num} -------------"
end

require "pry-byebug"

prob_sep 1
# 1 'Cute Angles'
# Understand the problem
#   Explicit requirements:
#   - Input:integer
#   - Output: string %(dd mm'ss")
#   - Additional considerations (about the problem, not the solution):
#   - 60 minutes in a degree, 60 second in a minute
#   - 
#   Implicit requirements:
#   Questions:

# Examples and test cases:
#  

# Data structures:(stay abstract/ high level; avoid implementation detail; keeps from getting boxed in a particular approach)
# - will need an array
# Algorithm:
# - set  `deg` to degrees
# - take remainder and set to min
# - repeat above for sec
# - format deg, min, and sec into correct string output
# - 
# - 
# - 
# - 
# - 

# Code implementation:
#  (notes relevant to actual code; remember to code with intent--think about each line)
# 

DEGREE = "\xC2\xB0"
MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60
SECONDS_PER_DEGREE = SECONDS_PER_MINUTE * MINUTES_PER_DEGREE
SECONDS_PER_360 = SECONDS_PER_DEGREE * 360
def dms(degrees_float)
  total_seconds = (degrees_float * SECONDS_PER_DEGREE).round % SECONDS_PER_360

  deg, min = total_seconds.divmod SECONDS_PER_DEGREE
  min, sec = min.divmod SECONDS_PER_MINUTE

  format(%(#{deg}#{DEGREE}%02d'%02d"), min, sec)
end

puts dms(30) == %(30°00'00")
puts dms(76.73) == %(76°43'48")
puts dms(254.6) == %(254°36'00")
puts dms(93.034773) == %(93°02'05")
puts dms(0) == %(0°00'00")
puts dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
puts '========'
puts dms(400) == %(40°00'00")
puts dms(-40) == %(320°00'00")
puts dms(-420) == %(300°00'00")

prob_sep 2
# 2 'Delete Vowels'
# Understand the problem
#   Explicit requirements:
#   - Input:array of strings
#   - Output: new string array with vowels aeiou removed
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
# - iterate through each string checking if the current character is a target vowel
  # -  if target vowel skip, otherwise append to out value
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

def remove_vowels(arr)
  target_vowels = 'aeiouAEIOU'.chars
  arr.map do |string|
    new_string = ''
    string.chars.each do |char|
      target_vowels.include?(char) ? next : new_string << char
    end
    new_string
  end
end

puts remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
puts remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
puts remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']


prob_sep 3
# 3 'Fibonacci Number Location By Length'
# Understand the problem
#   Explicit requirements:
#   - Input: integer (i.e. digit length of integer)
#   - Output: integer (i.e. ordinal index of first fibonacci number with supplied number of digits)
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
# - set index to 7
# - set first_num to 5
# - set second_num to 8
# - set fib_num to 13
# - create loop 
  # - break if length of fib_num = int_arg
  # - set first_num to second_num
  # - set second_num to fib_num
  # - set fib_num to sum of first and second nums
  # - increment index by 1
  # - END
# - return index

# Code implementation:
#  (notes relevant to actual code; remember to code with intent--think about each line)

def find_fibonacci_index_by_length(int_arg)
  index = 7
  first_num = 5
  second_num = 8
  fib_num = 13

  loop do
    break if fib_num.to_s.length == int_arg
    first_num = second_num
    second_num = fib_num
    fib_num = first_num + second_num
    index += 1
  end
  index
end

puts find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
puts find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
puts find_fibonacci_index_by_length(10) == 45
puts find_fibonacci_index_by_length(100) == 476
puts find_fibonacci_index_by_length(1000) == 4782
# puts find_fibonacci_index_by_length(10000) == 47847

prob_sep 4
# 4 'Reversed Arrays (Part 1)'
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
# - set index to 0
# - until index = length of arr - 1
  # - move the last element to the index position
  # - increment the index
  # - END
# - return new_arrr
# - 
# - 
# - 

# Code implementation:
#  (notes relevant to actual code; remember to code with intent--think about each line)
# 

def reverse!(arr)
  index = 0
  loop do
    break if index >= arr.size - 1
    arr.insert(index, arr.pop)
    index += 1
  end
  arr
end

list = [1,2,3,4]
# binding.pry
result = reverse!(list)
puts result == [4, 3, 2, 1] # true
puts list == [4, 3, 2, 1] # true
puts list.object_id == result.object_id # true

list = %w(a b e d c)
puts reverse!(list) == ["c", "d", "e", "b", "a"] # true
puts list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
puts reverse!(list) == ["abc"] # true
puts list == ["abc"] # true

list = []
puts reverse!(list) == [] # true
puts list == [] # true

prob_sep 5
# 5 'Reversed Arrays (Part 2)'
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

def reverse(arr)
  out_arr = []
  index = -1
  arr.each do |el|
    out_arr << arr[index]
    index -= 1
  end
  out_arr
end

puts reverse([1,2,3,4]) == [4,3,2,1]          # => true
puts reverse(%w(a b e d c)) == %w(c d e b a)  # => true
puts reverse(['abc']) == ['abc']              # => true
puts reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
puts list.object_id != new_list.object_id  # => true
puts list == [1, 3, 2]                     # => true
puts new_list == [2, 3, 1]                 # => true

prob_sep 6
# 6 'Combining Arrays'
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

def merge(arr1, arr2)
  combo_arr = [arr1, arr2].flatten
  out_arr = []
  combo_arr.each do |el|
    out_arr.include?(el) ? next : out_arr << el
  end
  out_arr
end

puts merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

# version 2:
def merge(arr_1, arr_2)
  array_1 | arr_2
end


prob_sep 7
# 7 'Halvsies'
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

def halvsies(arr)
  out_arr = []
  mid_point = arr.size.divmod(2).reduce(&:+)
  out_arr << arr.values_at(0...mid_point)
  out_arr << arr.values_at(mid_point..)
end

puts halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
puts halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
puts halvsies([5]) == [[5], []]
puts halvsies([]) == [[], []]

prob_sep 8
# 8 'Find the Duplicate'
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
# - check each element for equivalency against all subsequent elements. break the loop if a match is found
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

def find_dup(arr)
  arr.each_with_index do |item, index|
    arr.values_at(index...) do |comparison_item|
      break item if comparison_item == item
    end
  end
end

def find_dup(arr)
  index = 0
  item = nil
  loop do
    break if index + 2 == arr.size
    item = arr[index]
    inner_index = index + 1
    loop do
      break if inner_index == arr.size
      return item if arr[inner_index] == item
      inner_index += 1
    end
    index += 1
  end
end

puts find_dup([1, 5, 3, 1]) == 1
puts find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73

prob_sep 9
# 9 'Does My List Include This?'
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

def include?(arr, search_val)
  index = 0
  loop do
    return true if arr[index] == search_val
    index += 1
    return false if index + 1 >= arr.size
  end
end

puts include?([1,2,3,4,5], 3) == true
puts include?([1,2,3,4,5], 6) == false
puts include?([], 3) == false
puts include?([nil], nil) == true
puts include?([], nil) == false

prob_sep 10
# 10 'Right Triangles'
# Understand the problem
#   Explicit requirements:
#   - Input: integer
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
# Algorithm: n = # of lines; l = line #, x = # of asterisks; i = iteration #; y = # of spaces
# formulae: x = l; l = i 
# - iterate printing a line with X stars N times
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

def line(line_index, n)
  format("% #{n}s", '*' * line_index)
end

def triangle(n, orientation = 'bottomright')
  if orientation == 'bottomright'
    1.upto(n) { |line_index| puts line(line_index, n) }
  elsif orientation == 'topright'
    n.downto(1) { |line_index| puts line(line_index, n) }
  elsif orientation == 'bottomleft'
    1.upto(n) { |line_index| puts line(line_index, n).reverse }
  elsif orientation == 'topleft'
    n.downto(1) { |line_index| puts line(line_index, n).reverse }
  end
end

triangle(9)
triangle(9, 'topright')
triangle(9, 'topleft')
binding.pry
triangle(9, 'bottomleft')
