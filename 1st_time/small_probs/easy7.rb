def prob_sep(num)
  puts "=> EXERCISE # #{num} -------------"
end


prob_sep 1
# 1 'Combine Two Lists'
# Understand the problem
#   Explicit requirements:
#   - Input: two arrays
#   - Output: new array containing all elements from ary args
#   - elements should be taken in alternation
#   - can assume neither array is empty and the have the same length
#   Implicit requirements:
#   - Additional considerations (about the problem, not the solution):
# Questions:
# Examples and test cases: 
#  - interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
# Data structures:
#  (listing out what you know about the way the data is structured can help you
#   think about the algorithm--even if you've already listed those things previously)
#   - the output array should be 2x the length of either input array since they're the same length
# Algorithm:
#  (stay abstract/ high level; avoid implementation detail;
#  these keep from getting boxed in a particular approach)
# 1. create an empty out_array
# 2. iterate through the first array assigning its elements only to the even indexes of the out array
# 3. iterate through the second array assiging its elements only to the odd indexes of the out array
# 4. the counter to track which index to use should start with 0 (evens) or 1 (odds) and add two each iteration
# 5. return the out_array
# Code implementation:
#  (notes relevant to actual code; remember to code with intent--think about each line)
#   - figuring out when to stop the counter would be the toughest part of this if I dont use an enumerator.

def interleave(ary1, ary2)
  out_ary = []
  counter = 0
  # out_index
  until counter >= ary1.size * 2 do 
    out_ary[counter] = ary1[counter / 2]
    counter += 2
  end

  counter = 1
  until counter >= ary2.size * 2 + 1 
    out_ary[counter] = ary2[counter / 2]
    counter += 2
  end
  out_ary
end
# LS Solution
# def interleave(array1, array2)
#   result = []
#   array1.each_with_index do |element, index|
#     result << element << array2[index]
#   end
#   result
# end


p interleave((1..5).to_a, ('a'..'e').to_a)
puts interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

prob_sep 2
# 2 'Lettercase Counter'
# Understand the problem
#   Explicit requirements:
#   - Input: string
#   - Output: a hash containing 3 entries
#   - 3 entries: # of lowercase chars; # of upppercase chars; # of chars which are neither (ie. not letters) 
#   Implicit requirements:
#   - Additional considerations (about the problem, not the solution):
#   - 
#   - 
# Questions: do spaces count as characters? what about return or escape characters? Empty srings?
#   - test case seeems to show spaces do count as characters. Empty string returns hash with all values == 0
# Examples and test cases: 
#  - letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
#  - letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
#  - letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
#  - letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
# Data structures:
#  (listing out what you know about the way the data is structured can help you
#   think about the algorithm--even if you've already listed those things previously)
#  - a hash with three entries; bc its small a loop isnt necessary.
#  - perhaps store values in an array before assigning keys to them
# Algorithm:
#  (stay abstract/ high level; avoid implementation detail;
#  these keep from getting boxed in a particular approach)
# 1. initialize out_hsh to hash with three keys and all vals set to 0
# 1.1 IF str.empty? return out_hsh
# 2. get uppercase chars# using str.delete!.size and set to upper_chars
# 3. get lowercase chars# using str.delete!.size and set to lower_chars
# 4. call size on str to get remaining # of chars
# 5. assign values to respective keys in out_chars
# Code implementation:
#  (notes relevant to actual code; remember to code with intent--think about each line)
# 

def letter_case_count(str)
  out_hsh = {lowercase: 0, uppercase: 0, neither:0}
  return out_hsh if str.empty?

  out_hsh[:uppercase] = str.count('A-Z')
  out_hsh[:lowercase] = str.count('a-z')
  out_hsh[:neither] = str.count('^[a-zA-z]')

  out_hsh
end

puts letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
puts letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
puts letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
puts letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

prob_sep 3
# 3 'Capitalize Words'
# Understand the problem
#   Explicit requirements:
#   - Input: a string
#   - Output: a new string with a words capitalized (not all uppercase)
#   Implicit requirements:
#   - Additional considerations (about the problem, not the solution):
#   - and non white space character can be considered the first char in a word
#   Questions:

# Examples and test cases: 
#  word_cap('four score and seven') == 'Four Score And Seven'
#  word_cap('the javaScript language') == 'The Javascript Language'
#  word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

# Data structures:
#  (listing out what you know about the way the data is structured can help you
#   think about the algorithm--even if you've already listed those things previously
#  - input a string. will need to split string into a words array.
#  - will need to join array back into a single string at end
# Algorithm:
#  (stay abstract/ high level; avoid implementation detail;
#  these keep from getting boxed in a particular approach) 
# 1. split string into words array
# 2. iterate through the words mutating the first character to upcase. (upcase returns self on non alpha chars)
# 3. join words back together into string

# Code implementation:
#  (notes relevant to actual code; remember to code with intent--think about each line)
#  

def word_cap(str)
  words = str.downcase.split
  words.each do |word|
    word[0] = word[0].upcase
  end
  words.join(' ')
end

puts word_cap('four score and seven') == 'Four Score And Seven'
puts word_cap('the javaScript language') == 'The Javascript Language'
puts word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

prob_sep 4
# 4 'Swap Case'
# Understand the problem
#   Explicit requirements:
#   - Input: a string
#   - Output: a new string in which the case (upper or lower) is switch for all letters
#   Implicit requirements:
#   - Additional considerations (about the problem, not the solution):
#   - all other chars should remain unchanged 
#   Questions:

# Examples and test cases: 
#  swapcase('CamelCase') == 'cAMELcASE'
#  swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
#
#  Data structures:
#  (listing out what you know about the way the data is structured can help you
#   think about the algorithm--even if you've already listed those things previously
#  - will probably need to convert string into array of chars. return val will need to join chars array into string
# Algorithm:
#  (stay abstract/ high level; avoid implementation detail;
#  these keep from getting boxed in a particular approach) 
#  - define two constants UPPERS LOWERS--arrays containing upercase and lower case chars
#  - split the string into individual chars to iteratve over
#  - FOR each char in chars array
#   - NEXT if char != alpha 
#   - check element against UPPERS
#     - IF true then call downcase
#     - ELSE call upcase
#     - END
#   - END
#  - join array into a single string
#  - END

# Code implementation:
#  (notes relevant to actual code; remember to code with intent--think about each line)
# 

def swapcase(str)
  uppers = ('A'..'Z').to_a
  chars = str.chars
  chars.each do |char|
    next unless char.count('[^A-Za-z]') != 0
    uppers.include?(char) ? char.downcase! : char.upcase!
  end
  chars.join
end

puts swapcase('CamelCase') == 'cAMELcASE'
puts swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

prob_sep 5
# 5 'Staggered Caps (Part 1)'
# Understand the problem
#   Explicit requirements:
#   - Input: a string
#   - Output: a new string with modified capitalization
#   - Every other character should be capitalized (1st char cap'd)
#   - all other chars should be lower case
#   - dont changeg non letter chars--they do count as characters when switching case though (see examples)
#   Implicit requirements:
#   Questions:
# Examples and test cases:
#  staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
#  staggered_case('ALL_CAPS') == 'AlL_CaPs'
#  staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

# Data structures:
#  (listing out what you know about the way the data is structured can help you
#   think about the algorithm--even if you've already listed those things previously
#  - ill mostly be working with a string array. it will need to be joined into a single string for return
#  - I may (but not necessarily) need a counter to keep track of indexes to be cap'd
# Algorithm:
#  (stay abstract/ high level; avoid implementation detail;
#  these keep from getting boxed in a particular approach) 
# - downcase and split the string into a chars array - name it chars
# - for each element in chars
#   - if index is call upcase!
#   - END
# - join chars array into single string
# END

# Code implementation:
#  (notes relevant to actual code; remember to code with intent--think about each line)

def staggered_case(str)
  chars = str.downcase.chars
  chars.each_with_index do |char, i|
    char.upcase! if i.even?
  end
  chars.join
end

puts staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
puts staggered_case('ALL_CAPS') == 'AlL_CaPs'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

prob_sep 6
# 6 'Staggered Caps (Part 2)'
# Understand the problem
#   Explicit requirements:
#   - Input: string
#   - Output: string 
#   - as with the previous problem, alternate capitalization, but dont count non alpha chars this time
#   Implicit requirements:
#   - Additional considerations (about the problem, not the solution):
#   Questions:
# Examples and test cases:
#  staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
#  staggered_case('ALL CAPS') == 'AlL cApS'
#  staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

# Data structures:
#  (listing out what you know about the way the data is structured can help you
#   think about the algorithm--even if you've already listed those things previously
# - ill be working with an array and will need a counter to keep track of whether to cap the char or not
# Algorithm:
#  (stay abstract/ high level; avoid implementation detail;
#  these keep from getting boxed in a particular approach) 
# - initialize `chars` to str.downcase.split
# - intialize cap? to true
# - for each element in char
#   - NEXT if char != a-z
#   - char.upcase! if cap?
#   - cap? = !cap?
#   - END
# - join chars array into a single string
# END

# Code implementation:
#  (notes relevant to actual code; remember to code with intent--think about each line)
# 


def staggered_case(str)
  chars = str.downcase.chars
  cap = true
  
  chars.each do |char|
    next unless char =~ /[a-z]/
    char.upcase! if cap
    cap = !cap
  end
  chars.join
end

puts staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
puts staggered_case('ALL CAPS') == 'AlL cApS'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'


prob_sep 7
# 7 'Multiplicative Average'
# Understand the problem
#   Explicit requirements:
#   - Input: array of integers
#   - Output: float
#   - multiply all numbers together, divide result by length of array,
#       then prints result rounded to 3 decimal places. 
#   Implicit requirements:
#   - Additional considerations (about the problem, not the solution):
#   Questions:
# Examples and test cases:
#  

# Data structures:
#  (listing out what you know about the way the data is structured can help you
#   think about the algorithm--even if you've already listed those things previously)
#   - working with an array which ends up in a float

# Algorithm:
#  (stay abstract/ high level; avoid implementation detail;
#  these keep from getting boxed in a particular approach) 
# - initialize `product` to 0
# - iterate through array elements storing the sum in `product`
# - divide product by length of array
# - round to 3 decimal places 
# - print rounded float
# - 

# Code implementation:
#  (notes relevant to actual code; remember to code with intent--think about each line)

def show_multiplicative_average(ary)
  product = ary.inject(:*)
  product = product.to_f / ary.size
  

  puts "The result is #{format('%.3f', product)}"
end

show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667

prob_sep 8
# 8 'Multiply Lists'
# Understand the problem
#   Explicit requirements:
#   - Input: two array arguments each of which contains a list of numbers
#   - Output: a new array which contains the pairwise products of the two method args
#   Implicit requirements:
#   - Additional considerations (about the problem, not the solution):
#   - can assume arg arrays are of same length
#   - 
#   Questions: waht is meant by 'numbers'...integers only? how to hand nil? 
# Examples and test cases:
#  multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

# Data structures:
#  (listing out what you know about the way the data is structured can help you
#   think about the algorithm--even if you've already listed those things previously

# Algorithm:
#  (stay abstract/ high level; avoid implementation detail;
#  these keep from getting boxed in a particular approach) 
# - initialize `out_ary` to empty array
# - for each element in one of the arrays
#   - multiply that element by the element with the same index in the other array 
#   - append the result to `out_ary` 
# - return out_ary
# END

# Code implementation:
#  (notes relevant to actual code; remember to code with intent--think about each line)


def multiply_lists(ary1, ary2)
  out_ary = []
  ary1.each_with_index do |x, i|
    out_ary << x * ary2[i]
  end
  out_ary
end

puts multiply_lists([3, 5, 7], [9, 10, 11]) == [27, 50, 77]


def multiply_lists(ary1, ary2)
  out_ary = []
   ary1.zip(ary2) { |x1, x2| out_ary << x1 * x2 }
  out_ary
end

p multiply_lists([3, 5, 7], [9, 10, 11]) 

prob_sep 9
# 9 'Multiply All Pairs'
# Understand the problem
#   Explicit requirements:
#   - Input: two arrays each containing a list of numbers
#   - Output: an new array containing the product of every pair of numbers that can be 
#       formed between the elemetns of the two arrays. result should be sorted by increasing value
#   Implicit requirements:
#   - Additional considerations (about the problem, not the solution):
#   Questions:
#   - are all numbers integers? how to handle duplicate values in result array? 
# Examples and test cases:
#  multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

# Data structures:
#  (listing out what you know about the way the data is structured can help you
#   think about the algorithm--even if you've already listed those things previously

# Algorithm:
#  (stay abstract/ high level; avoid implementation detail;
#  these keep from getting boxed in a particular approach) 
# - initialize an empty `out_ary` variable to an empty array
#  - initialize `outer_counter` to 0
# - While `outer_counter` < ary1.size
#   - initialize `inner_counter` to 0
#   - While `inner_counter` < ary2.size
#   - append result of ary1[outer_counter] * ary2[inner_counter] to out_ary 
#   - increment inner_counter by 1 
#   - END
# - increment outer_counter by 1
# - END
# - Sort out_ary in ascending order
#   - initialize an out_ary to an empty array
#   - initialize cur_index to 0
#   - while cur_index < ary.size - 1
#     - set cur_num to ary[cur_index]
#     - set compare_index to cur_index + 1
#     while compare_index < ary.size
#       if cur_num > ary[compare_index]
#         ary[cur_index], ary[compare_index] = ary[compare_index], ary[cur_index]
#         cur_num = ary[compare_index]
#         compare_index += 1
#         end
#       end
#   - cur_index += 1
# - END
# END


# sort method mental model:
# - for each element in the array, compare it to the later element
# Code implementation:
#  (notes relevant to actual code; remember to code with intent--think about each line)

def my_sort(ary)
  cur_index = 0
  while cur_index < ary.size - 1
    min = ary[cur_index]
    min_index = cur_index
    compare_index = cur_index + 1
    while compare_index < ary.size
      if min > ary[compare_index]
        min = ary[compare_index]
        min_index = compare_index
      end
      compare_index += 1
    end
    ary[cur_index], ary[min_index] = ary[min_index], ary[cur_index]
    cur_index += 1
  end
  ary
end

p my_sort([4,2,3,1])

def multiply_all_pairs(ary1, ary2)
  out_ary = []
  outer_counter = 0
  
  while outer_counter < ary1.size
    inner_counter = 0
    while inner_counter < ary2.size
      out_ary << ary1[outer_counter] * ary2[inner_counter]
      inner_counter += 1
    end
    outer_counter += 1
  end
  my_sort(out_ary)
end

puts multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

p multiply_all_pairs([2, 4], [4, 3, 1, 2])

prob_sep 10
# 10 'The End Is Near But Not Here'
# Understand the problem
#   Explicit requirements:
#   - Input:
#   - Output:
#   Implicit requirements:
#   - Additional considerations (about the problem, not the solution):
#   - 
#   - 
#   Questions:
# Examples and test cases:
#  

# Data structures:
#  (listing out what you know about the way the data is structured can help you
#   think about the algorithm--even if you've already listed those things previously

# Algorithm:
#  (stay abstract/ high level; avoid implementation detail;
#  these keep from getting boxed in a particular approach) 
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


def penultimate(str)
  str.split[-2]
end

puts penultimate('last word')
puts penultimate('last word') == 'last'
puts penultimate('Launch School is great!') == 'is'