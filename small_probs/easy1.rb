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
#     supplied with a array, create a new array and add each new unique element (yes case sensitive) as a sub array in which the 1 index
#     spot is used to keep track of the number of occurences. Then print each value along side its # of occurences. 
#   input/output: Array / Hash (reasoning for Hash output: the resulting object is searchable by key which will help keep track of counting)
#                 Hash keys should be strings if it must be all one class type
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

# %w(a b c d d d)
test_array = [1, :some_key, :some_key, 'a string', 'D', 'D', 'd', true, true, false, 1.56]
p "the test array is "
p test_array

count_occurences(test_array)

problem_sep(5)
# 