# Below is the formula
# m = p * (j / (1 - (1 + j)**(-n)))
#
# m = monthly payment
# p = loan amount
# j = monthly interest rate
# n = loan duration in months
#
# mnthly_pymnt = loan_amt * (mnthly_int_rate / (1 - (1 + mnthly_int_rate)**(-1 * term_lngth)))
#
# define methods
def input_loop(message)
  loop do
    puts("=> #{message}")
    usr_input = gets.chomp
    if valid_num?(usr_input)
      usr_input = usr_input.to_f
      break usr_input
    else
      puts("There is an issue with your input. Please enter a valid number")
    end
  end
end

def valid_num?(num)
  Float(num) rescue false
end

# program start
puts "=> Hello and welcome to the mortgage payment calculator!"
loop do
  loan_amt = input_loop("Please enter the loan amount:")
  mnthly_int_rate = 0.01 * (input_loop("Please enter the yearly interest rate (APR):") / 12)
  term_lngth = input_loop("Please enter the loan duration in months:")

  mnthly_pymnt = loan_amt * (mnthly_int_rate / (1 - (1 + mnthly_int_rate)**(-1 * term_lngth)))
  mnthly_pymnt = mnthly_pymnt.round(2)
  puts("=> Your monthly payment is: $#{mnthly_pymnt}")
  puts("Would you like to compute another loan? (y/n):")
  continue = gets.downcase.chomp
  break unless continue.start_with?('y')
end

puts("=> Thank you for using the Mortgage Calculator!")
puts("=> Good bye!")