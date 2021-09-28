def problem_sep(num)
  puts "=> EXERCISE # #{num} -------------"
end

problem_sep(1)
# 1 'repeat yourself'
def repeat(string, num)
  num.times { puts string }
end

repeat("Hello", 3)

problem_sep(2)
# 2 'odd'
def is_odd?(num)
  num % 2 == 1
end

puts is_odd?(4)
puts is_odd?(5)

problem_sep(3)
# 3 'list of digits'
def digit_list(num)
  num.to_s.chars.map(&:to_i)
end

puts digit_list(12345)

problem_sep(4)
# 4 'how many?'
# Requirement: write a method that ocunts the number of occurences of each element in a given array.
#              Once counted, print each element alongside the number of occurrences. 
# PEDAC
#   mental model:
#     supplied with a array, create a new array and add each new unique element
#       (yes case sensitive) as a sub array in which the 1 index
#       spot is used to keep track of the number of occurences
#       Then print each value along side its # of occurences.
#
#     input/output: Array / Hash (reasoning for Hash output:
#       the resulting object is searchable by key which will help keep track of counting)
#
#   Algorithm:
#     - create empty hash named hash_out
#     - for each element in array
#       - element exists as a key in hash_out? 
#         - if true: increment value by one
#         - if false: append element as key to hash_out and set value to 1
#     - print hash
#
#   Edge cases: (note- I tested these after I built the method and tested with non-edge cases; they all work)
#               - symbol
#               - boolean (both true and false)
#               - float #
#
def count_occurences(arr)
  hash_out = Hash.new
  arr_length = arr.length
  loop_count = 0
  while loop_count < arr_length
    current_element = arr[loop_count]
    if hash_out.include?(current_element)
      hash_out[current_element] += 1
    else
      hash_out.store(current_element, 1)
    end

    loop_count += 1
  end
  puts hash_out
end

test_array = [1, :some_key, :some_key, 'a string', 'D', 'D', 'd', true, true, false, 1.56]
p "the test array is "
p test_array

count_occurences(test_array)

problem_sep(5)
# 5 'Reverse it'
# Requirement: write a method that takes one argument, a string, and returns a new string
#   with the words in reverse order. a string of only 'spaces' should return an empty string
# 
# mental model: split the words into an array then reverse the order and flatten
#                 the result into a single string.
# Algorithm:
#   - IF the string is only spaces or just an empty string THEN return empty string
#   - split string by ' ' 
#   - str.reverse!
#   - SET an empty string new_string
#   - LOOP through the array appending each item to the end of new_string (dont forget ' ' in between)
#   - RETURN new_string

def reverse_sentence(str)
  return '' if str.empty? 
  str = str.split(' ').reverse
  new_string = ''
  loop_counter = 0

  while loop_counter < str.length
    new_string << " #{str[loop_counter]}"
    loop_counter += 1
  end
  new_string
end

puts reverse_sentence("Why    hello Gov'na")
puts reverse_sentence('           ')

problem_sep(6)
# Reverse it (Part 2)
# Requirements: write a method which takes one argument, a string containing 1+ words
#                 and returns the given string with words that contain 5+ chars reversed.
# Mental model: take the string and split by ' '. Check each element for # of characters
#                 and if it has >= 5 then note its index in the array and reverse
#                 the order of the characters. Next insert it back into the array 
#                 in its original position.
# Algorithm: 
# - split str by ' ' 
# - Loop through the array
#   - IF element's # of chars >= 5
#     - reverse the order of the chars
#   - ELSE next element
#   - END
# - END
# - joint array into a string
# - return string
# END
#
def reverse_sentence(str)
  str = str.split
  str.map! do |x|
    if x.chars.length >= 5
      x = x.reverse
    end
    x
  end
  str.join(' ')
end

puts reverse_sentence("Is this word reversed?")

problem_sep(7)
# 7 'Stringy strings'
# Requirements: write a method that takes one argume, a positive integer and
#                 returns a string of alternating 1s and 0s, always starting with 1.
#               The length of the string should match the given integer. 
#               - starts with 1
#               - matches length
#               - alternates 1/0
# Mental model: make a loop which iterates through appending 1 or 0 to the end of
#                 a string until the length of the string is equal to the argument 
#                 integer value. Use a true/false switch to alternate between 1 & 0
# Algorithm:
# - SET bin_switch to true
# - initialize empty string
# - LOOP until string.size = arg
#   - use an IF statement with bin_switch as test to assign 1 or 0
# - END LOOP
# - Return string
# - END

def stringy(int)
  bin_switch = true
  out_str = ''
  until out_str.size == int
    bit = bin_switch ? '1' : '0'
    out_str << bit 
    bin_switch = !bin_switch
  end
out_str
end 

puts stringy(6) == '101010'

problem_sep(8)
# 8 'Array Average'
# Requirements:
#  Write a method that takes one arument, an array containing integers,
#    and returns the average of all numbers in the array.
#  The array will nvever be empty and the numbers will always be positie integers.
#  Your result should also be an integer.
#  - Takes an positive integer array
#  - Outputs the average of array using integer division

def average(arr)
  output = 0
  arr.each do |num|
    output += num
  end
  output / arr.size
end

puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

problem_sep(9)
# 9 'Sum of Digits'
# Requirements:
# - takes an integer and returns sum of its digits.
# Algorithm:
#   - convert int to string
#   - split string into characters
#   - convert string array to integer array
#   - reduce array and output result

def sum(int)
  int.to_s.chars.map(&:to_i).reduce(:+)
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

problem_sep(10)
# 10 'What's my Bonus?'
# Requirements:
#   Write a method that takes two arguments, a positive integer
#     and a boolean, and calculates the bonus for a given salary.
#   If the boolean is true, the bonus should be half of the salary.
#   If the boolean is false, the bonus should be 0.

def calculate_bonus(sal, bool)
  bool ? sal.to_f / 2 : 0
end
puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000

puts "END"
