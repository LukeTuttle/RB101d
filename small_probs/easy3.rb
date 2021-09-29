require "pry"

def prob_sep(num)
  puts "=> EXERCISE # #{num} -------------"
end


prob_sep(1)
# 1
# Reqs: 
#   Write a program that solicits 6 numbers from the user, then prints a message 
#     that describes whether or not the 6th number appears amongst the first 5 numbers.
# Algorithm:
#   -

# def get_num(ord, rec_arr)
#   puts "==> Enter the #{ORDINALS[ord]} number"
#   usr_num = gets.chomp.to_i
#   rec_arr.push(usr_num)
# end

# usr_numbers = []
# ORDINALS = %w(1st 2nd 3rd 4th 5th 6th)

# 6.times do |i|
#   get_num(i, usr_numbers)
# end

# last_num = usr_numbers.pop
# out_nums = []
# usr_numbers.each do |x|
#   out_nums.push(x) unless x / last_num == 0
# end

# if out_nums.empty?
#   puts "The number #{last_num} does not appear in #{usr_numbers}"
# else
#   puts "The number #{last_num} appears in #{out_nums}"
# end



prob_sep(2)
# 2
# Reqs:
#   - prompts user for two positive integers
#   - prints result of following operations = - * / % **
# Algorithm:
#   -

# def prompt(message)
#   puts "==> #{message}"
# end

# def op_output(n1, n2, op)
#   prompt("#{n1} #{op} #{n2} = #{n1.public_send(op, n2)}")
# end

# prompt("Enter the first number:")
# first_number = gets.chomp.to_i
# prompt("Enter the second number:")
# second_number = gets.chomp.to_i

# operations = [:+, :-, :*, :/, :%, :**]
# operations.each do |x|
#   op_output(first_number, second_number, x)
# end


prob_sep(3)
# 3
# Reqs: 
# Algorithm:
#   -
# puts "Please write word or multiple words:"
# input = gets.chomp

# char_size = input.delete(" ").size

# puts "There are #{char_size} characters in '#{input}'"


prob_sep(4)
# 4
# Reqs: 
# Algorithm:
#   -

prob_sep(5)
# 5
# Reqs: 
# Algorithm:
#   -

prob_sep(6)
# 6
# Reqs: create an xor method
# Algorithm:
#   a = true , b = false 
#   
def xor(a, b)
  ((a && b) && (a || b)) == !(a || b)
end 

puts xor(true, false)




prob_sep(7)
# 
# Reqs: 
# Algorithm:
#   -

prob_sep()
# 10
# Reqs: 
# Algorithm:
#   -

prob_sep()
# 10
# Reqs: 
# Algorithm:
#   -


prob_sep()
# 10
# Reqs: 
# Algorithm:
#   -

prob_sep()
# 10
# Reqs: 
# Algorithm:
#   -







