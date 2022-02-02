def prob_sep(num)
  puts "=> EXERCISE # #{num} -------------"
end


prob_sep(1)
# 1 
# Reqs: 
#   Build a program that randomly generates and prints Teddy's age.
#   To get the age, you should generate a random number between 20 and 200.
# Algorithm:
#   -
puts "Teddy is #{rand(20..200)} years old!"

prob_sep(2)
# 2
# Reqs:
#   Build a program that asks a user for the length and width of a room in
#     meters and then displays the area of the room in both
#     square meters and square feet.
# Algorithm:
#   -
# commented out below to avoid running every time for subsequent exercises
# puts "Enter the lenth of the room in meters:"
# leng = gets.chomp.to_f
# puts "Enter the width of the room in meters:"
# width = gets.chomp.to_f
# 
# puts "The area of the room is #{leng * width} square meters (#{leng * width * 10.7639} square feet)."

prob_sep(3)
# 3 
# Reqs: 
# Algorithm:
#   -
# puts "What is the bill?: "
# bill = gets.chomp.to_f
# puts "What is the tip percentage?: "
# tip_perc = gets.chomp.to_f
# 
# tip = (bill * (tip_perc * 0.01)).round
# puts "The tip is $#{tip}"
# puts "The total is $#{tip + bill}"

prob_sep(4)
# 4 
# Reqs:
#   Build a program that displays when the user will retire and how many 
#     years she has to work till retirement.
# Algorithm:
#   -

# puts "What is your age?"
# age = gets.chomp.to_i
# puts "At what age would you like to retire?"
# retire = gets.chomp.to_i

# years_left = retire - age
# puts "It's 2021. You will retire in #{2021 + years_left}."
# puts "You only have #{years_left} years of work to go!"

# note: I could have used Time.now.year to get the current year.

prob_sep(5)
# 5 
# Reqs: 
# Algorithm:
#   -
# my initial take --answer provided was much better
# puts "What is your name?"
# name = gets.chomp
# name = name[-1] == '!' ? name.chop : name
# normal_greet = "Hello #{name}. "
# yelling_greet = "Why are we screaming?"

# puts name.chars.include?('!') ? (normal_greet + yelling_greet).upcase : normal_greet

prob_sep(6)
# 6
# Reqs:
# Algorithm:
#   -
# (1..99).to_a.each do |x|
#   x.odd? ? puts(x) : next
# end

prob_sep(7)
# 7
# Reqs:
# Algorithm:
#   -

prob_sep(8)
# 8
# Reqs:
# Algorithm:
#   -

def compute_sum(number)
  total = 0
  1.upto(number) { |value| total += value }
  total
end

def compute_product(number)
  total = 1
  1.upto(number) { |value| total *= value }
  total
end

puts "Please enter an integer reater than 0:"
int = gets.chomp.to_i
puts "Enter 's' to compute the sum, 'p' to compute the product."
oper = gets.chomp.downcase

if oper == 's'
  result = compute_sum(int)
  oper = 'sum'
elsif oper == 'p'
  result = compute_product(int)
  oper = 'product'
else
  puts "That is not a valid input, try 's' or 'p'"
end

puts "The #{oper} of the integers 1 and #{int} is #{result}"

prob_sep(9)
# 9 
# Reqs: 
# Algorithm:
#   -

prob_sep(10)
# 10
# Reqs: 
# Algorithm:
#   -

puts "=> END"