def prob_sep(num)
  puts "=> EXERCISE # #{num} -------------"
end


prob_sep 1
# 1 'Welcome Stranger'
# Understand the problem
#   Explicit requirements:
#   - Input: an array and a hash
#     - hash: contains element which when joined with a space create a full name
#     - array: contains keys :title and :occupation with corresponding values
#   - Output: return a greeting containing the persons full name, title, and occupation
#   - Additional considerations (about the problem, not the solution):
#     - no other information was given
#     - 
#   Implicit requirements:
#   Questions: how to handle non valid inputs such as empty strings, nil, or zero length objects

# Examples and test cases:
#  greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => Hello, John Q Doe! Nice to have a Master Plumber around.

# Data structures:(stay abstract/ high level; avoid implementation detail; keeps from getting boxed in a particular approach)
# - an array and a hash
# Algorithm:
# - join strings in string array and save to variable `name`
# - save occupation and title values from hash to correspondingly named variables 
# - interpolate name title and occupation into a string
# - 

# Code implementation:
#  (notes relevant to actual code; remember to code with intent--think about each line)


def greetings(name, creds)
  name = name.join(' ')
  title = creds[:title]
  occupation = creds[:occupation]

  "Hello, #{name}! Nice to have a #{title} #{occupation} around."
end

puts greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })

prob_sep 2
=begin
# 2 'Double Doubles'
# Understand the problem
#   Explicit requirements:
#   - Input: an integer
#   - Output: an integer
#   - Additional considerations (about the problem, not the solution):
#   - returns 2x the number provided unless its a dbl number (return as is if dbl number)
#   - 
#   Implicit requirements: none
#   Questions: what to do with leading zeros?; negative integers? floats? what to do with single digit integers? 

# Examples and test cases:
#  twice(37) == 74
twice(44) == 44
twice(334433) == 668866
twice(444) == 888
twice(107) == 214
twice(103103) == 103103
twice(3333) == 3333
twice(7676) == 7676
twice(123_456_789_123_456_789) == 123_456_789_123_456_789
twice(5) == 10

# Data structures:(stay abstract/ high level; avoid implementation detail; keeps from getting boxed in a particular approach)
# - an array of digits or digit strings.

# Algorithm:
# - identify if arg is a dbl number
  # - turn integer into a string  
  # - turn string val into an array of its chars
  # - split array in half and rejoin elements into into a single object
  # - compare two halves for equivalency
 
# - if dbl number return as is 
# - otherwise, multiply by 2 and return as integer
# - 
# - 
# - 
# Code implementation:
#  (notes relevant to actual code; remember to code with intent--think about each line)
# 
=end

def twice(integer)
  int = integer.to_s
  array_of_ints1 = int.chars
  ar_length = array_of_ints1.size
  array_of_ints2 = array_of_ints1.slice!(ar_length/2, ar_length/2)
  if array_of_ints1.join != array_of_ints2.join || ar_length == 1
    integer * 2
  else
    integer
  end
end

puts twice(37) == 74
puts twice(44) == 44
puts twice(334433) == 668866
puts twice(444) == 888
puts twice(107) == 214
puts twice(103103) == 103103
puts twice(3333) == 3333
puts twice(7676) == 7676
puts twice(123_456_789_123_456_789) == 123_456_789_123_456_789
puts twice(5) == 10


prob_sep 3
# 3 'Always Return Negative'
# Understand the problem
#   Explicit requirements: write a method which return the negative of its argument (an integer). if arg is 0 or negative return arg
#   - Input:
#   - Output:
#   - Additional considerations (about the problem, not the solution):


def negative(int)
  int <= 0 ? int : -int
end

puts negative(5) == -5
puts negative(-3) == -3
puts negative(0) == 0      # There's no such thing as -0 in ruby


prob_sep 4
# 4 'Counting Up'
# Understand the problem
#   Explicit requirements: write a method which takes an integer and returns 
#     an array of all integers between 1 and the arg in sequence
#   - Input: integer
#   - Output: array
#   - Additional considerations (about the problem, not the solution):
#   - 
#   - 
#   Implicit requirements:
#   Questions: how to handle negative arguments? what is the correct sort order? 

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

# both definitions work
def sequence(int)
  arr = []
  counter = 1
  until counter == int + 1
    arr << counter
    counter += 1
  end
  arr
end

def sequence(int)
 (1..int).to_a
end




puts sequence(5) == [1, 2, 3, 4, 5]
puts sequence(3) == [1, 2, 3]
puts sequence(1) == [1]



prob_sep 5
# 5 'Uppercase Check'
# Understand the problem
#   Explicit requirements: write a method that takes a string arument,
#    and returns treu if all of the alphabetic characters inside the strin are uppercase, fasle otherwise
#   - Input: string
#   - Output: boolean value
#   - Additional considerations (about the problem, not the solution):
#   - ignore non alphabetic characters 
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


def uppercase?(str)
  caps = ('A'..'Z').to_a
  str.chars.all? do |char|
    return true unless caps.include?(char.upcase)
    ('A'..'Z').to_a.include?(char)
  end
end

def uppercase?(str)
  str == str.upcase
end


puts uppercase?('t') == false
puts uppercase?('T') == true
puts uppercase?('Four Score') == false
puts uppercase?('FOUR SCORE') == true
puts uppercase?('4SCORE!') == true
puts uppercase?('') == true

prob_sep 6
# 6 'How long are you?'
# Understand the problem
#   Explicit requirements: take a string and return an array of strings whre each element is 
#     a word from the string with a space and the number of chars appended to the end
#   - Input:
#   - Output:
#   - Additional considerations (about the problem, not the solution):
#   - you can assume that words are always sep'd be one space and that any non-space substring is a word
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

def word_lengths(str)
  str = str.split
  str.map do |word|
   "#{word} #{word.length}"
  end
  
end


puts word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

puts word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

puts word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

puts word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

puts word_lengths("") == []


prob_sep 7
# 7 'name Swapping'
# Understand the problem
#   Explicit requirements: write a method which takes a first and last name (a string) and returns 'last_name, first_name') 


def swap_name(str)
  str = str.split
  "#{str[1]}, #{str[0]}"
end

def swap_name(str)
  str.split.reverse.join(', ')
end

puts swap_name('Joe Roberts') == 'Roberts, Joe'


prob_sep 8
# 8 'Sequence Count'
# Understand the problem
#   Explicit requirements: write a 2 arg method which returns an array 
#     containing arg1 elements (integers) which are ordered multiples of arg2. sequence starts with arg2, if arg2 is 0 return empty array
#   - Input: 2 integers
#   - Output: an array of arg1 length
#   - Additional considerations (about the problem, not the solution):


def sequence(len, start)
  arr_out = []
  return arr_out if len == 0
  1.upto(len) do |mult|
    arr_out << mult * start
  end
  arr_out
end



puts sequence(5, 1) == [1, 2, 3, 4, 5]
puts sequence(4, -7) == [-7, -14, -21, -28]
puts sequence(3, 0) == [0, 0, 0]
puts sequence(0, 1000000) == []

prob_sep 9
# 9 'Grade Book'
# Understand the problem
#   Explicit requirements: write a method that determines the mean (average) of 
#     the three scores passed to it, and returns the letter value associated with that grade
#   - Input: 3 integers
#   - Output: string

def get_grade(s1, s2, s3)
  score = (s1 + s2 + s3) / 3.0
  case 
  when score >= 90 then 'A'
  when score >= 80 then 'B'
  when score >= 70 then 'C'
  when score >= 60 then 'D'
  else 'Error'
  end
end


puts get_grade(95, 90, 93) == "A"
puts get_grade(50, 50, 95) == "D"

prob_sep 10
# 10 'Grocery List'
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


def buy_fruit(arr)
  arr.map do |sub|
    Array.new(sub[1], sub[0])
  end.flatten
end

puts buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]


prob_sep 11
# 11 'Group Anagrams'
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
# Mental model: 
#   for each word, check if there are other words which share all the same characters.
#   If such a word is found then add that word to an out array, then add the starting word to the array as well.
#   skip any word that is already in the out array. 
#   each group of anagrams should be in their own array as the method PRINTS rather than RETURNS
# Algorithm:
# - iterate through the array of `words` 
# -   split each word into its chars the comparison chars array for the other words in the array
# -     note* only need to compare against words which havent been the current target word yet
# - 
# - 
# - 
# - 
# - 
# - 

# Code implementation:
#  (notes relevant to actual code; remember to code with intent--think about each line)
# 

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
  'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
  'flow', 'neon']

def anagrams(words)
  words.each_with_index do |word, i|
    out_array = []
    words[i+1...].each do |comparison|
      if word.chars.difference(comparison.chars) == []
        out_array << comparison
      end
    end
    unless out_array.empty?
      out_array << word
      p out_array
    end
  end
end

anagrams(words)
