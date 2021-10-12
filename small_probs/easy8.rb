def prob_sep(num)
  puts "=> EXERCISE # #{num} -------------"
end

prob_sep 1
# 1 'Sum of Sums'
# Understand the problem
#   Explicit requirements:
#   - Input: array of numbers
#   - Output: an integer value which is the sum of sums of each leading subsequence for the array
#   - Additional considerations (about the problem, not the solution):
#   - can assume array always contains at least one number
#   - 
#   Implicit requirements:
#   Questions:

# Examples and test cases:
#  sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
#  sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
#  sum_of_sums([4]) == 4
#  sum_of_sums([1, 2, 3, 4, 5]) == 35

# Data structures:(stay abstract/ high level; avoid implementation detail; keeps from getting boxed in a particular approach)
# - 
# Algorithm:
# - initialize out_val to ary[0]
# - increment the out_val by the result of reducing the a
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


def sum_of_sums(ary)
  out_val = 0
  ary.size.times do |i|
   out_val += ary.slice(0, i+1).reduce(:+)
  end
  out_val
end


puts sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
puts sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
puts sum_of_sums([4]) == 4
puts sum_of_sums([1, 2, 3, 4, 5]) == 35

prob_sep 2
# 2 'Madlibs'
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
if false # this is just so this doesn't run everytime I run this file
  def get_input(str)
    puts str
    gets.chomp
  end

  noun = get_input("Enter a noun:")
  verb = get_input("Enter a verb:")
  adj = get_input("Enter an adjective:")
  adv = get_input("Enter an adverb:")

  puts "Do you #{verb} your #{adj} #{noun} #{adv}? Because if so, that's crazy."
end 

prob_sep 3
# 3 'Leading Substrings'
# Understand the problem
#   Explicit requirements:
#   - Input: a string
#   - Output: array of substrings
#   - Additional considerations (about the problem, not the solution):
#   - write a method that returns a list of all substrings of a strin that starts
#     at the beginning of the original string. The return value should be arrngd short to long
#   Implicit requirements:
#   Questions:

# Examples and test cases:
# leading_substrings('abc') == ['a', 'ab', 'abc']
# leading_substrings('a') == ['a']
# leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']  

# Data structures:(stay abstract/ high level; avoid implementation detail; keeps from getting boxed in a particular approach)
# - 
# Algorithm:
# - initialize out_ary to empty array
# - iteratively append strings of increasing length to out array 
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

def leading_substrings(str)
  out_ary = []
  1.upto(str.size) do |i|
    out_ary << str.slice(0, i)
  end
  out_ary
end

puts leading_substrings('abc') == ['a', 'ab', 'abc']
puts leading_substrings('a') == ['a']
puts leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

prob_sep 4
# 4 'All Substrings'
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


def substrings(str)
  out_ary = []
  index = 0
  while index < str.size
    out_ary << leading_substrings(str[index...])
    index += 1
  end
  out_ary.flatten
end

puts substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]

prob_sep 5
# 5 'Palindromic Substrings'
# Understand the problem
#   Explicit requirements:
#   - Input: a string
#   - Output: array of substrings
#   - Additional considerations (about the problem, not the solution):
#   - write a method that returns all palindromic substrings of string arg
#   - results should be arranged according to the sequence in which the substrins appear
#   - dupblice palindromes should be included multiple times
#   - method should be case sensitive
#   - assume single characters are not palindromes
#   Implicit requirements:
#   Questions:

# Examples and test cases:
#   palindromes('abcd') == []
#   palindromes('madam') == ['madam', 'ada']
#   palindromes('hello-madam-did-madam-goodbye') == [
#     'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
#     'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
#     '-madam-', 'madam', 'ada', 'oo'
#   ]
#   palindromes('knitting cassettes') == [
#     'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
#   ]

# Data structures:(stay abstract/ high level; avoid implementation detail; keeps from getting boxed in a particular approach)
# - 
# Algorithm:
# - initialize out_ary to empty array
# - get a list of all the substrings 
# - remove any substrings which are 1 char in length
# - iteratively check each substring against itself reversed--if true then append to out_ary
# - 
# - 
# - 
# - 
# - 

# Code implementation:
#  (notes relevant to actual code; remember to code with intent--think about each line)
# 

def palindromes(str)
  out_ary = []
  substr_ary = substrings(str)

  substr_ary.each do |sub|
    next if sub.size <= 1
    out_ary << sub if sub == sub.reverse
  end
  out_ary
end

puts palindromes('abcd') == []
puts palindromes('madam') == ['madam', 'ada']
puts palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
puts palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

prob_sep 6
# 6 'fizzbuzz'
# Understand the problem
#   Explicit requirements:
#   - Input: 2 integers; one for starting number, other for ending number
#   - Output: print out all integers between two arguments unless div by 3 print 'Fizz'
#             if div by 5 print 'Buzz' if div by both 3 & 5 print 'FizzBuzz
#   - Additional considerations (about the problem, not the solution):
#   - 
#   - 
#   Implicit requirements:
#   Questions:

# Examples and test cases:
#  fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz

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

def fizzbuzz(n1, n2)
  result = []
  n1.upto(n2) do |n|
    case
    when n % 3 == 0 && n % 5 == 0 then result << "FizzBuzz"
    when n % 3 == 0 then result << "Fizz"
    when n % 5 == 0 then result << "Buzz"
    else result << n
    end
  end
  puts result.join(', ')
end

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz

prob_sep 7
# 7 'Double Char (Part 1)'
# Understand the problem
#   Explicit requirements:
#   - Input: a string
#   - Output: new string in which every character is doubled
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


def repeater(str)
  chars = str.chars
  result = ''
  chars.each do |char|
    2.times {|_| result << char }
  end
  result
end

def repeater(str)
  result = ''
  str.each_char do |char|
    result << char << char
  end
  result
end

puts repeater('Hello')
puts repeater('Hello') == "HHeelllloo"
puts repeater("Good job!") == "GGoooodd  jjoobb!!"
puts repeater('') == ''

prob_sep 8
# 8 'Double Char (Part 2)'
# Understand the problem
#   Explicit requirements:
#   - Input: a string
#   - Output: a new string in which every consonant charcter is doubled
#   - Additional considerations (about the problem, not the solution):
#   - vowels (aeiou), digits, punctuation, and whitespace should not be doubled.
#   - 
#   Implicit requirements:
#   Questions:

# Examples and test cases:
#  

# Data structures:(stay abstract/ high level; avoid implementation detail; keeps from getting boxed in a particular approach)
# - 
# Algorithm:
# - initialize result to empty array
# - for each char in string
#   - append char to result
#   - if char is a consonant then append again to result
# - end
# - return result
# - 
# - 

# Code implementation:
#  (notes relevant to actual code; remember to code with intent--think about each line)
# 

CONSONANTS = %w(b c d f g h j k l m n p q r s t v w x y z)

def double_consonants(str)
  result = ''
  str.each_char do |char|
    result << char
    result << char if CONSONANTS.include?(char.downcase)
  end
  result
end

puts double_consonants('String') == "SSttrrinngg"
puts double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
puts double_consonants("July 4th") == "JJullyy 4tthh"
puts double_consonants('') == ""

prob_sep 9
# 9 'Reverse the Digits In a Number'
# Understand the problem
#   Explicit requirements:
#   - Input: an integer
#   - Output: an integer with its digits reversed
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

def reversed_number(int)
  int.digits.join.to_i
end

puts reversed_number(12345) == 54321
puts reversed_number(12213) == 31221
puts reversed_number(456) == 654
puts reversed_number(12000) == 21 # No leading zeros in return value!
puts reversed_number(12003) == 30021
puts reversed_number(1) == 1

prob_sep 10
# 10 'Get The Middle Character'
# Understand the problem
#   Explicit requirements:
#   - Input: a non-emply string
#   - Output: the middle char(s) of the string
#   - Additional considerations (about the problem, not the solution):
#   - if str has even # of chars then return two chars, else return exactly 1 char
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

def center_of(str)
  even = str.size.even?
  start = str.size / 2
  if even
    str.slice(start -1, 2)
  else
    str.slice(start, 1)
  end
end

puts center_of('launch')
puts center_of('I love ruby') == 'e'
puts center_of('Launch School') == ' '
puts center_of('Launch') == 'un'
puts center_of('Launchschool') == 'hs'
puts center_of('x') == 'x'