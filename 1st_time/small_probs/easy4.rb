require "pry"

def prob_sep(num)
  puts "=> EXERCISE # #{num} -------------"
end

prob_sep 1
# 1 'Short Long Short' 
# Reqs: write a method
#   - takes two strings as args
#   - determines the longer of the two strings
#   - returns the result of concatenating the shorter + longer + shorter
# Algorithm:
#   - determine which string is longer
#   - create empty string
#   - concatenate strings and return new string

def short_long_short(str1, str2)
  if str1.length > str2.length
    longer = str1
    shorter = str2
  elsif
    str2.length > str1.length
    longer = str2
    shorter = str1
  end
  shorter + longer + shorter
end

puts short_long_short('abc', 'defgh') == "abcdefghabc"
puts short_long_short('abcde', 'fgh') == "fghabcdefgh"
puts short_long_short('', 'xyz') == "xyz"

prob_sep(2)
# 2 'What Century is That?
# Algorithm:
# - determine which ordinal ending is appropriate
#   - isolate the set of digits which signal the appropriate ending
#   - reference a lookup (likely Hash) object which will
#     have string ordinal ending as value
# - concatenate set of digits with string ordinal ending
# - END
# teens are the
# initial try below
# def century(year)
#   century = (year / 100) + 1
#   if (10..19).include?(century)
#     ending = "th"
#   else
#     ones_place = century.digits.first
#     ending = case ones_place
#              when 0 then 'th'
#              when 1 then "st"
#              when 2 then "nd"
#              when 3 then "rd"
#              when 4..9 then 'th'
#              else "error"
#              end
#   end

#   century.to_s + ending
# end

def century(year)
  century = year / 100 + 1
  century = year / 100 if year % 100 == 0
  century.to_s + century_suffix(century)
end

def century_suffix(cent_digits)
  return 'th' if [11, 12, 13].include?(cent_digits % 100)

  case cent_digits % 10
  when 1 then 'st'
  when 2 then 'nd'
  when 3 then 'rd'
  else 'th'
  end
end

puts century(2000) == '20th'
puts century(2001) == '21st'
puts century(1965) == '20th'
puts century(256) == '3rd'
puts century(5) == '1st'
puts century(10103) == '102nd'
puts century(1052) == '11th'
puts century(1127) == '12th'
puts century(11201) == '113th'

prob_sep(3)
# 3 'Leap Years (Part 1)'
def leap_year?(year)
  div_100 = year % 100 == 0
  div_400 = year % 400 == 0
  if div_400
    true
  elsif div_100
    false
  else
    year % 4 == 0
  end
end

puts leap_year?(2016) == true
puts leap_year?(2015) == false
puts leap_year?(2100) == false
puts leap_year?(2400) == true
puts leap_year?(240000) == true
puts leap_year?(240001) == false
puts leap_year?(2000) == true
puts leap_year?(1900) == false
puts leap_year?(1752) == true
puts leap_year?(1700) == false
puts leap_year?(1) == false
puts leap_year?(100) == false
puts leap_year?(400) == true

prob_sep(4)
# 4 'Leap Years' (Part 2)
def leap_year?(year)
  div_100 = year % 100 == 0
  div_400 = year % 400 == 0
  if div_400
    true
  elsif div_100 && year > 1752
    false
  else
    year % 4 == 0
  end
end

puts leap_year?(2016) == true
puts leap_year?(2015) == false
puts leap_year?(2100) == false
puts leap_year?(2400) == true
puts leap_year?(240000) == true
puts leap_year?(240001) == false
puts leap_year?(2000) == true
puts leap_year?(1900) == false
puts leap_year?(1752) == true
puts leap_year?(1700) == true
puts leap_year?(1) == false
puts leap_year?(100) == true
puts leap_year?(400) == true

prob_sep(5)
# 5 'Multiples of 3 and 5' 
# Reqs:
# - finds all multiples of 3 or that lie between 1 and some other number
# - computes the sum of those multiples
# Mental model:
#   Use two loops one for multiples of 3 and one for multiples of 5
#   each loop will start with the initial value of 3 or 5 and add the same each time
#   push the new value to an array unless the value is greater than NUM
#   BREAK IF new value is greater than NUM 
#   combine both arrays and run uniq on result
#   reduce '+'
#   END
# Algorithm:
# - LOOP
#
# first attempt:
# def looper(factor, int)
#   current_val = factor
#   arr_out = []
#   while true
#     if int <= current_val
#       break
#     end
#     arr_out.push(current_val)
#     current_val += factor
#   end
#   arr_out
# end

# def multisum(int)
#   mults_3 = looper(3, int)
#   mults_5 = looper(5, int)
#   puts mults_3.max
#   mults_3.push(mults_5).flatten.uniq.reduce(:+)
# end

# after viewing solution
def multiple?(num, divisor)
  num % divisor == 0
end

def multisum(int)
  sum = 0
  1.upto(int) do |x|
    if multiple?(x, 3) || multiple?(x, 5)
      sum += x
    end
  end
  sum
end

puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168

prob_sep(6)
# 6 'Running Totals'
# mental model:
# - set sum to 0
# - add current value to sum and assign it to arr_out

def running_total(arr)
  sum = 0
  arr.map do |x|
    sum += x
  end
end

puts running_total([2, 5, 13]) == [2, 7, 20]
puts running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total([3]) == [3]
puts running_total([]) == []

prob_sep(7)
# 7 'Convert a String to a Number!'
# things ill need:
# - variable to note str_length
# - an iteration device to iterate through the string and increments the out_num
# - hash look up table for assing int from str character
# - a way to keep track of the digit place (1's 10's 100's etc)
# - a way to iteratively increment the out_num by each digit * place value 
# mental model:
# - 

def str_lookup(str)
  str_int = {
    '0' => 0,
    '1' => 1,
    '2' => 2,
    '3' => 3,
    '4' => 4,
    '5' => 5,
    '6' => 6,
    '7' => 7,
    '8' => 8,
    '9' => 9
  }

  str_arr = str.chars

  str_arr.map do |x|
    str_int.fetch(x)
  end
end

def string_to_integer(usr_str)
  int_arr = str_lookup(usr_str)
  sum = 0
  int_arr.reverse.each_with_index do |digit, i|
    if i == 0
      sum += digit
    else
      digit_place = 1
      i.times { digit_place *= 10 }
      sum += digit * digit_place
    end
  end
  sum
end

puts string_to_integer('4321') == 4321
puts string_to_integer('570') == 570
puts string_to_integer('1') == 1

prob_sep(8)
# 8 'Convert a String to a Signed Number!'
def string_to_signed_integer(string)
  integer = string_to_integer(string.delete('+-'))
  if string[0] == '-'
    integer * -1
  else
    integer
  end
end

puts string_to_signed_integer('4321') == 4321
puts string_to_signed_integer('-570') == -570
puts string_to_signed_integer('+100') == 100

prob_sep(9)
# 9 'Convert a Number to a String!'
def integer_to_string(num)
  digits_ = {
    0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4',
    5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9'
  }
  digit_arr = num.digits.map { |digit| digits_[digit] }
  digit_arr.reverse.inject(:+)
end

puts integer_to_string(345).inspect
puts integer_to_string(4321) == '4321'
puts integer_to_string(0) == '0'
puts integer_to_string(5000) == '5000'

prob_sep(10)
# 10 'Conver a Signed Number to a String!'

def signed_integer_to_string(number)
  sign = number < 0 ? '-' : '+'
  sign = '' if number == 0  
  integer_to_string(number.magnitude).prepend(sign)
end

puts signed_integer_to_string(4321) == '+4321'
puts signed_integer_to_string(-123) == '-123'
puts signed_integer_to_string(0) == '0'
