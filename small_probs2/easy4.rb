def prob_sep(num)
  puts "=> EXERCISE # #{num} -------------"
end

require 'pry-byebug'
prob_sep 1
# 1 'Short Long Short'
# Understand the problem
#   Explicit requirements:
#   - Input:2 strings
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
# - determine which strin is longer
# - assign longer string to `long` and shorter to `short`
# - concatenate and return
# - 
# - 
# - 
# - 
# - 
# - 

# Code implementation:
#  (notes relevant to actual code; remember to code with intent--think about each line)
# 


def short_long_short(str1, str2)
  longer = str1.size > str2.size ? str1 : str2
  shorter = str1.size < str2.size ? str1 : str2

  shorter + longer + shorter
end

puts short_long_short('abc', 'defgh') == "abcdefghabc"
puts short_long_short('abcde', 'fgh') == "fghabcdefgh"
puts short_long_short('', 'xyz') == "xyz"



prob_sep 2
# 2 'What Century is That?'
# Understand the problem
#   Explicit requirements:
#   - Input:integer
#   - Output:string ordinal number (3rd, 4th, etc.)
#   - Additional considerations (about the problem, not the solution):
#   - 1901 - 2000 comprises 20th century
#   - 
#   Implicit requirements:
#   Questions:

# Examples and test cases:
#  

# Data structures:(stay abstract/ high level; avoid implementation detail; keeps from getting boxed in a particular approach)
# - 
# Algorithm:
# - divide integer by 100 and store if remainder is 0 or not
# -   if integer is not zero then add one to the quotient, otherwise do nothing
# - add appropriate ending to quotient
# -    check last character and assign ending accordingly
# - return final result
# - 
# - 
# - 
# - 

# Code implementation:
#  (notes relevant to actual code; remember to code with intent--think about each line)
# 


def century(year)
  century, remainder = year.divmod(100)
  century += 1 unless remainder == 0

  
  ending =
    if century.digits[1] == 1
      'th'
    elsif century.digits.first == 1
      'st'
    elsif century.digits.first == 2
      'nd'
    elsif century.digits.first == 3
      'rd'
    else
      'th'
    end

    century.to_s + ending

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


prob_sep 3
# 3 'Leap Years (Part 1)'
# Understand the problem
#   Explicit requirements:
#   - Input: integer
#   - Output:boolean 
#   - Additional considerations (about the problem, not the solution):
#   - if the number is div by 100 its not a leap year unless also divisible by 400
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



def leap_year?(year)
  return true if year % 400 == 0
  return false if year % 100 == 0
  return true if year % 4 == 0
  false
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


prob_sep 4
# 4 'Leap Years (part 2)'
# Understand the problem
#   Explicit requirements:
#   - Input: integer
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


def leap_year?(year)
  return true if ((year < 1752) && year % 4 == 0) || year % 400 == 0
  year >= 1752 && (year % 100 != 0 && year % 4 == 0)
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


prob_sep 5
# 5 'Multiples of 3 and 5'
# Understand the problem
#   Explicit requirements:
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
# - assemble all multiples up to n into an array and sum them together
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


def multisum(n)
  mults = []
  0.upto(n.divmod(3).first) do |x|
    mults << 3 * x
  end

  0.upto(n.divmod(5).first) do |x|
    mults << 5 * x
  end
  
  mults.uniq.inject(:+)
end

puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168


prob_sep 6
# 6 'Running Totals'
# Understand the problem
#   Explicit requirements:
#   - Input: array
#   - Output:array
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

def running_total(arr)
  out_arr = []
  sum = 0
  arr.each do |el|
    sum += el
    out_arr << sum
  end
  out_arr
end

puts running_total([2, 5, 13]) == [2, 7, 20]
puts running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total([3]) == [3]
puts running_total([]) == []

prob_sep 7
# 7 'Convert a Strin to a Number'
# Understand the problem
#   Explicit requirements:
#   - Input: string
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


def string_to_integer(str)
  lookup = { '0': 0, '1': 1, '2': 2, '3': 3, '4': 4,
            '5': 5, '6': 6, '7': 7, '8': 8, '9': 9 }

  dig_arr = str.chars.map { |dig| lookup[dig.to_sym] }
  out = 0
  dig_arr.each { |dig| out = (out * 10) + dig }
  out
end

puts string_to_integer('4321') == 4321
puts string_to_integer('570') == 570


prob_sep 8
# 8 'convert a String to a Signed  Number!'
# Understand the problem
#   Explicit requirements:
#   - Input: string
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


def string_to_signed_integer(str)
  first = str.chars.first
  str = str.chars.slice(1..).join if ['+', '-'].include?(first)
  out = string_to_integer(str)
  if first == '-'
    out * -1
  else
    out
  end
end


puts string_to_signed_integer('4321') == 4321
puts string_to_signed_integer('-570') == -570
puts string_to_signed_integer('+100') == 100

prob_sep 9
# 9 'convert a Number to a String!'
# Understand the problem
#   Explicit requirements:
#   - Input: integer
#   - Output: string
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

DIGS = (0..9).to_a.zip(('1'..'9').to_a).to_h


def integer_to_string(int)
  str_digs = int.digits.reverse.each { |x| DIGS[x]}
  str_digs.join
end

puts integer_to_string(4321) == '4321'
puts integer_to_string(0) == '0'
puts integer_to_string(5000) == '5000'


prob_sep 10
# 10 'Convert a signed number to a string'
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

def signed_integer_to_string(int)

  out = integer_to_string(int.abs)
  sign = int <=> 0
  case sign
  when -1 then '-' + out
  when 1 then '+' + out
  else out
  end
end

puts integer_to_string(4321) == '4321'
puts integer_to_string(0) == '0'
puts integer_to_string(5000) == '5000'