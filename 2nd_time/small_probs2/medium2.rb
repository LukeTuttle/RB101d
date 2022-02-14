def prob_sep(num)
  puts "=> EXERCISE # #{num} -------------"
end

require "pry-byebug"

prob_sep 1
# 1 'Longest Sentence'; time started: 3:30 
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


passage = "Four score and seven years ago our fathers brought forth
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
earth."

DELIMETERS = '.!?'

def print_longest_sentence(long_str)
  sentences = long_str.split(/[#{DELIMETERS}]/)
  longest = sentences.max_by { |sentence| sentence.split.size }
  longest = longest.strip
  puts "This sentence has #{longest.split.size} words"
  puts longest
  end

print_longest_sentence(passage)

# finished: 3:42

prob_sep 2
# 2 'Now I know My ABCs'; time started: 3:43 
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
# Algorithm: supplied arg = `word`
# - create a data structure which contains all blocks and can track if its been used (alt: delete block after its been used)
# - for each char in word check if it has a corresponding 'elligible' ie unused block. if all chars check out then return true
  # - if char matches then set the alpha blocks value to off/false, however to return true from the block the alphablock must have an on/true status
# - 
# - 
# - 
# - 
# - 
# - 

# Data structures:(stay abstract/ high level; avoid implementation detail; keeps from getting boxed in a particular approach)
# use an array to track the alpha blocks, the track item will be at index 2
# Code implementation:
#  (notes relevant to actual code; remember to code with intent--think about each line)

ALPHA_BLOCKS = %w(
  B:O   X:K   D:Q   C:P   N:A
  G:T   R:E   F:S   J:W   H:U
  V:I   L:Y   Z:M
)


def block_word?(word)
  block_tracker = ALPHA_BLOCKS.map do |block|
    block = block.split ':'
    block << true
  end
  
  word.chars.all? do |char|
    block_tracker.any? do |block|
      next if block[2] == false || !(block[0..1].include?(char.upcase))
      block[2] = false
      true
    end
  end
end

puts block_word?('BATCH') == true
puts block_word?('BUTCH') == false
puts block_word?('jest') == true

# finished: 4:17

prob_sep 2
# 2 'Lettercase Percentage Ratio'; time started: 4:22 
# Understand the problem
#   Explicit requirements:
#   - Input: string
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
# - initialize a hash with three keys lowercase uppercase and neither (all as symbols)
# - count the number of strings 
# - to get the neither just subtract the sum of the other two categories from the original string length
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

def letter_percentages(str)
  counts = { lowercase: 0, uppercase: 0, neither: 0}
  counts[:lowercase] = str.count 'a-z'
  counts[:uppercase] = str.count 'A-Z'
  counts[:neither] = str.size - (counts[:lowercase] + counts[:uppercase])

  counts.each_pair { |key, value| counts[key] = ((value / str.size.to_f) * 100).round 1 }
  counts
end

puts letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
puts letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
puts letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
puts letter_percentages('abcdefGHI')
# finished: 4:37

prob_sep 3
# 3 'Matching Parentheses'; time started: 1:10 
# Understand the problem
#   Explicit requirements:
#   - Input:string
#   - Output:
#   - Additional considerations (about the problem, not the solution):
#   - 
#   - 
#   Implicit requirements:
# - 
# Mental model: check that there is a matching closing bracket for every opening bracket. 
#   there should also at any time be more closing brackets than opening brackets
#
#
# Algorithm:
# - SET `brackets_only`: remove any non bracket characters from the string
# - SET `openings` and `closings` to 0
# - LOOP
# - for each bracket character check if it is an opening or closing bracket and increment the apropriate counter
# - check if closing brackets is greater than opening brackets, if so return false
# - return true if brackets_only.size == openings + closings
# - 
# - 
# - 
# - 

# Data structures:(stay abstract/ high level; avoid implementation detail; keeps from getting boxed in a particular approach)
# Code implementation:
#  (notes relevant to actual code; remember to code with intent--think about each line)
# 

def balanced?(string)
  brackets_only = string.gsub(/[^()]/, '')
  return true if brackets_only == ''

  counter = { '(' => 0, ')' => 0, 'total' => 0 }
  brackets_only.each_char do |char|
    counter[char] += 1
    return false if counter[')'] > counter['(']
  end
  counter['('] == counter[')']
end

puts balanced?('Hey!') == true
puts balanced?('What (is) this?') == true
puts balanced?('What is) this?') == false
puts balanced?('What (is this?') == false
puts balanced?('((What) (is this))?') == true
puts balanced?('((What)) (is this))?') == false
puts balanced?(')Hey!(') == false
puts balanced?('What ((is))) up(') == false

# finished: 2:09

prob_sep 4
# 4 'Triangle'; time started: 2:09 
# Understand the problem

def triangle(s1, s2, s3)
  all_sides = [s1, s2, s3].sort.reverse
  return :invalid if all_sides.any?(&:zero?) || all_sides[0] > all_sides[1] + all_sides[2]
  return :equilateral if all_sides[0] == all_sides[2]
  return :isosceles if all_sides[0] == all_sides[1] || all_sides[1] == all_sides[2]
  :scalene
end

puts triangle(3, 3, 3) == :equilateral
puts triangle(3, 3, 1.5) == :isosceles
puts triangle(3, 4, 5) == :scalene
puts triangle(0, 3, 3) == :invalid
puts triangle(3, 1, 1) == :invalid

# finished: 2:49

prob_sep 5
# 5 'Tri-Angles'; time started: 2:54 
# Understand the problem
#   Explicit requirements:
#       all angles must add to exactly 180 AND none can == 0. 
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
# - if sum != 180 OR any == 0 ; invalid
# - if any angle >= 90
  # - if any = 45 then right else obtuse
# - else acute
# - 
# - 
# - 
# - 
# - 

# Data structures:(stay abstract/ high level; avoid implementation detail; keeps from getting boxed in a particular approach)
# Code implementation:
#  (notes relevant to actual code; remember to code with intent--think about each line)


def triangle(a1, a2, a3)
  angles = [a1, a2, a3]
  if angles.inject(&:+) != 180 || angles.include?(0)
    :invalid
  elsif angles.include?(90)
    :right
  elsif angles.all? { |angle| angle < 90 }
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

prob_sep 6
# 6 'FRiday 13th'; time started: 12:17 
# Understand the problem
#   Explicit requirements:
#   - Input:
#   - Output:
#   - Additional considerations (about the problem, not the solution):
#   - 
#   - 
#   Implicit requirements:
# - 
# Mental model: find the first ordinal day of the year which is a friday and set this as the initial start value. 
#   check if that day is the 13 day in the month and if it is increment a count of friday 13th's by 1.
    # Next, increment the initial start value by seven and repeat the check. break the loop if the ordinal day counter 
    # is equal to or greater than 365.
#
#
# Algorithm:
# - SET `unlucky_days` to 0
# - SET `ord_date` to the ordinal date of the first friday to occur in the year (can iterate over the first 0-6 calendar days)
# - LOOP
  # - IF ord_date has a civil date (i.e. monthly) of 13
    # - increment unlucky_days by 1
# - increment ord_date by 7
# - break if ord_date >= 365
# - return unlucky_days
# - 

# Data structures:(stay abstract/ high level; avoid implementation detail; keeps from getting boxed in a particular approach)
# Code implementation:
#  (notes relevant to actual code; remember to code with intent--think about each line)
# 
require 'date'
def friday_13th(year)
  unlucky_days = 0
  thirteenth = Date.civil(year, 1, 13)

  12.times do
    unlucky_days += 1 if thirteenth.friday?
    thirteenth = thirteenth.next_month
  end
  unlucky_days
end

puts friday_13th(2015) == 3
puts friday_13th(1986) == 1
puts friday_13th(2019) == 2

# finished 1:10

prob_sep 7
# 7 'Next Feature Number Higher than a Given Value'; time started: 1:34 
# Understand the problem
#   Explicit requirements: must be: odd, multiple of 7, unique digits, greater than supplied argument
#   - Input:
#   - Output:
#   - Additional considerations (about the problem, not the solution):
#   - 
#   - 
#   Implicit requirements:
# - 
# Mental model: find the first odd multiple of 7 greater than int argument. subroutine: first_seven
#   then iteratively check if its digits occur only once. if so return that number, otherwise increment the number by 14 and check again.
#   if the integer grows such that it >= 9,876,543,210 then break the loop and return an error message
#
#side note: if you subtract the integer % 7 from the integer and the result is even then add the modulo result to integer to get the starting value.
              # otherwise, add the modulo result + 7 to get the starting value
# first_seven: if the first multiple of seven grater than int is even, then increment it by seven to get the starting value, otherwise this is already the starting value
# Algorithm:
# - SET prev_multiple to result of subtracting int % 7 from int.
# - SET cur_mult to prev_multiple + 7 if prev_multiple is even, otherwise add 14 to prev_multiple
# - WHILE cur_mult < 9,876,543,210 (this is probs less bc its not an odd multiple of 7)
  # - check if cur_mult has unique digits
    # - return cur_mult if it does, otherwise increment cur_mult by 14
# - end
# - output an error message
# - 
# - 
# - 

# Data structures:(stay abstract/ high level; avoid implementation detail; keeps from getting boxed in a particular approach)
# Code implementation:
#  (notes relevant to actual code; remember to code with intent--think about each line)
#


def featured(int)
  prev_multiple = int - (int % 7)
  cur_mult = prev_multiple.even? ? (prev_multiple + 7) : (prev_multiple + 14)

  while cur_mult < 9876543210
    return cur_mult if cur_mult.digits == cur_mult.digits.uniq
    cur_mult += 14
  end
  puts 'There is no possible number that fulfills those requirements'
end

puts featured(12) == 21
puts featured(20) == 21
puts featured(21) == 35
puts featured(997) == 1029
puts featured(1029) == 1043
# puts featured(999_999) == 1_023_547
# puts featured(999_999_987) == 1_023_456_987

# featured(9_999_999_999) # -> There is no possible number that fulfills those requirements

# finished 2:11

prob_sep 8
# 8 'Bubble Sort'; time started: 2:18 
# Understand the problem
#   Explicit requirements: sort low to high using a b comparison
#   - Input:array
#   - Output:
#   - Additional considerations (about the problem, not the solution):
#   - 
#   - 
#   Implicit requirements:
# - 
# Mental model: compare a to b and swap them if a > b. continue doing this until no swaps occur for a given pass. 
# i could use a tracker which starts as false in each pass but is set to true if a swap occurs- if this is still false at 
# end of a given pass then it breaks the (outer?) loop. 
# - in order to iterate through the indexes just use map within an outer loop OR increment a counter by 1 and set to zero if 
# if is equal to arr.size. then check if the swap_occured? flag is triggered and break the loop if its still false

# outer loop controls whether to make another pass or not
# inner takes care of comparing a to b and making a swap if necessary and then iterating the index in order to compare the next two items
# Algorithm:
# - LOOP
  # - SET `swap occured` to false
  # - LOOP (use an iterator like upto perhaps)
    # - check each item (i.e i) of the array against the next item (i.e. i + 1) 
    # - if i > i + 1 then swap these elements and set swap_occured to true
# - Return ARR if swap_occured is false
# - 
# - 
# - 

# Data structures:(stay abstract/ high level; avoid implementation detail; keeps from getting boxed in a particular approach)
# Code implementation:
#  (notes relevant to actual code; remember to code with intent--think about each line)

def bubble_sort!(arr)
  loop do
    swap_occured = false
    0.upto(arr.size - 2) do |i|
      if arr[i] > arr[i + 1]
        arr[i], arr[i + 1] = arr[i + 1], arr[i] 
        swap_occured = true
      end
    end
    break unless swap_occured
  end
  arr
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
# finished: 2:59

prob_sep 9
# 9 'Sum Square -Square Sum'; time started: 11:22 
# Understand the problem
#   Explicit requirements:
#   - Input:
#   - Output:
#   - Additional considerations (about the problem, not the solution):
#   - 
#   - 
#   Implicit requirements:
# - 
# Mental model: for each integer between 1 and `int` increment a counter value `sum_first_counter`, then square the final result.
# for each integer between 1 and `int` square the integer and increment a counter value `square_first_counter` by the result.
# subtract the square_first_counter from sum_first_counter
# Algorithm:
# - sum first
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

def sum_square_difference(int)
  sum_first_counter = 0
  square_first_counter = 0

  1.upto(int) do |integer|
    sum_first_counter += integer
    square_first_counter += integer**2
  end
  sum_first_counter**2 - square_first_counter
end

puts sum_square_difference(3) == 22
puts sum_square_difference(10) == 2640
puts sum_square_difference(1) == 0
puts sum_square_difference(100) == 25164150

# finished: 11:33