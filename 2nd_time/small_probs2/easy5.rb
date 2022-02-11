def prob_sep(num)
  puts "=> EXERCISE # #{num} -------------"
end

require "pry-byebug"

prob_sep 1
# 1 'ASCII String Value'; time started: 10:52 
# Understand the problem
#   Explicit requirements:
#   - Input:string
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


def ascii_value(string)
  return 0 if string.empty?
  string.chars.map(&:ord).reduce(:+)
end

puts ascii_value('Four score') == 984
puts ascii_value('Launch School') == 1251
puts ascii_value('a') == 97
puts ascii_value('') == 0

# finish: 11:04

prob_sep 2
# 2 'After Midnight (Part 1)'; time started: 11:05 
# Understand the problem
#   Explicit requirements:
#   - Input: integer (# of minutes before or after midnight (- = before ; + = after))
#   - Output: 24hr format string HH:MM
#   - Additional considerations (about the problem, not the solution):
#   - 
#   - 
#   Implicit requirements:
# - 
# Mental model:
#
#
# Algorithm: (method param is `int_time`)
# - SET MIN_PER_DAY to 60*24
# - GET the hours and minutes 
  # - SET todays_total_mins to: add int_time to MIN_PER_DAY and take the modulo MIN_PER_DAY (this takes care of subtracting if int_time is negative and adding if positive)
  # - SET todays_hrs and todays_mins to todays_total_mins divmod 60
# - GET string from todays hrs and todays_mins
  # - format string
# - output formatted string
# - 

# Data structures:(stay abstract/ high level; avoid implementation detail; keeps from getting boxed in a particular approach)
# Code implementation:
#  (notes relevant to actual code; remember to code with intent--think about each line)
# 

MIN_PER_HOUR = 60
HOURS_PER_DAY = 24
MIN_PER_DAY = 60 * 24
def time_of_day(int_time)
  todays_total_mins = (int_time + MIN_PER_DAY) % MIN_PER_DAY
  todays_hrs, todays_mins = todays_total_mins.divmod(MIN_PER_HOUR)
  # puts "hours are #{todays_hrs} and mins are #{todays_mins}"

  format("%02d:%02d", todays_hrs, todays_mins)
end

puts time_of_day(0) == "00:00"
puts time_of_day(-3) == "23:57"
puts time_of_day(35) == "00:35"
puts time_of_day(-1437) == "00:03"
puts time_of_day(3000) == "02:00"
puts time_of_day(800) == "13:20"
puts time_of_day(-4231) == "01:29"

# finish: 11:27

prob_sep 3
# 3 'After Midnight (Part 2)'; time started: 12:00 
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

def after_midnight(string_time)
  hrs, mins = string_time.split(':').map(&:to_i)
  int_time = hrs * MIN_PER_HOUR + mins
  int_time % MIN_PER_DAY
end

def before_midnight(string_time)
  hrs, mins = string_time.split(':').map(&:to_i)
  int_time = hrs * MIN_PER_HOUR + mins
  (MIN_PER_DAY - int_time) % MIN_PER_DAY
end


puts after_midnight('00:00') == 0
puts before_midnight('00:00') == 0
puts after_midnight('12:34') == 754
puts before_midnight('12:34') == 686
puts after_midnight('24:00') == 0
puts before_midnight('24:00') == 0

# finished: 12:17

prob_sep 4 
# num '4'; time started: 1:02 
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

def swap(string)
  reversed_words = string.split.map do |word|
    word[0], word[-1] = word[-1], word[0]
    word
  end
  reversed_words.join ' '
end

puts swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
puts swap('Abcde') == 'ebcdA'
puts swap('a') == 'a'

# finished: 1:06

prob_sep 5
# 5 'Clean Up the Words'; time started: 1:10
# Understand the problem
#   Explicit requirements: replace non alphabetic characters from supplied string with a space (1 space for each occurence of 1 or more consecutive non alpha chars)
#   - Input: string
#   - Output:
#   - Additional considerations (about the problem, not the solution):
#   - THE RESULT SHOULD NEVER HAVE CONSECUTIVE SPACES
#   - return the same string object
#   Implicit requirements:
# - 
# Mental model:
#
#
# Algorithm:
# - SET global var alpha_chars to all alpha chars lower and uppercased
# - use gsub! to subsitute anything that isnt in alpha_chars and return the string 
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

def cleanup(dirty_str)
  dirty_str.gsub!(/[^a-z]/i, ' ').squeeze(' ')
end

puts cleanup("---what's my +*& line?") == ' what s my line '

# finish 1:28

prob_sep 6
# 6 'Letter Counter (Part 1)'; time started: 1:30
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
# - SET size_counts to empty hash with default val as zero
# - SET `words` to an array resulting from splitting up supplied string
# - for each word in words increment size_counts hash by 1 with the hsh key as the char length of each word
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


def word_sizes(uncounted_string)
  size_counts = Hash.new(0)
  uncounted_string.split(' ').each do |word|
    size_counts[word.size] += 1
  end
  size_counts
end

puts word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
puts word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
puts word_sizes('') == {}

# finish 1:35

prob_sep 7
# 7 'Letter Counter (Part 2)'; time started: 1:36 
# Understand the problem
#   Explicit requirements:
#   - Input:string
#   - Output:
#   - Additional considerations (about the problem, not the solution):
#   - remove any non alpha character from the char count 
#   - 
#   Implicit requirements:
# - 
# Mental model:

def word_sizes(uncounted_string)
  size_counts = Hash.new(0)
  uncounted_string.split(' ').each do |word|
    word.delete!('^A-Za-z')
    size_counts[word.size] += 1
  end
  size_counts
end

puts word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
puts word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
puts word_sizes('') == {}

# finish 1:41

prob_sep 8
# 8 'Alphabetical Numbers'; time started: 1:47 
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
# - SET int_to_english to a hash with digits for keys and the correspond english spelling as values
# - for each integer in integers sort it based on its corresponding value in int_to_english
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
INTEGER_SPELLINGS = %(zero, one, two, three, four, five, six,
                      seven, eight, nine, ten, eleven, twelve, thirteen,
                      fourteen, fifteen, sixteen, seventeen, eighteen, nineteen
                    ).gsub(",", '').split

def alphabetic_number_sort(integers)
  int_to_english = (0..19).to_a.zip(INTEGER_SPELLINGS).to_h
  integers.sort_by { |integer| int_to_english[integer]}
end

puts alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

# finish: 1:59

prob_sep 9
# 9 'daily double'; time started: 2:00 
# Understand the problem
#   Explicit requirements:
#   - Input:string
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
# - for each character in daily double append it to the end of out_str unless the char most recently appended is the same
# - 
# - 
# - 
# - 
# - 
# - 
# - 
# - 

def crunch(messy_string)
  out_str = []
  messy_chars = messy_string.chars.each do |char|
    out_str << char unless out_str.last == char
  end
  out_str.join ''
end

puts crunch('ddaaiillyy ddoouubbllee') == 'daily double'
puts crunch('4444abcabccba') == '4abcabcba'
puts crunch('ggggggggggggggg') == 'g'
puts crunch('a') == 'a'
puts crunch('') == ''

# finish: 2:03

prob_sep 10
# 10 'Bannerizer''; time started: 2:04 
# Understand the problem
#   Explicit requirements:
#   - Input: a string
# - SET box_width to string length + 4
# - SET top_bottom_margin_line to '+' + '-'*box_width-2 + '+'
# - puts padding line
# - puts padding line with supplied string
# - puts margin line
# - puts padding line 
  # puts margin line 
# - SUBROUTINE get_body_line
  # - get_body_line creates a string '|     |'
  # - this string should center whatever string is supplied to it (default '' i.e. empty string)
  # - width is also supplied (in this case should be box_width)

def print_in_box(str)
  box_width = str.length + 4
  margin_line = "+#{'-' * (box_width - 2)}+"

  puts margin_line
  puts get_body_line('', box_width)
  puts get_body_line(str, box_width)
  puts get_body_line('', box_width)
  puts margin_line
end

def get_body_line(string = '', width = 0)
  "|#{string.center(width - 2)}|"
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('')

# finish: 2:29
