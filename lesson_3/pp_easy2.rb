# 1 ages.key?("Spot")
# 2 

munsters_description = "The Munsters are creepy in a good way."
puts munsters_description.swapcase!
puts munsters_description.capitalize!
puts munsters_description.downcase!
puts munsters_description.upcase!

# 3
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
ages.merge!(additional_ages)
puts ages

# 4
advice = "Few things in life are as important as house training your pet dinosaur."
puts advice.match?("Dino")

# 5
flinstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flinstones

# 6 
flinstones << "Dino"
p flinstones

# 7 
p flinstones.append("Dino", "Happy") 

# 8 
advice = "Few things in life are as important as house training your pet dinosaur."
puts advice.slice(0, advice.index("house"))

# 9 
statement = "Then Flintstones Rock!"
p statement.count('t')

# 10 
title = "Flintstone Family Members"
title.center(40)