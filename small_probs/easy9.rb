def prob_sep(num)
  puts "=> EXERCISE # #{num} -------------"
end


prob_sep 1
# 1 'Welcome Stranger'
# Understand the problem
#   Explicit requirements:
#   - Input: an array and a hash
#     - hash: contains element which when joined with a space create a full name
#     - array: contains keys :title and :occupation with corresponding values
#   - Output: return a greeting containing the persons full name, title, and occupation
#   - Additional considerations (about the problem, not the solution):
#     - no other information was given
#     - 
#   Implicit requirements:
#   Questions: how to handle non valid inputs such as empty strings, nil, or zero length objects

# Examples and test cases:
#  greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => Hello, John Q Doe! Nice to have a Master Plumber around.

# Data structures:(stay abstract/ high level; avoid implementation detail; keeps from getting boxed in a particular approach)
# - an array and a hash
# Algorithm:
# - join strings in string array and save to variable `name`
# - save occupation and title values from hash to correspondingly named variables 
# - interpolate name title and occupation into a string
# - 

# Code implementation:
#  (notes relevant to actual code; remember to code with intent--think about each line)


def greetings(name, creds)
  name = name.join(' ')
  title = creds[:title]
  occupation = creds[:occupation]

  "Hello, #{name}! Nice to have a #{title} #{occupation} around."
end

puts greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })

prob_sep 2
# 2 'Double Doubles'
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