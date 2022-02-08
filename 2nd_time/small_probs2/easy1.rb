def prob_sep(num)
  puts "=> EXERCISE # #{num} -------------"
end

prob_sep 1
def repeat(word, iterations)
  iterations.times {|_| puts word}
end

repeat('Hello', 3)

prob_sep 2
def is_odd?(int)
  int % 2 == 1 
end

# [0,2,3,4,5].each { |x| puts is_odd? x}
puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true

prob_sep 3
def digit_list(int)
  int.to_s.chars.map(&:to_i)
end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true

prob_sep 4
def count_occurrences(arr)
  counts = Hash.new 0
  arr.each do |str|
    counts[str] += 1
  end
  puts counts
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)

prob_sep 5
def reverse_sentence(str)
  str.split.reverse.join ' '
end

puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words')  == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''


prob_sep 6
def reverse_words(str)
  str_arr = str.split
  out = []
  str_arr.each do |word|
    if word.size >= 5
      out << word.reverse
    else
      out << word
    end
  end
  out.join ' '
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS

prob_sep 7 
def stringy(int)
  counter = 0
  str_out = ''
  bin = true
  until counter == int
    bin ? str_out << '1' : str_out << '0'
    bin = !bin
    counter += 1
  end
  str_out
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'


prob_sep 8
def average(arr)
  sum = 0
  arr.each { |int| sum += int}
  sum / arr.size
end
puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

prob_sep 9
def sum(int)
  arr = int.digits
  arr.reduce(:+)
end
puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

prob_sep 10
def calculate_bonus(salary, bool)
  bool ? salary * 0.5 : 0
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000
