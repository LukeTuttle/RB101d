require 'pry-byebug'

def prob_sep(num)
  puts "=> EXERCISE # #{num} -------------"
end


prob_sep 1
# 1 ''
# Understand the problem
#   Explicit requirements:
#   - Input: a string (txt file)
#   - Output: the longest sentence in the string
#   - Additional considerations (about the problem, not the solution):
#   - any sequence of characters that are not spaces or sentence-ending characters 
#     should be treated as a word (. ! ?)
#   - 
#   Implicit requirements:
#   Questions:

# Examples and test cases:
#  

# Data structures:(stay abstract/ high level; avoid implementation detail; keeps from getting boxed in a particular approach)
# - 
# Algorithm:
# - split string into sub arrays which each contain a sentence
# - initialize `longest` to empty string
# - initialize `max_length` to 0
# - iterate through the sub arrays checking their length against `max_length`
# - if the current sub array is longer (more words) than `max_length` 
#    - store the new longer length in `max_length` and the sentence in `longest` 
# - output the longest sentence and its length
# - 
# - 

# Code implementation:
#  (notes relevant to actual code; remember to code with intent--think about each line)
# 


def longest_sentence(str)
  sentences = str.split(/\.|\?|! /)
  longest = ''
  max_length = 0
  sentences.each do |sent|
    n_words = sent.split.size
    if n_words > max_length
      max_length = n_words
      longest = sent
    end
  end
  puts longest
  puts "Length: #{max_length}"
end

text = %(
  Four score and seven years ago our fathers brought forth
on this continent a new nation, conceived in liberty, and
dedicated to the proposition that all men are created
equal.

Now we are engaged in a great civil war, testing whether
that nation, or any nation so conceived and so dedicated,
can long endure. We are met on a great battlefield of that
war. We have come to dedicate a portion of that field, as
a final resting place for those who here gave their lives
that that nation might live. It is altogether fitting and
proper that we should do this.

But, in a larger sense, we can not dedicate, we can not
consecrate, we can not hallow this ground. The brave
men, living and dead, who struggled here, have
consecrated it, far above our poor power to add or
detract. The world will little note, nor long remember
what we say here, but it can never forget what they
did here. It is for us the living, rather, to be dedicated
here to the unfinished work which they who fought
here have thus far so nobly advanced. It is rather for
us to be here dedicated to the great task remaining
before us -- that from these honored dead we take
increased devotion to that cause for which they gave
the last full measure of devotion -- that we here highly
resolve that these dead shall not have died in vain
-- that this nation, under God, shall have a new birth
of freedom -- and that government of the people, by
the people, for the people, shall not perish from the
earth.
)

# longest_sentence text

# text = File.read('pg84.txt')

# longest_sentence text


prob_sep 2
# 2 'Now Iknow My ABCs'
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
# - a hash whose keys are an array of the pair characters and whose value is true (until switch)
# Algorithm:
# - initialize a data structure containing the pairs of characters
# - upcase the passed in string
# - split the string into characters
# - compare each character in the string against those in character pairs
# - if you find a match then flip a switch for that pair if the switch isnt already used
# - if you find a match for which the pair already has their switch flipped then return false
# - last line should be true (assumes no condition to return false earlier occured)
# - 
# - 

# Code implementation:
#  (notes relevant to actual code; remember to code with intent--think about each line)
# 

# letters = %w(B:O   X:K   D:Q   C:P   N:A
# G:T   R:E   F:S   J:W   H:U
# V:I   L:Y   Z:M).map { |pair| pair.split(':') }

# blocks = letters.zip(Array.new(13, true)).to_h
# puts BLOCKS.inspect

def block_word?(str)
  letters = %w(B:O   X:K   D:Q   C:P   N:A
    G:T   R:E   F:S   J:W   H:U
    V:I   L:Y   Z:M).map { |pair| pair.split(':') }
  blocks = letters.zip(Array.new(13, true)).to_h

  str.upcase.chars.each do |char|
    blocks.each_pair do |key, val|
      if val == true && key.include?(char)
        blocks[key] = false
      elsif val == false && key.include?(char)
        return false
      end
    end
  end
  true
end

# LS Solution:
# BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze

# def block_word?(string)
#   up_string = string.upcase
#   BLOCKS.none? { |block| up_string.count(block) >= 2 }
# end


puts block_word?('BATCH') == true
puts block_word?('BUTCH') == false
puts block_word?('jest') == true

prob_sep 3
# 3 'Lettercase Percentage Ratio'
# Understand the problem
#   Explicit requirements:
#   - Input:
#   - Output:
#   - Additional considerations (about the problem, not the solution):


def letter_percentages(str)
  uppers = ('A'..'Z').to_a.join
  lowers = ('a'..'z').to_a.join

  counts = {
    lowercase: str.count(lowers),
    uppercase: str.count(uppers)
  }
  counts[:neither] = str.size - (counts[:lowercase] + counts[:uppercase])

  counts.each_pair do |key, count|
    counts[key] =  (count / str.size.to_f) * 100
  end

  counts
end

puts letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
puts letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
puts letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }

prob_sep 4
# 4 'Matching Parentheses?'
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


# def balanced?(str)
#   left = str.count(')')
#   right = str.count('(')

#   left == right

# end

def balanced?(str)
  # left = str.count(')')
  # right = str.count('(')
  counter = 0 
  str.chars.each do |char|
    return false if counter < 0
    if char == '('
      counter += 1
    elsif char == ')'
      counter -= 1
    end
  end 
  counter == 0
end




puts balanced?('What (is) this?') == true
puts balanced?('What is) this?') == false
puts balanced?('What (is this?') == false
puts balanced?('((What) (is this))?') == true
puts balanced?('((What)) (is this))?') == false
puts balanced?('Hey!') == true
puts balanced?(')Hey!(') == false
puts balanced?('What ((is))) up(') == false

prob_sep 5
# 5 'Triangle Sides'

def triangle(s1, s2, s3)
  sorted = [s1, s2, s3].sort
  if sorted.any? {|x| x == 0} || sorted[0] + sorted[1] < sorted[2]
    :invalid
  elsif s1 != s2 && s2 != s3
    :scalene
  elsif s1 * s2 * s3 == s1 ^ 3
    :equilateral
  else
    :isosceles
  end
end

puts triangle(3, 3, 3) == :equilateral
puts triangle(3, 3, 1.5) == :isosceles
puts triangle(3, 4, 5) == :scalene
puts triangle(0, 3, 3) == :invalid
puts triangle(3, 1, 1) == :invalid

prob_sep 6
# 6 'Tri-Angles'
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



def triangle(a1, a2, a3)
  angles = [a1, a2, a3].sort
  case
  when angles.reduce(:+) < 180, angles.any? { |x| x < 1 }
    :invalid
  when angles.any? { |x| x == 90}
    :right
  when angles.all? { |x| x < 90 }
    :acute
  else
    :obtuse
  end
end


puts triangle(60, 70, 50) == :acute
puts triangle(30, 90, 60) == :right
puts triangle(120, 50, 10) == :obtuse
puts triangle(0, 90, 90) == :invalid
puts triangle(50, 50, 50) == :invalid

prob_sep 7
# 7 'Unlucky Days'
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
# - for each date xx/13/xxxx in the year check if it is a friday 
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

require 'date'
def friday_13th(year)
  count = 0

  1.upto(12) do |month|
    date = Date.new(year, month, 13)
    count += 1 if date.friday?
  end
  count
end

puts friday_13th(2015) == 3
puts friday_13th(1986) == 1
puts friday_13th(2019) == 2


prob_sep 8
# 8 'Next Freatured Number Higher than a Given Value'
# Understand the problem
#   Explicit requirements: multiple of 7, is odd, and whose digits only occur once
#   - Input: integer
#   - Output: integer
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
# - if the number of digits is greater than 10 OR the current multiple above given
#    number is greater than 987_654_321 than no possible number fullfills requirements
# - initialize a `cur_multiple` to `num + 7` 
# - loop through multiples of 7 checking if they are odd and if there are any dupes in its digits (dupes could be sub method)
# - 
# - subroutine:
# - for each digit in an array of digits, check if it is equal to  the other digits in the array at indexes greater than its own
# - 
# - 
# - 

# Code implementation:
#  (notes relevant to actual code; remember to code with intent--think about each line)
# 

# def no_dupes?(int)
#   digs = int.digits
#   length = digs.size
#   binding.pry if int == 1029
#   digs[0..-2].each_with_index do |digit, index|
#     (index + 1).upto(length-1) do |comparison_i|
#       return false if digit == digs[comparison_i]
#     end
#   end
#   true
# end

# def featured(num)
#   max = 9_876_543_210
#   not_possible = "There is no possible number that fulfills those requirements"

#   cur_multiple = (num / 7) * 7 + 7
#   loop do
#     return not_possible if cur_multiple > max
#     if cur_multiple.odd? && no_dupes?(cur_multiple) 
#       return cur_multiple
#     else
#       cur_multiple += 7
#     end
#   end
# end

# after seeing LS solution I modified my original solution

def no_dupes?(int)
  str_arr = int.to_s.chars
  str_arr == str_arr.uniq
end

def featured(num)
  max = 9_876_543_210
  not_possible = "There is no possible number that fulfills those requirements"
  num += 1
  num += 1 until num.odd? && num % 7 == 0

  loop do
    return not_possible if num > max
    if no_dupes?(num)
      return num
    else
      num += 14
    end
  end
end


puts featured(12) == 21
puts featured(20) == 21
puts featured(21) == 35
puts featured(997) == 1029
puts featured(1029) == 1043
puts featured(999_999) == 1_023_547
# puts featured(999_999_987) == 1_023_456_987

# puts featured(9_999_999_999) # -> There is no possible number that fulfills those requirements

prob_sep 9
# 9 'Bubble Sort'

def bubble_sort!(arr)
  loop do
    swapped = false
    1.upto(arr.size - 1) do |index|
      next if arr[index - 1] <= arr[index]
      arr[index - 1], arr[index] = arr[index], arr[index - 1]
      swapped = true
      end
    break unless swapped
  end
  nil
end

array = [5, 3]
bubble_sort!(array)
puts array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
puts array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
puts array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

prob_sep 10
# 10 'Sum Square - Square Sum'
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


def sum_square_difference(int)
  # binding.pry
  square_of_sums = ((int * (int + 1)) / 2)**2

  sum_of_squares = 0 
  1.upto(int) do |num|
    sum_of_squares += num**2
  end

  square_of_sums - sum_of_squares
  
end

puts sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
puts sum_square_difference(10) == 2640
puts sum_square_difference(1) == 0
puts sum_square_difference(100) == 25164150