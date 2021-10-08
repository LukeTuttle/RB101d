#1 
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
hash = {}
flintstones.each_with_index do | x, i|
  hash[x] = i
end

puts hash

#2
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
puts ages.values.sum

#3
ages.select! do |_, value|
  value < 100
end

puts ages

#4
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
puts ages.values.min

#5
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
puts flintstones.index { |name| name.slice(0, 2) == "Be" }

#6
flintstones.map! { |name| name.slice(0, 3)}
p flintstones

#7
statement = "The Flintstones Rock"
char_counts = Hash.new(0)
statement.chars.each do |char|
  char_counts[char] += 1 unless char == ' '
end
puts char_counts

#8
# 1 and 3
# 1 and 2

#9 
# split the string into word and upcase the first element of each word, then join(' ')

def titleize(str)
  str.split.map do |word|
    letters = word.chars 
    letters[0] = letters[0].upcase
    letters.join
  end.join(' ')
end

puts titleize("the flintstones rock")


#10

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

new_hash = munsters.each do |_, hash|
  age = hash.values[0]
  group = case
          when age.between?(0, 17) then "kid"
          when age.between?(18, 64) then "adult"
          when age >= 65 then "senior"
          end
  hash["age_group"] = group
end

puts munsters