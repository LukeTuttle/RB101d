def prob_sep(num)
  puts "=> EXERCISE # #{num} -------------"
end

prob_sep 1
# 1 
# arr.sort do |a,b|
  # b.to_i <=> a.to_i
# end
# => ["11", "10", "9", "8", "7"]


prob_sep 2
# 2 
# Understand the problem
#   Explicit requirements:
#   - Input:
#   - Output:
#   - Additional considerations (about the problem, not the solution):
#   - 
#   - 
#   Implicit requirements:
# Data structures:(stay abstract/ high level; avoid implementation detail; keeps from getting boxed in a particular approach)
# - 4 element array of hashes each of which contain the keys title:, author:, published:
# Algorithm:
# - return the numeric version of each `published:` value to sort method from it's block
# -  
books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

a = books.sort do |hash1, hash2|
  hash1[:published].to_i <=> hash2[:published].to_i
end
puts a


prob_sep 3

arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
puts arr1[2][1][3]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
puts arr2[1][:third][0]

arr3 = [['abc'], ['def'], {third: ['ghi']}]
puts arr3[2][:third][0][0]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
puts hsh1['b'][1]

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
puts hsh2[:third].keys[0] # or hsh2[:third].key(0)


prob_sep 4
arr1 = [1, [2, 3], 4]
arr1[1][1] = 4
puts arr1

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
arr2[2] = 4
puts arr2

hsh1 = {first: [1, 2, [3]]}
hsh1[:first][2][0] = 4
puts hsh1

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
hsh2[['a']][:a][2] = 4
puts hsh2


prob_sep 5
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# data structure: hash with five keys (names as strings) each of which have
#   an additional hash for their value. This nested hash has 2 (string keys (age, gender)

# algorithm:
# - get a collection of the ages of the male members of the family
#   - iterate through the hash, selecting only members with 'male' value for 'gender' key
#     - access the 'gender' key's value for each family member
# - sum the ages of the male members of the family


a = munsters.select do |_, value|
  value['gender'] == 'male'
end
#fetch_values('age').sum

b = a.values

c = b.map {|hash| hash['age']}.sum
p c

prob_sep 6

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each_pair do |key, value|
  puts "#{key} is a #{value['age']}-year-old #{value['gender']}."
end


prob_sep 7
prob_sep 8

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], 
  third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.values.flatten.each do |word|
  word.chars.each do |char|
    p char if 'aeiou'.chars.include?(char)
  end
end

puts 'second attempt'

hsh.each do |_, value|
  value.each do |str|
    str.chars.each do |char|
      puts char if 'aeiou'.include?(char)
    end
  end
end

prob_sep 9

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

a = arr.map do |arr|
  arr.sort {|a,b| b <=> a}
end

p a

prob_sep 10
arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
a = arr.map do |hsh|
  hsh.values.map do |value|
    value + 1
  end
end

# second attempt
a = arr.map do |hsh|
  incremented_hsh = {}
  hsh.each do |key, value|
    incremented_hsh[key] = value + 1
  end
  incremented_hsh
end


puts 'variable: a'
p a 
puts 'variable: arr'
p arr



prob_sep 11
arr = [[2], [3, 5, 7], [9], [11, 13, 15]]
a = arr.map do |sub_arr|
  sub_arr.select {|x| x % 3 == 0}
end

p a


prob_sep 12
arr = [
  [:a, 1], ['b', 'two'], ['sea', {c: 3}],
  [{a: 1, b: 2, c: 3, d: 4}, 'D']
]

hsh_out = {}
arr.each do |sub_arr|
  hsh_out[sub_arr[0]] = sub_arr[1]
end

p hsh_out

prob_sep 13
arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

a = arr.sort_by do |sub_arr|
  sub_arr.select { |int| int % 2 != 0 }
end

p a 


prob_sep 14
hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

out_arr = []
hsh.each_pair do |name, details|
  if details[:type] == 'fruit'
    out_arr << details[:colors].map(&:capitalize)
  else
    out_arr << details[:size].upcase
  end
end

p out_arr


prob_sep 15
arr = [
  {a: [1, 2, 3]},
  {b: [2, 4, 6], c: [3, 6], d: [4]},
  {e: [8], f: [6, 10]}
]


a = arr.select do |hsh|
  boolean = true
  hsh.map do |_, sub_arr|
    sub_arr.each do |int|
      break boolean = false if int.odd?
    end
    break if boolean == false
  end
  boolean
end

p a 


prob_sep 16

def uuid_gen()
  type = ['alpha', 'numeric']
  letters = ('a'..'z').to_a
  numbers = (0..9).to_a.map(&:to_s)
  uuid = ''

  32.times do |_|
    let_or_dig = type.sample
    uuid += let_or_dig == 'alpha' ? letters.sample : numbers.sample
  end
  
  dashes(uuid)
end

def dashes(str)
  index = 0
  [8,4,4,4].each do |i|
    index += i
    str.insert(index, '-')
    index += 1
  end
  str
end

puts uuid_gen()
