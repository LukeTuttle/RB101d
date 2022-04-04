require 'pry-byebug'

# time started:  2:38
# Understand the problem
#   Explicit requirements:
#   - Input:
#   - Output:
#   - Additional considerations (about the problem, not the solution):
#   - 
#   - what if the string is of only a single unique character repeated many times?
#   Implicit requirements:
# - 
# Mental model: create a substring `sub` with first two elements of the supplied string. Set a `cur_str` variable to `sub*2`. 
#  Initialize a loop, Check the current string against the first cur_str.length elements of the supplied string. If equivalent set cur_str to sub*3 and check again against first
#  cur_str.length elements of the supplied string. stop checking after cur_str.length exceeds str length. return true if equivalent

# if not equivalent then set `sub` to str[0, sub.length+1] then repeat the process of checking described above. 
# check the substring against the first substring.length elements of the supplied string. 
# to itself and check if the now 4 element substring matches the first four elements of the original. If 
# it does, then repeat the process until the substring is equal in length to the original string and they are equivalent (obvi).
# 
# if the substring fails to match at any point then add another element to the substring and repeat the process.
# once you find a substring which satisfies the criteria, return true, otherwise return false
# Algorithm:
# - SET `sub` to first two elements
# - SET `sub` to the first sub_length characters of the supplied string
# - LOOP 
  # - check the first sub.length elements of the original string against the sub string for equivalency
    # - IF equivalent then append the substring with the first `sub_length` elements of the substring and NEXT
    # - ELSE break increment sub_length by 1
# - 
# - 
# - 
# - 

# Data structures:(stay abstract/ high level; avoid implementation detail; keeps from getting boxed in a particular approach)
# Code implementation:
#  (notes relevant to actual code; remember to code with intent--think about each line)
# 

def repeated_substring_pattern(str)
  sub = str.slice(0, 2)
  counter = 2
  cur_str = ''
  loop do
    cur_str = sub * counter
    if cur_str == str.slice(0, cur_str.length)
      counter += 1
    else
      sub = str.slice(0, sub.size + 1)
      counter = 2
    end
    break unless cur_str.size < str.size
  end
  cur_str == str
end

# puts repeated_substring_pattern('abab')
# puts repeated_substring_pattern('aba')
# puts repeated_substring_pattern('aabaaba')
# puts repeated_substring_pattern('abaababaab')
# puts repeated_substring_pattern('abcabcabc')

# finished 3:27

#  problem 2 ; started 12:50

# requirements: given an array of string made only from lowercase leteers, 
#  return an array of character that occur in all array elements (including dupes)

# input: string array
# output: character array

# mental model: out_chars is the chars of the first word. search for each of these chars in the comparison words,
# if the char is found, then delete that char from the comparison word, if its not found, delete the char from the out_chars

# method 1
# outer loop controls which word in the array is being compared
# intermediate loop evaluates whether an out_chars character can stay (use select with flag set to false and turned to true if match is found in inner loop)
#  inner loop evlauates whether comparison character can stay (use each_with_index) and delete a character from the array object in the block itself)

# method 2
# make a hash of counts of each char in the first element (base). Then do the same for the next element, call it `comp` (i.e. make hash of counts).
# set the value of each key in base to the key's value minus the key's value plus the corresponding value in `comp`.
# then do the same process for the next element in the arr.

# STEPS
# 1. set `base` to a hash of character counts for the first element in array
# 2. LOOP (reutrn value not to be used) purpose: iterate over the rest of the array to compare each element's character counts again base and updating base accordingly
  # - build an hash of character counts in comparsion for the keys (i.e. character) in base
  # - LOOP (return value not to be used) purpose: iterate over the keys in base comparing their corresponding values against their counterpart values in the current comparison word.
    # - set the current value in the key/val pair in base to the current value - (current_value + current_comp_value)
    # end
  # delete any keys from base hash which have a value of zero
  # end
  # return a character array with all the elements from the keys in base, the occurences of each element should be equal to the keys value

def common_chars(array)
  base = character_counts(array[0].chars.uniq, array[0])
  out_arr = []

  array.slice(1..).each do |word|
    comp = character_counts(base.keys, word)
    base.each_pair do |base_key, base_value|
      next if base_value < comp[base_key]
      base[base_key] -= base_value - comp[base_key]
    end
    base.delete_if { |_, value| value < 1 }
  end

  base.to_a.each_with_object([]) { |pair, obj| pair[1].times { obj << pair[0] } }
end

def character_counts(unique_chars, target_string)
  unique_chars.map { |char| [char, target_string.count(char)] }.to_h
end

p common_chars(%w(bella label roller))
p common_chars(%w(cool lock cook))
p common_chars(%w(hello goodbye booya random))
p common_chars(%w(aabbaaaa ccddddd eeffee ggrrrrr yyyzzz))

# a = %w(hello belol billy).map(&:chars)
# puts a[0].intersection(a[1]).intersection(a[2])


# finished 2:15

# # began 11:34

# # input: an integer
# # output: integer, -1 if no valid number found

# # mental model: starting with the rightmost digits begin sorting and check if new integer is greater than original. repeat until new is greater than original. if none can be found then return -1. (could return -1 if number is already sorted)


# def next_bigger_num(int)
#   digits = int.digits
#   return -1 if digits.sort.reverse.join.to_i == int
  
#   i = 0 
#   loop do
#     digits[i], digits[i + 1] = digits[i + 1], digits[i] if digits[i] > digits[i+1]
#     if digits.reverse.join.to_i > int
#       return digits.reverse.join.to_i
#     else
#     i += 1 
#     break if i >= (digits.size-1)
#     end
#   end
# end


# p next_bigger_num(2017) == 2071
# p next_bigger_num(111) == -1 
# p next_bigger_num(513) == 531
# p next_bigger_num(9) == -1
# p next_bigger_num(531) == -1 
# p next_bigger_num(123456789) == 123456798

# # finished: 12:01



# # started 12:15
# # requirements: [] and all negative array return 0, otherwise find max sum. 

# # tips: all positive array max sum is sum of entire array

# # mental model: sum the array starting from index i (i.e. 0) to the end of the array. this will be the starting max_value to check against. then inside the outer loop that same sum value will act as a loop break by decrementing that value by each array element going right to left until the break value is equal to the index i of the original array. then move the starting index up by one and repeat. all thewhile check against the stored max value


# # steps: 
# # 1. set `max_val` to array sum
# # 2. LOOP over the array indexes left to right
# # 3.  set sub_arr to array[i..]
#   # a. set sub_array_sum to the sum of the sub_array
#   # 4. LOOP over the sub_array
#     # a. if sub_array_sum > max_val set max_val to sub_array_sum
#     # b. decrement sub_array_sum by the return value from sub_arr.pop
#     # c. break if sub_array_sum is equal to current array starting index (i.e. array[i]) 
#   # b. increment i by 1
#   # c. break if i is equal to array.size
# # 5. return max_val

# #STILL TO DO: FACTOR IN [] AND ALL NEGATIVE VALUES ARRAY



# # input: integer array
# # output: integer

# def max_sequence(array)
#   max_val = array.inject(&:+)
#   return 0 if (array.empty? || array.all? {|el| el < 0}) 
#   i = 0
#   loop do
#     sub_arr = array[i..]
#     sub_arr_sum = sub_arr.inject(&:+)
    
#     loop do
#       max_val = sub_arr_sum if sub_arr_sum > max_val
#       sub_arr_sum -= sub_arr.pop
#       break if sub_arr.empty?
#     end
#     i += 1
    
#     break if i == array.size
#   end
  
#   max_val
# end 


# puts "==== Problem: Max Val"
# # puts max_val([]) == 0
# puts max_sequence([-2, 1, -3, 4])
# puts max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
# puts max_sequence([11]) == 11
# puts max_sequence([-32]) == 0
# puts max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12

# # finished: 1:09

# begin 11:14

# input: string array
# output: string

# mental model: take the shortest word in the array and check it against the first few letters of the other words to see if it in and of itself is the longest common prefix. 
# return the string it is the longest prefix, if it is not the longest prefix then remove the final character from the word and check again until the string is empty and return the empty string. 

# tips: break the loop if longest prefix or is down to empty string, that way you can just return the base string regardless (even if its empty) 


# steps: 
# - sort the array by size of word 
# - set `prefix` to shortest word in the array (perhaps pop or unshift so that you arent comparing to itself in the original array)
# - LOOP (through the prefix var shortening on each iteration)
  # - LOOP (compare against the chars for all other words in the array up to the length of `prefix`, maybe use all?())
    # - END
  # - break if inner loop returned true OR if `prefix` is empty, otherwise remove the last character from             `prefix` and repeat.
  # - END
# return `prefix`



# def common_prefix(array)
#   array = array.sort_by {|word| word.size}
#   prefix = array.clone.shift
  
#   loop do
#     break if array.all? {|word| prefix == word.slice(0, prefix.size)} || prefix.empty?
#     prefix = prefix[0..-2]
#   end
#   prefix
# end

# p common_prefix(["flower", "flow", "flight"]) == "fl" 
# p common_prefix(["dog", "racecar", "car"]) == ""
# p common_prefix(["interspcecies", "interstellar", "interstate"]) == "inters"
# p common_prefix(["throne", "dungeon"]) == ""
# p common_prefix(["throne", "throne"]) == "throne"


# finished 11:42

# started: 11:48

# input: two strings
# output: boolean

# mental model: starting with the smallest possible substring (i.e two letters of shorter word) check if it exists in the larger word. if not, then increase starting index by one but keep length the same. if still haven't found after check all length(2) substrings, increase length by one and iterate over shorter word again increasing starting index by one each time. at any point if a match is found return true, otherwise return false. break the loop if current substring is equal to the shorter word and has been check against the longer word.

# tips: longest possible substring is the shorter word of the two
  # outer loop controls length of substr, inner loop finds substrings by iterating over `shorter`


# algorithm: 
# set `shorter` and `longer` to their respective words (i.e sort them)
# set `substr_size` = 2
# LOOP
  # set `substr` to first `substr_size` characters of `shorter`
  # set `starting_index` to 0
  # LOOP
    # return true if substr exists in `longer`
    # break if substr is equal to the final substr.size characters of `shorter`
    # increment starting_index by 1
    # END
  # break if substr == `shorter`
  # increment substr_size by 1
  # END
# false

# finished writing algorithm 12:05


def substring_test(word_1, word_2)
  return false if [word_1, word_2].any?(&:empty?)
  word_1, word_2 = [word_1, word_2].map(&:downcase)
  shorter, longer = [word_1, word_2].sort_by { |word| word.size }
  substr_size = 2
  substr = ''
  
  loop do
    starting_index = 0
    loop do
      substr = shorter.slice(starting_index, substr_size)
      # p substr
      return true if longer.match?(substr)
      break if substr == shorter.slice(-substr_size, substr_size)
      starting_index += 1
    end
    break if substr == shorter # potential culprit
    substr_size += 1 
  end
  # p substr
  false
end


p substring_test("Something", "Fun") == false
p substring_test('Something', 'Home') == true
p substring_test("Something", "Fun") == false
p substring_test('Something', '') == false
p substring_test('', 'Something') == false
p substring_test('BANANA', 'banana') == true
p substring_test("test", "lllt") == false
p substring_test("", "") == false
p substring_test("1234567", "541265") == true
p substring_test("supercalifragilisticexpialidocious", "SounfOfItIsAtrociou") == true



#finsihed (not fully tested) 12:22; fully tested at 12:30


