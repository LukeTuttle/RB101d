=begin
m = p * (j / (1 - (1 + j)**(-n)))

m = monthly payment
p = loan amount
j = monthly interest rate
n = loan duration in months
=end

# PEDAC
# welcome message
# ask loan amnt; dont forget to validate each of these
# ask APR
# ask loan duration in years
# calculate
#   monthly interest rate; loan duration in months; monthly payment
# display calcs to user
# end

def message(str)
  puts "=> " + str
end

def valid_entry?(str)
  str.to_i.to_s == str
end

def solicit_info(request)
  loop do
    message(request)
    response = gets.chomp
    return response.to_i if valid_entry? response
    message("Your input was invalid. Please use integers only.")
  end
end

# START
message("Hello and welcome to loan calcualtor!")

loan_amt = solicit_info("What is the loan amount in dollars?")
apr = solicit_info("What is the annual percentage rate (APR) of the loan?")
loan_duration_y = solicit_info("What is the duration of the loan in years?")

loan_duration_m = loan_duration_y * 12
monthly_interest_rate = (apr / 12.0) * 0.01
monthly_payment = loan_amt * (monthly_interest_rate / (1 - (1 + monthly_interest_rate)**(-loan_duration_m)))

message("The monthly payment for the loan is $#{monthly_payment.round 2}")
puts '-------------------------'
message('Thank you for using the calculator! Bye!')
