def prob_sep(num)
  puts "=> EXERCISE # #{num} -------------"
end

prob_sep 1
# 1 'ASCII Srring Value'
# Reqs:
# - write a method that determines and return the ASCII string value of supplied string
# Mental model:
# - split string into chars then iteratively store the ASCII vals into a sum variable.
# Algorithm:
# - split string
# - define 'sum' variable
# - LOOP
#   - for each char increment sum variable by character value
# - END
# RETURN sum

def ascii_value(str)
  char_arr = str.chars
  sum = 0
  while char_arr.length > 0
    cur_char = char_arr.pop
    sum += cur_char.ord
  end
  sum
end

puts ascii_value('Four score') == 984
puts ascii_value('Launch School') == 1251
puts ascii_value('a') == 97
puts ascii_value('') == 0

prob_sep 2
# 2 'After Midnight (Part 1)'
# Requirements:
# - write a method that takes a time (int) as minutes before (neg) or
#     after (pos) midnight.
# - must output a string in "hh:mm" format
# Mental model:
# - Set a constant MIN_DAY which provides the number of minutes in a day.
# - SUBROUTINE: determine if the integer is pos or negative, and either (-) from DAY_MINUTES
#                 or add to zero.
# - Next, determine how many hours and how many minutes are contained withing the
#     result of operation above.
#   Could probably use an integer method or result % 60 for this.
# - Finally, interpolate the hours and minutes into an out string.
#   Make sure that if either minutes or hours are < 10 there is a
#       0 prepended to the value.
# - RETURN interpolated strin
# Algorithm:
# - if int is 0 return '00:00'
# - SUBROUTINE:
#   - SET min_day to 24 * 60
#   - add or subtract integer to/from MIN_DAY depending on -/+.
#   - save value as cur_time.
# - Get # of hrs and min from cur_time (maybe use divmod)
# - Interpolate hrs and mins into an out_string.
#   Make sure that a 0 get prepended if either hrs or min < 10

def time_of_day(int)
  return "00:00" if int == 0

  cur_time = get_cur_time(int)
  hrs, min = cur_time.divmod(60)

  format("%02d:%02d", hrs, min)
end

def get_cur_time(int)
  min_day = 24 * 60
  bef_aft_midnt = int < 0 ? min_day : 0
  cur_day_time = int.abs % 1440
  if int < 0
    bef_aft_midnt - cur_day_time
  else
    bef_aft_midnt + cur_day_time
  end
end

puts time_of_day(0) == "00:00"
puts time_of_day(-3) == "23:57"
puts time_of_day(35) == "00:35"
puts time_of_day(-1437) == "00:03"
puts time_of_day(3000) == "02:00"
puts time_of_day(800) == "13:20"
puts time_of_day(-4231) == "01:29"

prob_sep 3
# 3 'After Midnight (Part 2)'
# Requirements:
# - Write two methods that each take a time of day in 24hr ("hh:mm") format
#    and return the number of minutes before and after midnight respectively.
# - Both methods should return a vlaue in the rane 0..1439
# Mental model:
# - after_midnight()
#  - If '00:00' return 0 (maybe dont use this)
#  - run get_ints() to get integer values for hrs and min from supplied string
#  - Multiply hrs * 60 and add min to it -- assign to cur_day_minutes
#  - cur_day_min % 1440
#  - END
# - before_midnight()
#  - If '00:00' return 0
#  - run get_ints() to get integer values for hrs and min from supplied string
#  - Multiply hrs * 60 and add min to it -- assign to cur_day_minutes
#  - subtract cur_day_min % 1440 from 1440
#  - END
#
# - SUBROUTINE get_ints(): Get integer values for hrs and min from supplied string
#    - run char and take the 0,1 elements for hour and 3,4 elements for min
#    - cobine each set of two elements into a single string and run to_i on it
#        return hrs and mins as 0,1 elements of array respectively

# ----- MY SOLUTION -------
def after_midnight(hrs_min_str)
  hrs, min = get_ints(hrs_min_str)
  get_cur_day_mins(hrs, min)
end

def before_midnight(hrs_min_str)
  hrs, min = get_ints(hrs_min_str)
  cur_day_mins = get_cur_day_mins(hrs, min)
  mins_out = 1440 - cur_day_mins
  mins_out = 0 if mins_out == 1440

  mins_out
end

def get_cur_day_mins(hrs, min)
  (hrs * 60 + min) % 1440
end

def get_ints(str)
  str_arr = str.chars
  str_arr = [str_arr[0..1], str_arr[3..4]]

  str_arr.map! { |arr| "#{arr[0]}#{arr[1]}".to_i }
end

# ----- LS SOLUTION -------
## MY COMMENTARY:
#    - This solutions is much more elegant than mine.
#      I think the place I went wrong was not thinking to split
#        to combine the chars for hrs and min--it's was simpler
#        than the subroutine I created to accomplish the same.
# HOURS_PER_DAY = 24
# MINUTES_PER_HOUR = 60
# MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

# def after_midnight(time_str)
#   hours, minutes = time_str.split(':').map(&:to_i)
#   (hours * MINUTES_PER_HOUR + minutes) % MINUTES_PER_DAY
# end

# def before_midnight(time_str)
#   delta_minutes = MINUTES_PER_DAY - after_midnight(time_str)
#   delta_minutes = 0 if delta_minutes == MINUTES_PER_DAY
#   delta_minutes
# end

puts after_midnight('00:00') == 0
puts before_midnight('00:00') == 0
puts after_midnight('12:34') == 754
puts before_midnight('12:34') == 686
puts after_midnight('24:00') == 0
puts before_midnight('24:00') == 0

prob_sep 4
# 4 'Letter Swap'
# Requirements:
# - write method which takes a str of word sep'd by spaces and returns
#   a str in which the first and last letters of every word are swapped
# - can assume each word cntns 1+ lttrs and always only words and spaces
# Mental model:
# - split str by ' '. Then iteratively swaps first and last letter (subroutine or bloc)
# - loop through the elements joining them by ' ' into a single string (maybe join() ?)
# Algorithm:
# - sstr.split(' ')
# - 
# - 
# - 
# - 

def swap(str)
  str_arr = str.split
  swpd_arr = str_arr.map do |elmnt|
    elmnt_chars = elmnt.chars
    first = elmnt_chars.shift
    last = elmnt_chars.pop
    elmnt_chars.prepend(last).push(first).join
  end

  swpd_arr.join(' ')
end

puts swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
puts swap('Abcde') == 'ebcdA'
puts swap('a') == 'a'

prob_sep 5
# 5 'Clean up the words'
# Requirements:
# - give an string, replace any non alphabetic character
#     with a single space even if char appears 2+ times in a row
# Mental model:
# - use a string method to replace any target chars usin a regex
# Algorithm:
# - 
# - 
# - 
# - 
# - 

# NOTE: I never got this to work before looking at the solution
# def cleanup(str, regex = /[^[[:alpha:]]]+/)
#   str = str
#   while str.match?(regex)
#     str = str.sub(regex, ' ')
#   end
#   str
# end

# LS Solution(s): 
# ALPHABET = ('a'..'z').to_a

# def cleanup(text)
#   clean_chars = []

#   text.chars.each do |char|
#     if ALPHABET.include?(char)
#       clean_chars << char
#     else
#       clean_chars << ' ' unless clean_chars.last == ' '
#     end
#   end

#   clean_chars.join
# end

# def cleanup(text)
#   text.gsub(/[^a-z]/, ' ').squeeze(' ')
# end

# puts cleanup("---what's my +*& line?")
# puts cleanup("---what's my +*& line?") == ' what s my line '


prob_sep 6
# 6 'Letter counter (Part 1)'
# Requirements:
# - write a method that take string with one or more space seperated
#     words and returns a hash showing the number of wrds of diff sizes
# Mental model:
# - create an empty hash
# - split the string into words by ' '. iterate through the word array
#     counting the length of each element.
# - check the hash to see if that length (as key) exists in the hash
#     - if TRUE then increment the key's value by one
#     - if FALSE then create the key with a value of 1
# - return the hash

# Note: the block for Enum#each() below could be replaced with:
#               sizes[elmnt.length] += 1
#       this would replace the need for the ellen variable as well
#       but you would need to initlz the hash as Hash.new(0) (see prob for expln)
def word_sizes(str)
  sizes = {}
  str.split.each do |elmnt|
    ellen = elmnt.length
    if sizes.has_key?(ellen)
      sizes[ellen] += 1
    else
      sizes[ellen] = 1
    end
  end
  sizes
end

puts word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
puts word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
puts word_sizes('') == {}


prob_sep 7
# 7 'Letter Counter (Part 2)'
# Requirements:
# - modify word_sizes method from above to exlude non-letters when 
#     determining word size (ex: it's would have length = 3 not 4)
# Mental model:
# - 
# Algorithm:
# - 
# - 
# - 
# - 
# - 

def word_sizes(words_string)
  counts = Hash.new(0)
  words_string.split.each do |word|
    word.delete!("^A-Za-z")
    counts[word.size] += 1
  end
  counts
end

puts word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
puts word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
puts word_sizes('') == {}

prob_sep 8
# 8 'Alphabetic Numbers'
# Requirements:
# - write a method that takes an Array of Integers between 0-19, and returns
#     Array of those integers based on the alphabetical order of their english form
# Mental model:
# - create a hash with the spellins as values. then iteratively assign those
#     values to an array. Next, SUBROUTINE sort the array by alphabetical order.
#  Finally, replace the str values in the sorted array with their keys from the hash
# Algorithm:
# - initialize a hash with integer-spelling (key, value) mapping
# - spellings = fetch_values(*arr_param)
# - sort spellings
# - iteratively replace the strings with the key they correspond to (maybe each_key() in a bloc)
#    - fetch the key wit hthe curerent elemtns value and return it

MY_SPELL = "zero, one, two, three, four, five, six, seven, eight, \
nine, ten, eleven, twelve, thirteen, fourteen, fifteen, \
sixteen, seventeen, eighteen, nineteen".split(", ") # \'s espace return character


def alphabetic_number_sort(arr)
  integers_arr = (0..19).to_a
  spell_mappings = integers_arr.zip(MY_SPELL).to_h # this creates the hash 

  sorted_spellings = spell_mappings.fetch_values(*arr).sort
  integers_out = sorted_spellings.map do |word|
    spell_mappings.invert.fetch(word)
  end
  integers_out
end

puts alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]


prob_sep 9
# 9 'ddaaiillyy ddoouubblle'
# Requirements:
# - collapse consecutive characters into a single characters
# Mental model:
# - split up the string into characters.
# - initialize an out_string
# - loop through the array checking to see if the character following
#     the current and the current character are the same
#   - if TRUE then skip that iteration
#   - if FALSE then push the character to the out_string
# - RETURN the out_string
# Algorithm:

def crunch(str)
  str = str.chars
  str_out = []
  counter = 0
  loop do
    str_out << str.first unless str.first == str_out.last
    str.shift
    counter += 1
    break if str.size == 0
  end
  str_out.join
end

puts crunch('ddaaiillyy ddoouubbllee') == 'daily double'
puts crunch('4444abcabccba') == '4abcabcba'
puts crunch('ggggggggggggggg') == 'g'
puts crunch('a') == 'a'
puts crunch('') == ''

prob_sep 10
# 10 'Bannerizer'
# Requirements:
# - write a method taht will take a short line of text, and print it within a box
# Mental model:
# - add 1 space to the beggining and end of the string and store. Store the length
#     of the string in a variable. SUBTASK: create a 'message' (i think) which is 5 lines long
#     with the middle (i.e. 3rd) line reserved to interpolate the stored string.
#     Finally, output the string.
# - banner subtask:
#   - the length of all 5 lines should be equal to the length of the stored string + 2.
#   - the 1st and 5th lines should have a '+' as the first and last characters 
#       with string.length # of - characters in between.
#   - the 2nd-4th lines should start with '|' character and contain string.length
#       # of space characters inbetween (expect the 3rd line bc its reserved for interp.)

def print_in_box(str)
  str = str.insert(0, ' ').insert(-1, ' ')
  str_length = str.length
  top_bottom = "-" * str_length
  middle = " " * str_length

  %Q(\
  +#{top_bottom}+
  |#{middle}|
  |#{str}|
  |#{middle}|
  +#{top_bottom}+\
  )
end

puts "END -------------"