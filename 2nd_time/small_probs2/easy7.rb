def prob_sep(num)
  puts "=> EXERCISE # #{num} -------------"
end

require "pry-byebug"


prob_sep 1
# 1 'Combine Two Lists'; time started: 11:56 
# Understand the problem
#   Explicit requirements:
#   - Input:
#   - Output:
#   - Additional considerations (about the problem, not the solution):
# 
# - 
# - 
# - 
# - 


def interleave(arr1, arr2)
  out_arr = []
  0.upto(arr1.size-1) do |index|
    out_arr << arr1[index] << arr2[index]
  end
  out_arr  
end

puts interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
# finished 11:59

# Skipping problem 2 because its very simillar to a problem I just did and is less difficult


prob_sep 3
# 3 'Cpaitalize'; time started:  
# Understand the problem
#   Explicit requirements:
#   - Input:
#   - Output:
#   - Additional considerations (about the problem, not the solution):
#   - 
#   - 
#   Implicit requirements:
# - 
# Mental model:
#
#
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

# Data structures:(stay abstract/ high level; avoid implementation detail; keeps from getting boxed in a particular approach)
# Code implementation:
#  (notes relevant to actual code; remember to code with intent--think about each line)
# 