
require 'rspec'
=begin
input: integer array
output: integer (min sum of 2 element multiplaction products)

rules: array will contain positive vals only and will always have even length

mental model: sort the array either desc or asc order (doesnt matter which)
  then multiply each element by its corresponding element at the other end of the array which 
  has an equal distance from the terminal ends of the array

Algorithm:
- reassign array to sorted array
- set `products` to an empty array
- iterate over the sorted array (1/2 its length)
  - multiply elements together moving toward the middle by one index for each iteration
  - append the product of the multiplication to `products`
- reduce the products array by summing all elements and return the result

=end

def min_sum(arr)
  arr = arr.sort
  products = [0]
  (arr.size / 2).times do |i|
    products << (arr[i] * arr[-(i + 1)])
  end
  products.inject(:+)
end

# p min_sum([5, 4, 3, 2])
# p min_sum([])
# p min_sum([12,6,10,26,3,24])


# describe "Solution" do
#   it "Fixed tests" do
#     expect(min_sum([5,4,2,3])).to eq(22)
#     expect(min_sum([12,6,10,26,3,24])).to eq(342)
#     expect(min_sum([9,2,8,7,5,4,0,6])).to eq(74)
#     expect(min_sum([1,2])).to eq(2)
#     expect(min_sum([])).to eq(0)
#   end
# end

=begin
input: string
output: hash (keys are symoblized lowercase letters and value is the count of that letter in the string)

rules: count the *lowercase* letters, doesnt say explicitly that string will contain only lowercase letters but examples show only lowercase letters

mental model: create an empty hash, create an array of unique letter characters (i.e get rid of spaces and any non alpha chars)
 then iterate of the unique chars array setting the key in the hash as the current letter (symbolized version) and the value as the letter count in the original string.
return the hash

algorithm: 
- set out_hash to empty hash
- *set uniq_chars to an array containing only the unique lowercase letters from the string (no other chars)
- iterate over uniq_chars setting the current char as a key in out_hash (symoblized version) with the value as the letter count in original str
- return the hash
=end

# def letter_count(str)
#   out_hash = Hash.new
#   uniq_chars = []
#   str.chars.each { |char| uniq_chars << char if ('a'..'z').include?(char) }
#   uniq_chars.uniq!

#   uniq_chars.each do |char|
#     out_hash[char.to_sym] = str.count(char)
#   end
#   out_hash
# end

# p letter_count('activ.it y')

=begin
input: string of integers
output: integer

rules: Given a string of integers, return the number of odd-numbered substrings that can be formed. 
- if an odd integer appears in the string more than once, it should be counted n times as an odd substring in the final count
- substrings are substrings i.e. characters cannot be rearranged to form substrings which dont appear in original string.
- original string can count as a substring if it is odd
- no info about whether string is empty but I would assume a 0 should be returned if no odd substrings are found

mental_model: create an array of all possible substrings. iterate of the array checking if each substring is odd.
if substring is odd then increment a counter and return the counter after all iterations are finished.

Algorithm
- create an array of all possible substrings (including original str)
- iterate over sub string array incrementing a counter each time you find an odd substring
=end


# def solve(str)
#   sub_strs = []
#   1.upto(str.size) do |n_size|
#     str.chars.each_cons(n_size) do |sub_arr|
#       sub_strs << sub_arr.join
#     end
#   end
#   n_odds = 0
#   sub_strs.each {|str| n_odds += 1 if str.to_i.odd?}
#   n_odds
# end

# p solve("1357")

=begin
input: string
output: boolean (whether string contains all letters of alphabet)

rules: Given a string, detect whether or not it is a pangram. Return True if it is, False if not. Ignore numbers, case, and punctuation.
Q's: what if string is empty? I assume I should return false

mental model: for each letter a-z check if that letter exists in the string, if it does not return false otherwise return true

=end


# def pangram?(str)
#   str = str.downcase
#   ('a'..'z').each do |letter|
#     return false unless str.include?(letter)
#   end
#   true
# end

=begin
input: a string in camel case
output: that string containing only lowercase letters formatted in kebab case
rules: output should contain only lowercase letters

mental model: get a new string which contains only letters. then create another string from the new string which has a
hyphen inserted before uppercase letters, then make everything downcase. 

Algorithm
- set 'ltrs_only' to a string which has any non alpha chars removed from orig string
- get a new string from ltrs only which has a hyphen inserted before uppercase letters
- downcase the new string and return it
=end


# def kebabize(str)
#   ltrs_only = str.chars.select { |char| ('a'..'z').include?(char.downcase)}.join
#   out_str = ''

#   ltrs_only.chars.each_with_index do |char, i|
#     if char.downcase != char && i != 0
#       out_str << '-' + char
#     else
#       out_str << char
#     end
#   end
#   out_str.downcase
# end

# p kebabize('myCamelHas3Humps. ')


=begin
input: str1 and str2
output: boolean 

rules: can a portion of str1 chars be rearranged to match str2? return true or false
- only lowercase letters will be used, no punctuation or digits either
- performance should be considered

mental model: determine whether str1 has all str2 characters (with appropriate counts) (*can return false if not). 
create a hash of letter counts for str2. then iterate over this hash checking whether str1 has the same or greater count for given character
return false if str1 char count is less than str2 char count at any point 

algorithm:
- set str2_counts to a hash of str2 char counts
- iterate over str2_counts checking that the value for the given key is less than or equal to the count of that character in str1
  - if yes next iteration
  - if no then return false
- return true
=end


# def scramble(str1, str2)
#   str2_counts = Hash.new
#   str2.chars.uniq.each { |letter| str2_counts[letter] = str2.count(letter)}

#   str2_counts.each_pair do |letter, n|
#     return false unless n <= str1.count(letter)
#   end

#   true
# end

# p scramble('cedewaraaossoqqyt','codewars')


=begin
input: string
output: string

rules: 
- if final result is longer than 140 chars return false
- if final result is an empty string (ie. contains only space character(s) or is 0 length) return false
-output must:
- start with # character
- contain no spaces
- have each word capitalized

q: what about non alpha characters? 

mental model: split the string by space characters (will remove all space chars). capitalize the resulting elements (words). 
 join elements into a single string. return false if string is empty or is greater than 139 chars. prepend '#' char and return the string
 
Algorithm: 
- set `words`` to array containing only the words from the original string
- iterate over `words` capitalizing each element (could use map here)
- join elements into a single string
- return false unless string is less than 140 chars and is not empty
- prepend string with '#' and return it
=end

# def generateHashtag(str)
#   words = str.split(' ')
#   words = words.map do |word|
#     word[0] = word[0].upcase
#     word
#   end
#   out_str = words.join
#   return false unless out_str.size < 140 && out_str != ''
#   out_str.prepend('#')
# end

# p generateHashtag("Codewars is nice")

=begin
input: hash1: recipe, hash2: ingredients
output: integer

rules: 
- ingredients which are not present in ingredients object but are in the recipe are considered to have a 0 val (and make 0 cakes posssible as well)

# mental model: do integer division for each ingredient and the number of cakes with be the min val in the collection of division results

# consideration: what happens in iteration step if recipe object key doesnt exist in ingredients? 

algorithm: 
- set counts to  an empty array (or hash) 
- iterate over recipe 
  - return false unless ingredients has current recipe key
  - divide the value of ing (ingredient from ingredients) into the value of ingr (ingredient from recipe) and append to counts
find the min value in counts and return it

=end

# def cakes(recipe, available)
#   counts = []
#   recipe.each_pair do |ing, quant|
#     return 0 unless available.has_key?(ing)
#     counts << available[ing] / quant
#   end
#   counts.min
# end


# p cakes({"flour"=>500, "sugar"=>200, "eggs"=>1},{"flour"=>1200, "sugar"=>1200, "eggs"=>5, "milk"=>200})

=begin
input: two integer arrays of equal length
output: integer (avg of squares of element-wise differences)

rules:

mental model: for each element in arr1 find the absolute difference with corresponding element in arr2.
square the result and append to a squares arr. return the mean val of square array elements

algorithm: 
- set `squares` to an empty array
- iterate over arr1 elements
  - append the abs difference of arr1[i] and arr2[i] square to squares
- return mean val of squares array
=end

# def solution(arr1, arr2)
#   squares = []
#   arr1.each_with_index do |el, i|
#     squares << (el - arr2[i])**2
#   end
#   squares.inject(:+) / squares.size.to_f
# end

# solution([1, 2, 3], [4, 5, 6])
# solution([10, 20, 10, 2], [10, 25, 5, -2])


=begin
input: big string
output: array of the top 3 most occuring words in descending order of frequency

rules: 
    A word is a string of letters (A to Z) optionally containing one or more apostrophes (') in ASCII.
    Apostrophes can appear at the start, middle or end of a word ('abc, abc', 'abc', ab'c are all valid)
    Any other characters (e.g. #, \, / , . ...) are not part of a word and should be treated as whitespace.
    Matches should be case-insensitive, and the words in the result should be lowercased.
    Ties may be broken arbitrarily.
    If a text contains fewer than three unique words, then either the top-2 or top-1 words should be returned, or an empty array if a text contains no words.

mental model: create a hash with default val of 0. iterate over all words in the text incrementing the hash value by one for each time 
a word is encountered. then convert the hash to an array, sort the array by the count, take the 3 sub arrays with highest counts and return 
a final array containing only the string elements ordered by their counts. 

how to define a word, any non alpha or " ' " character should be changed to a space character before splitting passage into words

algorithm:
- downcase the text
- change any non-alpha or apostrophe character into a space character
- set `words` spliting the passage into invidual words by ' '
- set `word_counts` to a hash with 0 for default value
- iterate over `words` incrementing word_counts by one for the current word in the iteration
- reassign word_counts to an array
- sort word_counts by their count value
- take the 3 subarrays with the greates count vals (pay attention to asc, or desc order and how many subarrays actually exit (i.e. could be less than 3))
- sort sub arrays in desc order of frequence and return an array containing on the string elements of the subarrays.

=end


# def top_3_words(text)
#   text = text.downcase
#   text = text.gsub(/[^a-z']/, ' ')
#   words = text.split
#   words = words.select do |word|
#     word.chars.any? {|char| ('a'..'z').include?(char)}
#   end

#   word_counts = Hash.new(0)

#   words.each do |word|
#     word_counts[word] += 1
#   end
#   word_counts = word_counts.to_a
#   word_counts = word_counts.sort_by { |sub_arr| sub_arr[1] }.reverse
#   word_counts.slice(0,3).map {|subarr| subarr[0]}
# end


# p top_3_words("In a village of La Mancha, the name of which I have no desire to call to
#   mind, there lived not long since one of those gentlemen that keep a lance
#   in the lance-rack, an old buckler, a lean hack, and a greyhound for
#   coursing. An olla of rather more beef than mutton, a salad on most
#   nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
#   on Sundays, made away with three-quarters of his income.")


=begin
input: url as a string
output: domain
rules: doesnt necessarily end in '.com' 

mental model: after a codon finishes then extract the string that starts 1 index postion after codon finish until a '.' is encountered
  how to identify codon: find the index where the codon finishes. if you know which codon it contains, then you know the length and therefore know where the domain starts

mental model2: build a string from the characters of the original string checking that built string matches one 
of the potential codons after appending each character. once a match is found, flip a flag, if flag is flipped then 
start building another string until the character 1 to the right of the current character is a '.'


algorithm
- set char_arr to chars of string
- set codons to array of potential codons
- set onset_str to an empty string
-set codon_end to 0
- set domain to empty string
- iterate over char_arr elements appending them to onset_str, check that codons contain onset string after each appendage, set codon_end to current index when found and break
- iterate over a substr of string (starting at codon_end + 1) appending each character of substr to domain break if currenct char is '.'
- return domain
=end


# def domain_name(str)
#   char_arr = str.chars
#   codons = ['www.', 'http://', 'https://']
#   onset_str = ''
#   codon_end = 0
#   domain = ''

#   char_arr.each_with_index do |char, i|
#     if codons.include?(onset_str)
#       codon_end = i
#       break
#     else
#       onset_str << char
#     end
#   end
#   char_arr[codon_end..].each do |char|
#     return domain if char == '.'
#     domain << char
#   end
# end


# p domain_name("http://github.com/carbonfive/raygun")


=begin
input: two integers
output: integer (first power raised to power of the second)

rules: cannot use ** operator, return nil if the second argument is negative

mental model: create an array with n occurences of x then reduce using *
=end

# def power(base, exp)
#   return nil if exp < 0
#   return (base * 1/base) if exp == 0
#   return 0 if base == 0
#   Array.new(exp, base).reduce(:*)
# end

# p power(2,3)
# p power(2,1)

=begin

- look for a 3 character string which is either ww. or  ://, once found then begin a loop which 
  will add the following characters to a string until a period is encountered at which point it will 
  return the built string
  # algorithm: 

=end

# def domain_name(url)
#   codons = ['ww.', '://']
#   counter = -1
#   domain = ''
#   url.chars.each_cons(3) do |triplet|
#     triplet = triplet.join
#     counter += 1
#     next unless codons.include?(triplet)
#     url.slice((counter + 3)..).each_char do |char|
#       return domain if char == '.'
#       domain << char
#     end
#   end
# end

# p domain_name('http://google.com')

=begin
input: string
output: string with 5+ letter words reversed

algorithm:
- split words into an array
- for each word, if its 5 or more chars 
  - then split it into an array
  - reverse the array
  - join the array back into a string
- if less than five words do nothing
- return modified string


=end

# def spin_words(string)
#   string.split.map do |word|
#    word.chars.length >= 5 ? word.chars.reverse.join : word
#   end.join ' '
# end

# p spin_words('This is another test')


=begin
input: string and string array
output: an array with all anagrams or an empty array if there are none

anagram must contain all the same letters as the target word

algorithm:
- compare each word in the array to the target
  - SET `target` to  a char array of the target word and sort it
  - for each comparison word
    - split the comparison word into a char array and sort it
    - compare the two char arrays for equivalency
    - if equivalent save the comparison word (not the char array) otherwise move to the next comparison word
return the array of comparison owrds which are anagrams
=end

# def testAnagrams(target, comp_arr)
#   target = target.chars.sort
#   comp_arr.select do |comp|
#     comp.chars.sort == target
#   end
# end



=begin
input: a string
output: string 

rules: 
-first and last alpha characters stay in same position but all alpha chars in between must be sorted alphabetically
- punctuation remains in original position

assumptions: 
- words seperated by a space only
- only - ' , . count as punctuation
- ignore capitilization


mental model: save the first and last alpha chars to an array. get a substring of remaining characters and save the position
of any punctuation so it can be reinserted later. sort the substring alphabetically and remove any punctuation. reinsert the punctuation in correct positions
append and prepend first and last alpha chars to sorted substring and return it

algorithm: 
-set `out_str` to an empty array
for each word in the string
- set `first_last` to an array containing those chars
- set punct_pos to the punct chars and their positions of any punctuation chars in the substring (i.e. doesnt have first or last chars)
- remove the punctuation fro mteh substring
- sort the substring
- reinsert punct at correct positions
- join together sorted string and first_last and append to `out_str`


=end

# def scramble_words(words)
#   words = words.split ' '
#   out_str = []

#   words.each do |word|
#     word = word.chars
#     first_last = get_first_last(word)
#     word.slice()
#     out_str << my_sort(word).unshift(first_last[0]).append(first_last[1]).join
#   end
#   out_str.join ' '
# end

# # need a method which stores first and last only if they are alpha chars
# # algorithm
# def get_first_last(string)
#   chars = string.chars
#   first = chars.find_index {|x| ('a'..'z').to_a.include?(x.downcase)}
#   last = chars.reverse.find_index {|x| ('a'..'z').to_a.include?(x.downcase)}
#   [first, last]
# end




# def my_sort(word)
#   punct_pos = []
#   sub_str = []

#   word.each_with_index do |sub_char, i|
#     if "'-,.".chars.include?(sub_char)
#       punct_pos << [sub_char, i]
#     else
#       sub_str << sub_char
#     end
#   end

#   sub_str = sub_str.sort

#   punct_pos.each do |sub_arr|
#     sub_str.insert(sub_arr[1], sub_arr[0])
#   end
#   sub_str
# end


# p scramble_words("got'ta dan'ce")


=begin
input: string
output: array [substr, n]

rules: dont worry about capitalization

mental model: starting at 0 index build a substring of increasing lenghts and split the string according to the length of the 
substring. Check that all chunks are the same.

you will need two loops/enum, the outer loop for starting index and inner loop for substring length. inner loop splits the string up

algorithm
- for each index 
  - set 'substr' to a string of length (length) 1 starting at index i
  - get an array of substrings by splitting the original string every `length` characters
  - check that all subarrays are equal to the substr
    - if all are equivalent return an array [substr, string.length/ `length`]


=end


# def f(string)
#   substr = ''
#   0.upto(string.length - 1) do |i|
#     1.upto(string.length) do |length|
#       substr = string.slice(i, length)
#       p substr
#       chunked_arr = []
#       string.chars.each_slice(length) {|sub_arr| chunked_arr << sub_arr.join }
#       p chunked_arr
#       if chunked_arr.all? {|sub| sub == substr}
#         return [substr, string.length / length]
#       end
#     end
#   end
# end


=begin 


reqs:
input: string
output: string

Requirement
    the first and last characters remain in original place for each word
    characters between the first and last characters must be sorted alphabetically
    punctuation should remain at the same place as it started, for example: shan't -> sahn't

Assumptions
    words are seperated by single spaces
    only spaces separate words, special characters do not, for example: tik-tak -> tai-ktk
    special characters do not take the position of the non special characters, for example: -dcba -> -dbca
    for this kata puctuation is limited to 4 characters: hyphen(-), apostrophe('), comma(,) and period(.)
    ignore capitalisation


=end


=begin
input: array of single letters
output: boolean

reqs: return true if the directions return you to your starting place and only take ten minutes.

mental model: you are moving in a two dimensional space so use x y coordinates

algorithm: 
- check that there were only 10 elements in the original array, return false if not
- set x and y = 0
- for each letter in the array increment or decrement x or y depending on the letters value.
- after iterating, check that x == 0 and y == 0

=end

# def is_valid_walk(arr)
#   return false if arr.length != 10
#   x = 0
#   y = 0
#   arr.each do |dir|
#     if ['n', 's'].include?(dir)
#       up_or_down = dir == 'n' ? 1 : -1
#       x += up_or_down
#     else
#       left_or_right = dir == 'e' ? 1 : -1
#       y += left_or_right
#     end
#   end
#   [x,y].all? { |a| a == 0 }
# end



# p is_valid_walk(['n','s','n','s','n','s','n','s','n','s'])


=begin
input: integer
output: string of the integer in expanded form

mental model: create an array of all the integers needed for each 10's spot. then past it all back together in to a string

algorithm:
- create an array of 10's positions based on the number of digits in the integer 
- for each of the positions take the modulus of the (integer - out_arr.sum) and store that in a out_arr
- remove all zeros from out_arr
- paste the out array integers into a string
=end

# def expanded_form(num)
#   tens_positions = []
#   1.upto(num.digits.size) do |x|
#     tens_positions << ('1' + '0' * x).to_i
#   end

#   out_arr = [0]
#   tens_positions.each do |position|
#    mod = (num - out_arr.inject(:+)) % position
#    out_arr << mod unless mod == 0
#   end

#   out_arr.shift
#   out_arr.map {|x| x.to_s}.reverse.join ' + '

# end

# p expanded_form(156)


# def char_count(str)
#   str.chars.group_by {|x| x}.map {|k,v| [k, v.length]}.to_h
# end

# p char_count('aabbccc')

=begin
input: 2d array
output: array where [0] is the index of the subarray containing the bomb(row) 
  and the [1] is the index within the subarray holding the bomb(column)

params: 2d array will always be square and only ever 1 mine in each grid


algorithm:
iterate over the rows seaching for the bomb. when you have found the bomb, return the row and column indexes



=end


# def mineLocation(grid)
#   grid.each_with_index do |row, row_i|
#     col_i = row.find_index {|x| x == 1}
#      return [col_i, i] if col_i
#   end
# end

=begin
input: string
output: longest alphabetical substring

considerations: input will always b lowercase and at least 1 char long, though can be very very long
rules: if multiple solutions, return the oone that appears first

mental model: two loops, outer loop controls strting index. inner loop builds the substring. store the substr if it
is longer than the longest substr on each inner loop iteration. if the next character is not in alphabetical order break the loop 
and move up by one index starting position

algorithm:
- iterate over starting indexes beginning with 0 until the length of the longest substr so far 
  is longer than the substring beginning with the current starting index until the end of the string.
  - build a substring one character at a time, checking it against the longest substring after each char addition
  - if the next char to be added is not in alphabetical order the break the loop and move to the nexter iteration of the outer loop
- return the longest substring when outer loop exits
=end

require 'pry-byebug'

# Works but isnt efficient
# def longest(str)
#   return str if str.size == 1
#   start = 0
#   longest = str[0]
#   while longest.length <= str.length - (start + 1) do
#     beginning_substr = str[start..-1].chars
#     cur_itrtn_max_length = longest_for_starting_i(beginning_substr)
#     # p cur_itrtn_max_length
#     longest = beginning_substr.slice(0, cur_itrtn_max_length) if longest.length < cur_itrtn_max_length
#     start += cur_itrtn_max_length
#   end
#   longest.size > 1 ? longest.join : longest
# end

# # return the length of the longest possible alphabetically sorted substring
# def longest_for_starting_i(input_str)
#   out = 1
#   0.upto(input_str.size - 1) do |i|
#     return i  + 1 if (input_str[i] <=> input_str[i + 1]) == 1 || input_str[i + 1].nil?
#   end
#   out
# end



# def longest(str)
#   str_length = str.length
#   return str if str_length == 1
#   start = 0
#   cur_itrtn_max_length = 0
#   longest = 1
#   while longest <= str_length - (start + 1) do
#     start += cur_itrtn_max_length
#     beginning_substr = str[start..-1].chars
#     cur_itrtn_max_length = longest_for_starting_i(beginning_substr)
#     longest = cur_itrtn_max_length if longest < cur_itrtn_max_length
#   end
#   # binding.pry
#   str.slice(start, longest)
#   # p out_str
#   # out_str.size > 1 ? out_str.join : out_str
# end

# # return the length of the longest possible alphabetically sorted substring
# def longest_for_starting_i(input_str)
#   out = 1
#   0.upto(input_str.size - 1) do |i|
#     return i  + 1 if (input_str[i] <=> input_str[i + 1]) == 1 || input_str[i + 1].nil?
#   end
#   out
# end

# p longest('nab')
# p longest('asd')
# p longest('asdfaaaabbbbcttavvfffffdf')
# p longest('abcdeapbcdef')
# p longest('asdfbyfgiklag')
# p longest('z')
# p longest('zyba')




=begin
input: string
output: array of character pairs. if odd # of chars then insert a '_' for the last (missing) char



algorithm:
- check that # of chars as even or odd
- if odd then append a '_' to the end fo the string
- split the string in an array or 2char sub arrays
=end



# def solution(str)
#   str = str.chars
#   str.push '_' if str.length.odd?
#   out_arr = []
#   str.each_slice(2) {|x| out_arr << x.join}
#   out_arr
# end

# p solution('hello')



=begin
input: two strings
output: integer (how many to rmeove in order to make anagrams)

rules: dont worry about case, strings can be empty, if both empty then return 0

mental model: take the intersection of the unique characters for each string. then remove the in common 
suprlus characters from each string (i..e kk to k if both avhve k but one has 2 k's)[CHALLENGE]
SUBROUTINE: for each string, get character counts after you have the in common characters only. then
compare string 1 to string 2 and if str1 char count - str2 char count is greater than 0, decrement that
characters count in string 1 if less than 0 do the same but for string 2 instead

store the result from the previous step and compare their char lengths to the originals and sum the difference.

algorithm:
-take the intersection of the unique characters for each string.
- SUBROUTINE
  - get character counts for each string
  - set `difference` to 0
  - compare the character counts for each string and increcment difference by the absolute value of the difference
- add difference to difference in lengths between the uniq char array and the original strings

- flatten w1 and w2 chars and increment a counter every time you find a character not included in in_common



===== NEW APPROACH =====  
mental model:
get an array of all the characters from both words and remove anydupes such that it is unique
then for each character in the this array, get the count of that character in each word and find the differenc
increment a counter with this difference on each iteration




=end


# def anagram_difference(w1, w2)
#   in_common = (w1 + w2).chars.uniq
#   difference = 0
#   in_common.each do |char|
#     difference += (w1.count(char) - w2.count(char)).abs
#   end

#   difference
# end

# #   w1_counts.each_pair do |k, v|
# #     difference += (v - w2_counts[k]).abs
# #   end

# #   counter = 0
# #   (w1.chars + w1.chars).each {|x| counter += 1 if !(in_common.include?(x))}

# #   counter + difference

# # end


# p anagram_difference('', '')
# p anagram_difference('a', '')
# p anagram_difference('', 'a')
# p anagram_difference('ab', 'a')
# p anagram_difference('ab', 'ba')
# p anagram_difference('ab', 'cd')
# p anagram_difference('aab', 'a')
# p anagram_difference('a', 'aab')
# p anagram_difference('codewars', 'hackerrank')


=begin
input: string
output: string (word)

considerations: each letter scores point according to posiition in alphabet

rules: returns the highest scoring words (first word in event of tie)

algorithm:
- split the sentence into words
- set a hash constant with values for each alpha character
- iterate over the words from the sentence 
  - split the word into characters incrementing a counter with the score for each character
  - when finished scoring the characters for the word, compare the word against the max_val 
      store the word and its score if it is greater than max_val
return the 



=end

# CHAR_VALS = ('a'..'z').to_a.zip((1..26).to_a).to_h

# def high(str)
#   words = str.split
#   max_val = 0
#   max_word = ''

#   words.each do |word|
#     cur_score = 0
#     word.each_char { |char| cur_score += CHAR_VALS[char] }
#     if cur_score > max_val
#       max_val = cur_score
#       max_word = word
#     end
#   end
#   max_word
# end



=begin
input: hash (pockets, key is name and value is array of pocket contents) and integer array (allowed items)
output: array (of suspect name as symbols)

pockets can be empty or nil
if no suspects, or pockets == nil then the method should return nil

mental model: check each persons contents against the allowed items. if persons pocket contents
 are included in the allowed set then move to the next person, otherwise append their name to a list of suspects
 return the list of suspects

 algorithm:
 - set `suspects` to an empty array
 - iterate over the `pockets` object, checking the value (array) of each key against the set of allowed items
  - if all contents are inclduded in the set of allowed items move to next person
  - otherwise, append the persons name to `suspects`
- return suspects (if empty then return nil)
=end


# def find_suspects(pockets, allowed_items)
#   suspects = []
#   pockets.each_pair do |name, contents|
#     next if contents.nil? || contents.all? {|pocket_item| allowed_items.include?(pocket_item)}
#     suspects << name
#   end
#   suspects = nil if suspects.empty? || pockets.nil?
#   suspects
# end

# p find_suspects({ julia: nil, meg: [] }, [1,6])


=begin
input: a lowercase string (might be empty)
output: an array of strings in which one letter is capitalized in each array item (its al lthe same owrd)

considerations: any whitespace should be treated as an empty seat (ie skip the white space and capitalize the next non whitespace character)
mental model: for each character in the word, add the word to an array making sure that the appropriate letter is capitalized for that word

algorithm: 
- set `out_arr` to an empty array
- for each index in the string
  -skip to the next index if it is white space
  - otherwise capitalize the letter in the string at the current index and add the modified string to an out array
=end



# def wave(str)
#   out_arr = []
#   str.chars.each_with_index do |char, i|
#     chars_arr = str.chars
#     next if str[i] == ' '
#     chars_arr[i] = char.upcase
#     out_arr << chars_arr.join
#   end
#   out_arr
# end


=begin
input: an integer
output: sum of all multiples of 3 or 5 that are LESS than n


algorithm:
- for 1 up to n/3 (integer division) multiply i by 3 and append result to an multiples array
-for 1 up to n/5 (integer division) multiply i by 5 and append result to an multiples array
- make multiples array unique and return the sum of all elements

=end

# def solution(n)
#   return 0 if n < 0
#   n = n -1
#   multiples = []
#   1.upto(n/3) {|i| multiples << i * 3}
#   1.upto(n/5) {|i| multiples << i * 5}

#   multiples.uniq!
#   multiples.inject(:+)
# end


=begin
inputs: a string of words (can contain leading and trailing spaces)
output: a string in which the case of each character has been flipped and the order of the 
  words in the sentence are reversed.

mental model: cut the string into an array of words and reverse it. iterate through the words 
splitting the characters up into an array. have the characters flow through some logice to determine
if they should be updcased or downcased. the characters can return to the loop above them as an array or a joined word.
  then join all the words together into a string and return it

algorithm:
- set `words_arr` to a split of the supplied string and reverse it.
- using a method that will return an array, iterate through the words, for each word:
  - split it into an array and iterate through the character changing them as necessary (subroutine)
  - return the word to the upper iterator so it can be returned along with all the other words into an array 
- join the array and return it


How to preserve spaces?
- save their index in original string
- save their index in a reversed string
=end

# def string_transformer(str)
#   space_indexes = []
#   str.chars.reverse.each_with_index do |char, i|
#     space_indexes << i if char == ' '
#   end

#   words_arr = str.split(' ').reverse
#   modified_words = words_arr.map do |word|
#    changed_word = word.chars.map do |char|
#       change_char(char)
#     end
#     changed_word.join
#   end
#   collapsed_str = modified_words.join
#   space_indexes.each do |i|
#     collapsed_str.insert(i, ' ')
#   end
#   collapsed_str

# end


# def change_char(char)
#   if ('a'..'z').include?(char)
#     char.upcase
#   elsif ('A'..'Z').include?(char)
#     char.downcase
#   else
#     char
#   end
# end

# p string_transformer('Example there   string')

=begin
input: str ( can contain '(' or ')' in the inputs itself)
output: str of  ( )

rules: character is represented by '(' if it appears only onc ein the input and ')' otherwise. up and dowcase are counted as same character
mental model: 

algorithm:
- downcase the input str and save it
- get a count of all the characters that appear and store it
- iterate over the original string character by character
  - look up up the value for that characters occurence count and append a ( or ) accordingly to an out_str.

=end

# def duplicate_encode(word)
#   word = word.downcase
#   char_counts = Hash.new(0)

#   word.chars.uniq.each do |char|
#     char_counts[char] = word.count(char)
#   end
  
#   out_str = ''
#   word.chars.each do |char|
#     count = char_counts[char]
#     char_to_append = count < 2 ? '(' : ')'
#     out_str << char_to_append
#   end
#   out_str
# end


# p duplicate_encode('recede')

=begin
input: string
output: string with characters preceding a '#' and the '#' char itself removed




-algorithm:
iterate over the string until there are no remaining '#' characters.
- pass the string to a method which return the same string with the first deletable character removed.
- save this string to an objec tto be passed into that method on the next iteration.

subroutine:
iterate over the string appending characters to an out_str
- for each character, if the character, or the one following it is a '#' then flip a flag and skip that iteration
  - on the next iteration the code sholdn't bother to care if theres a '#' because the flag will be fliped.
- return the string
=end

def clean_string(str)
  cur_chars = str.chars
  until cur_chars.none? {|char| char == '#'} do
    cur_chars = single_backspace(cur_chars)
  end
  cur_chars.join
end

# def single_backspace(to_condense)
#   backspace_index = to_condense.index('#')
#   out_arr = []
#   to_condense.each_with_index do |char, i|
#     out_arr << char unless [backspace_index, backspace_index - 1].include?(i)
#   end
#   out_arr
# end



# #   out_str = []
# #   one_skipped = false
# #   to_condense.each_slice(2) do |set| 
# #     if set[1] == '#' && !one_skipped
# #       one_skipped = true
# #       next
# #     else
# #       out_str << set[0] 
# #     end
# #   end
# #   out_str
# # end


# p single_backspace('abc#d##a'.chars)
# p clean_string('abc#d##c')

=begin
input: array of strings
output: sorted array

q's: how to handle string of only space characters or empty strings? how to handle ties?

thoughts: I could attach an id to each word so that I can sort using only lowercase 

=end

# def sortme(strings)
#   strings.sort do |a, b|
#     a.downcase <=> b.downcase
#   end
# end

# p sortme(["Hello", "there", "I'm", "fine"])


=begin
input: array of integers
output: an integer such that it plus the sum of the array equals the near prime greater than the sum of the array

rules:
List size is at least 2 .
List's numbers will only positives (n > 0) .
Repetition of numbers in the list could occur .
The newer list's sum should equal the closest prime number . 


mental model: increment the sum of the array by 1 until it is a prime number. Then, return the difference between the prime 
and the array sum. 
-to find a prime add 1 until the modulo of the number and 2 is not 0

=end


# def minimum_number(numbers)
#   n = numbers.inject(:+)
#   n += 1 until is_prime(n)
#   n - numbers.inject(:+)
# end

# def is_prime(integer)
#   integer % 2 != 0 && (integer+1) % 2 == 0
# end

# p minimum_number([3,1,2])

#   #  n += 1 until [2, 3].all? { |x| n % x != 0 } if n < 4
#   # loop do
#   #   n += 1
#   #   prime = [2, 3, 5, 7].all? do |x|
#   #     div, remain = n.divmod(x)
#   #     div > 0 && remain != 0
#   #   end
#   #   break if prime
#   # end


=begin
input: string
output: integer of how many characters (alpha numeric) occur at least twice in the string


algorithm: 
- create a list of character counts
- filter the list to only those which hhave 2 or greater
- return the length of that new list
=end
# def duplicate_count(str)
#   str = str.downcase
#   unique_chars = str.chars.uniq
#   char_counts = unique_chars.map { |char| [char, str.count(char)] }
#   char_counts.select {|sub_arr| sub_arr[1] > 1}.size
# end

# p duplicate_count('abcdeaa')

=begin 
input: as string of only alpha characters
output: those same characters sorted alphabetically (ignore but do not modify case) and any whitespace removed

rules: input is only alpha character, remove whitespace, case insensitive

algorithm:
- convert string to an array of characters and remove any white space
- sort the array according to the downcase version of each character
join the array and return it

=end

# def alphabetized(str)
#   alpha_chars = ('a'..'z').to_a + ('A'..'Z').to_a
#   chars = str.chars.select {|x| alpha_chars.include?(x)}
  
#   chars.sort_by {|char| char.downcase}.join ''
# end


# p alphabetized('A b B a')
# p alphabetized('!@$%^&*()_+=-`,')

=begin
input: integer (positive)
output: integer (recursive sum)

algorithm
- set `cur_val` to input integer
- until current val is < 10 
  - put integer's digits into an array
  - set current val to sum of the array
return current_val


=end


# def digital_root(n)
#   cur_val = n
#   until cur_val < 10
#     cur_val = cur_val.digits.inject(:+)
#   end
#   cur_val
# end

# p digital_root(132189)


=begin
imput: integer
output: 8 pointed star in an nxn grid
rules: 
- all lines beside the middle line (m) contain three stars
- lines 1 and n begin and end with a star
- lines m, m -1, and m + 1 have no spaces between stars
- lines have (x - 1) / 2 ' ' characters between stars where
  x is the distance from the middle line (m) (this is called k) 
- the number of ' ' characters before and after the star sequence is equal to
  (n - k - 3) / 2
- line m has n stars and no white space

challenges: 
- finding a line's distance from middle line (m)
- printing each line (i.e. math and formatting)
- printing lines in correct order (highest level, others are subroutines)
  - could iterate over an array of distances from line (m)
  - or could do n/2.downto(1), print m, 1.upto(n/2)

=end

def star(n)
  (n / 2).downto(1) do |x|
    print_line(x, n)
  end
  puts "*" * n
  1.upto(n / 2) do |x|
    print_line(x, n)
  end
end


# def print_line(line_num, n)
#   between_stars = ' ' * (line_num - 1)
#   appending_spaces = ' ' * ((n - 3 - ((line_num - 1)*2)) / 2)
#   puts concat_line(appending_spaces, between_stars)
# end

# def concat_line(appending_spaces, between_stars)
#   appending_spaces + '*' + between_stars + '*' + between_stars + '*' + appending_spaces
# end

# star(7)
# puts ' '
# star(9)

=begin
input: next array (3x3 matrix)
output: 3x3 matrix transposed

rules: take care not to modify the original matrix

mental model: access the the id (row and col index) of each element, then switch those indexes and assign 
the object (i.e. the integer) to the position described by the new id. 

challenges: accessing elements while not modifying the object you are getting the element id from. 
solve: create an empty 3x3 matrix to insert objects as you go so as nto to modify the original


algorithm:
- set `out_matrix` to an empty 3x3 matrix
- iterate over the subarrays in the original matrix
  - iterate over the sub array elements
    - store the row index and element (i.e. column) indexes for the current element
    - switch the row and col indexes
    - set the value of the out_matrix at the new row and col indexes t othe current object (i.e. integer)
- return `out_matrix`
=end


=begin

challenges: 
- must understand the dimensions of the input matrix
- switch the dimmensions (i.e the length of the subarrays in the original become the number of subarrays
  and the number of subarrays in the original become the length of the subarrays)
- putting the elements in the correct positions

new line PEDAC
input: matrix, and its width and height
output: a transposed row for the new matrix




=end

# def transpose(matrix)
#   width = matrix[0].size

#   out_matrix = []
#   width.times do |col_i|
#     new_row = []
#     matrix.each do |row|
#       new_row << row[col_i]
#     end
#     out_matrix << new_row
#   end
#   out_matrix
# end

# p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
# p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
# p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
#   [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
# p transpose([[1]]) == [[1]]


  # height.times {|_| out_matrix << ['','','']}

  # matrix.each_with_index do |subarr, row_i|
  #   subarr.each_with_index do |element, col_i|
  #     out_matrix[col_i][row_i] = element
  #   end
  # end


=begin
input: matrix
output: matrix rotated 90 degrees to the right (clockwise)

challenges: 
- determing which col each row becomes-- perhaps iterater over the original rows in reverse
=end

# def rotate90(matrix)
#   width = matrix[0].size

#   out_matrix = []
#   width.times do |col_i|
#     new_row = []
#     matrix.reverse_each do |row|
#       new_row << row[col_i]
#     end
#     out_matrix << new_row
#   end
#   out_matrix
# end

# matrix1 = [
#   [1, 5, 8],
#   [4, 7, 2],
#   [3, 9, 6]
# ]

# matrix2 = [
#   [3, 7, 4, 2],
#   [5, 1, 0, 8]
# ]

# new_matrix1 = rotate90(matrix1)
# new_matrix2 = rotate90(matrix2)
# new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

# p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
# p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
# p new_matrix3 == matrix2

# def my_method(array)
#   if array.empty?
#     []
#   elsif array.size > 1
#     array.map do |value|
#       value * value
#     end
#   else
#     [7 * array.first]
#   end
# end

# p my_method([])
# p my_method([3])
# p my_method([3, 4])
# p my_method([5, 6, 7])



=begin
input: two arrays
output: a sorted array containing all elements from both inputs AND dont mutate the inputs

rules: must build result array in order, 1 peice at a time

mental model:

- make copies of each array 
- sort those copies as you know how
- `out_arr` to an empty array
- iterate over the arrays until they are both !!!empty!!!; for each iteration
- check either are empty, if not skip to next step, otherwise:
  - determine which one is empty and append all the remaining values in the non empty array to the out_arr
  - compare the first element of arr_a and arr_b and shift off the lesser value from its array
      and append it to out_arr

- return out arr


challenges:  what to do if an input is an empty arr
=end


def merge(arr1, arr2)
  arr1 = arr1.clone.sort
  arr2 = arr2.clone.sort

  out_arr = []
  loop do 
    if arr1.empty? || arr2.empty?
      to_append = arr1.empty? ? arr2 : arr1
      out_arr << to_append
      break
    end

    to_append = arr1[0] > arr2[0] ? arr2.shift : arr1.shift
    out_arr << to_append
    break if arr1.empty? && arr2.empty?
  end

  out_arr.flatten
end

# p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
# p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
# p merge([], [1, 4, 5]) == [1, 4, 5]
# p merge([1, 4, 5], []) == [1, 4, 5]


=begin
input: array
output: sorted array

rules: must break elements down into their own single element arrays

challenges: at its core the method should break an array into two sub arrays and return a single sorted array
- break condition for recursivity: if the array being attempted to split contains only 1 elements then return that element
- 
- 
- should there be a difference in handling between a string array or an integer array? 
- breaking the array down until every element is in its own array
- recombining elements into larger arrays
- putting the elements in the right spot as you build the bigger array

algorithm: 
- return the input array if it cannot be split further
- split the input arrays into two subarrays
- supply these two subbarrays to the merge method and return the result
- sort the two subarrays into a single sorted array and return it


SUPPOSED TO BE RECURSIVE
mental model: break the array down such that each element is in it own array (use map?)
then use the merge method from prev exercise to build new array

=end

# def merge_sort(input_arr)
#   return input_arr if input_arr.size == 1

#   midpoint = input_arr.size / 2
#   length = input_arr.size.odd? ? midpoint + 1 : midpoint
#   arr1 = input_arr.slice(0, midpoint)
#   arr2 = input_arr.slice(midpoint, length)
  
#   merge(arr1, arr2)
# end

# p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
# p merge_sort([5, 3]) == [3, 5]
# p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
# p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
# p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]



=begin
input: a Rational number
output: an array of denominators of rational numbers of whose fractions all sum to the input 


challenges:
- how to keep trak of denominators
- how to determine which fraction can be used next


algorithm:
- set `denom` to 1
- set denom_arr to empty array
- set current_sum to 0
 
- loop
  - if Rational(1, denom) + current_sum is less than or equal to input
    - append denom to denom_arr
    - increment current_sum by Rational(1, denom)
  - increment denom by 1
  - return denom_arr if current_sum is equal to input
end
=end


# def egyptian(input)
#   denom = 1
#   denom_arr = []
#   current_sum = 0
#   loop do
#     if Rational(1, denom) + current_sum <= input
#       denom_arr << denom
#       current_sum += Rational(1, denom)
#     end
#     break if current_sum == input
#     denom += 1
#   end
#   denom_arr
# end

# p egyptian(Rational(2, 1))    # -> [1, 2, 3, 6]
# p egyptian(Rational(137, 60)) # -> [1, 2, 3, 4, 5]
# p egyptian(Rational(3, 1))   # -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]


# def unegyptian(arr)
#   sum = 0
#   arr.each do |denom|
#     sum += Rational(1, denom)
#   end
#   sum
# end

# p unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
# p unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
# p unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
# p unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
# p unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
# p unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
# p unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
# p unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)

=begin
input: two array
output: array a with all elements occuring in array b removed

rules: all occurences of an eleembent from b must be removed from a (including dupes)

algorithm: 
-set `out_arr` to empty array
- iterate over array1 
  - go to next iteration if current element is present in arr2 
  - otherwise, append it to out_arr
=end

# def array_diff(arr1, arr2)
#   out_arr = []
#   arr1.each do |el|
#     next if arr2.include?(el)
#     out_arr << el
#   end
#   out_arr
# end

# p array_diff([1,2], [1])

# def longest(str)
#   chuncked = str.chars.chunk_while do |a, b|
#     a <= b
#   end
#   chuncked.sort_by {|x| x.size * -1}.first.join
# end

# p longest('abcdeapbcdef')

=begin
input: str
output: str where word order is reversed and case is switched 
rules: must preserve leading and trailing whitespace

algorithm:
- set `words` to the split the string into words based on when a ' ' follows an
  alpha character
- iterate over words changing the case of each character
- reverse the changed words array and join into a single string (join by '')

=end


# def string_transformer(str)
#   words = str.chars.slice_when do |a, b|
#     a == ' ' || b == ' '
#   end
#   p words.to_a
#   words.map do |word|
#     word if word == ' '
#     word.map do |char|
#       ('a'..'z').include?(char) ? char.upcase : char.downcase
#     end.join''
#   end.reverse.join''
# end

# p string_transformer('Example string')

=begin
input: string
output: string with some chars removed

mental model: split the string into characters. iterate over the string deleting whatever
character comes before the first '#' you encounter. save the string as it is having removed 
the character and '#' and repeat until there are no more '#' characters. then join the final array and return

challenges: 
- use none? to determine when no more '#' occur in the string
- removing the character preceding a '#'
- removing the '#' character
- saving the word appropriately on each iteration
- **what if the '#' occurs at the beginning of a string?

algorithm:
-split into characters
-chunk when a = a-z and b = '#'
-reject arrays with patter [alpha, #]
-flatten array
-repeat the process until no more '#' exist
=end

# ALPHA = ('a'..'z').to_a
# def clean_string(str)
#   chars = str.chars

#   while chars.any? {|char| char == '#'}
#     chars.shift while chars.first == '#'

#     chunks = chars.slice_before do |a, b|
#       ALPHA.include?(a.downcase) || b == '#'
#     end

#     chars = chunks.map do |arr|
#       next arr.slice(2..arr.size) if ALPHA.include?(arr[0]) && arr[1] == '#'
#       arr
#     end.flatten
#   end
#   chars.join
# end

# p clean_string('abc#d##c')
# p clean_string('abc####d##c#')    
# p clean_string('##abc####d##c############c#')    

=begin
input: 2 strings
output: integer

rules:
- integer must be the number of characters that must be deleted for the two string to 
  have the same characters (though most likely in a different order)
- all ipnuts will be lowercase

considerations:
- WILL BE SUPPLIED AN EMPTY STRING in some test cases

challenges:
- easy enough to delete chars from stringb to match string a but what about the other way around? 
  Answer: compare them to each other one at a time. or there might be a Array# method with preserves the intersection
- how to keep track of how many characters were deleted.
  answer: save the combined length of the original inputs and compare that to the length of what you get at the end.

algorithm:
- set `orig_length` to the length of the two inputs combined
- make the two inputs anagrams of each other
  - iterate over the characters in stringb preserving only those which are present in stringa
  - repeat the above for stringa
- compare the length of the combined anagrams wit hthe orig_length and return that integer

=end

# def anagram_difference(str1, str2)
#   orig_length = str1.size + str2.size
#   anagram = str1.chars.intersection(str2.chars)
#   p "anagram: " + anagram.join
#   orig_length - anagram.size*2
# end



# p anagram_difference('', '') == 0
# p anagram_difference('a', '') == 1
# p anagram_difference('', 'abdee') == 5
# p anagram_difference('ab', 'a')  == 1
# p anagram_difference('ab', 'ba') == 0
# p anagram_difference('ab', 'cd') == 4
# p anagram_difference('aab', 'a') == 2
# p anagram_difference('a', 'aab') == 2
# p anagram_difference('codewars', 'hackerrank') == 10
# p anagram_difference(%w(a b c d d d d d e f).join, %w(e e e f b z z z z).join)# == 13

# p anagram_difference('nxisilvzhilquqcisawtbgoytkbkaypyqzsuyzbkgkdjxiyubytqranrqyxhqpnszsisik',
#   'owonshddlizisywitbgmeoaxrpwodqebingtahhrquvlfyxujrljlqvutxmrvlhzaskmsn') 

=begin
input: string
output: string
rules:
-returned string must be in alphabetical order with capitalized letters occuring first (AaaBbCccccDd)etc
considerations:
- DONT FORGET ABOUT EMPTY STRINGS!
challenges:
- what order to sort thing in
mental model: isolate just the capitalized letters in an array `capitals` and sort it. iterate over that array,
finding the counts of the downcased version of that letter in the original string. append both capitalized letter and 
n number of downcased versions behind it. next iteration will be next alphabetical letter (from the original string)
=end

# def find_children(str)
#   return '' if str.empty?
#   capitals = str.chars.select {|char| char == char.upcase}.sort
#   out_arr = []
#   capitals.each do |char|
#     n = str.count(char.downcase)
#     out_arr << char << char.downcase * n
#   end
#   out_arr.join''
# end

# p find_children('abBA')

=begin
input: two integers: n and p
output: integer
rules: returned integer must be equal the digits of n taken to successive powers of p all over n, 
otherwise return -1
- n and p will always be positive integers
challenges:
- making sure the division result is a whole number (may need to use modulo)

algorithm:
- get an array of digits of n (put in correct order)
- set `sum_n` to 0
- set `power` to p
- iterate over the digit array increment sum_n by the result of the digit raised to the appropriate power
- increment power
- divide sum_n by n and return the result if its a whole number, otherwise return -1

=end

# def dig_pow(n, p)
#   digits = n.digits.reverse
#   sum_n = 0
#   power = p
#   digits.each do |digit|
#     sum_n += digit ** power
#     power += 1
#   end

#   div_result = sum_n.divmod(n)
#   div_result[1] == 0 ? div_result[0] : -1
# end

# p dig_pow(695, 2)

=begin
h = floor height original
each bounce reduces previous height by 1/3 (~h * 0.66)

inputs: h = floor height original; w = mothers window; b = bounce coefficient 
output: the number of times the mother will see the ball pass her window (including falling down and boucing up)
rules: if any of the booleans below return false the method returns -1
  - h > 0
  - 0 < b < 1
  - w < h
  - the ball is seen only if it bounces strictly *higher* than the window hieght

mental model: set a views variable to 1 (bc it will always be seen at least once on the inital drop)
until h is less than w set h to h*b and increment views by 2. then return views. 
=end

# def is_valid_trial?(h, b, w)
#   h > 0 && b > 0 && b < 1 && w < h
# end

# def bouncingBall(h, b, window)
#   return -1 unless is_valid_trial?(h, b, window)
#   # p b.class
#   views = 1
#   h *= b
#   until h <= window
#     views += 2
#     h *= b
#   end
#   views
# end

# p bouncingBall(3, 0.66, 1.5)

=begin
input: string
output: same string with odd indexed characters lower cased and even (inlcd 0) indexed characters upper cased
        index starts a 0 for each word

algorithm:
- split string into words, set to `words`
- iterate over words (map)
  - iterate over the indexes of the word
  - reassign the charact at index i in word to upper (even) or lower (odd) case depending on i
- join the words together and return the resulting string.

=end

# def weirdcase(str)
#   words = str.split
#   words.map! do |word|
#     out_word = ''
#     word.chars.each_with_index do |char, i|
#       to_append = i.odd? ? char.downcase : char.upcase 
#       out_word << to_append
#     end
#     out_word
#   end
#   words.join' '
# end

# def weirdcase(str)
#   i = 0
#   str.chars.each_index do |real_i|
#    str[real_i] = i.odd? ? str[real_i].downcase : str[real_i].upcase
#     i += 1
#     i = 0 if str[real_i] == ' '
#   end
#   str
# end

# a = 'Weird string case'
# puts "a before: #{a}"
# puts "String object id before: #{a.object_id}"



# p weirdcase(a)
# puts "a after: #{a}"
# puts "String object id after: #{a.object_id}"

=begin
input: an array
output: a hash containing the unique array elements as keys and their # of occurences as values

questions: 
- is it always digits? 
- what about an array full of empty strings? Is that considered empty input?

rules:
- empty or nil input should return nil
- the count and length methods are disallowed

algorithm:
- return nil if input is empty or nil
- set `counts` to a hash with a default value of zero
# - set `unique` to an array of unique elements from input array
- for every element in the input array
  - increment its hash value by 1
- return counts


=end

# def group_and_count(input)
#   return nil if input.empty? || input == nil
#   counts = Hash.new(0)
#   input.each do |elt|
#     counts[elt] += 1
#   end
#   counts
# end

=begin
input: hash (key = rank; value = honor)
output: integer (rank of person with closest diff betwween honor and rank)

rules:
- if there is a tie, return the one with the lowest rank 

questions: how to treat an empty hash?

algorithm: 
- set `smallest_diff` to the max value of the keys in the input hash
- set `users` to an empty array
- iterate over the input hash
  - set `usr_diff`  to the difference between the user's rank and honor
  - set users to empty array if usr_diff is less than smallest_diff 
  - set smallest_diff to usr_diff if usr_diff is equal to or less than smallest_diff
  - append the current key and value as an array to `users`
- sort users by their rank (ie 0 index of the subarray)
- return the first element of the first subarray in users

=end

# def nexus(input)
#   smallest_diff = input.keys.max
#   users = []
#   input.each_pair do |rank, honor|
#     usr_diff = (rank - honor).abs
#     if usr_diff < smallest_diff
#       users = [] 
#       smallest_diff = usr_diff
#       users << [rank, honor]
#     elsif usr_diff == smallest_diff
#       users << [rank, honor]
#     else
#       next
#     end
#   end
#   users.sort_by {|subarr| subarr[0]}.first.first 
# end

# users1 = {1 => 3, 3 => 3, 5 => 1}
# p nexus(users1)

=begin
input: two integers
output: either a 1 or 0

rules:
- return a 1 if first arg has a digit which repeats 3 times (eg 777)
  AND second arg has the same digit repeating twice
- return 0 if cannot return a 1

questions: 
does it have to reapeat 3 and only 3 times? same q for the second arg

algorithm: 
- set `out` to 0
- get the counts of digits for both arrays
  - 
- check that num1 array has a digit which repeats three times
  - if it doesnt then return `out`
- repeat the prev two steps for num2
- if reqs are satisfied set out to 0 and return it
- return out
=end

# def mtally(array)
#   counts = Hash.new(0)
#   array.each do |elt|
#     counts[elt] += 1
#   end
#   counts
# end


# def triple_double(num1, num2)
#   counts1 = mtally(num1.to_s.chars)
#   counts2 = mtally(num2.to_s.chars)

#   triple = counts1.select { |_, count| count == 3 }.keys.first
#   counts2[triple] == 2 ? 1 : 0
# end

# def triple_double(num1, num2)
#   out = 0
#   triple = nil
#   num1.digits.each_cons(3) do |subarr|
#     triple = subarr.first if subarr.all? {|elt| subarr.first == elt}
#   end
#   if triple
#     num2.digits.each_cons(2) do |(elt1, elt2)|
#       out = 1 if elt1 == tiple && elt2 == triple
#     end
#   end
#   out
# end
      



# p triple_double(1056, 122)

=begin
input: two string arrays
output: a string array

rules:
- output must be the elements of arg1 which are substrings of elements in arg2

questions: what is lexicographical order? how to handle empty strings or arrays

challenges:
- how to check that elt1 is a substring of elt2

algorithm:
- set out_arr to an empty arr
- iterate over arg1 elements
  - append out_arr with the current elt if it is a substring of any string in arg2
- return out_arr

=end

# def in_arr(arr1, arr2)
#   out_arr = []
#   arr1.each do |elt|
#     out_arr << elt if arr2.any? {|arr2_elt| !(arr2_elt.scan(elt).empty?)}
#   end
#   out_arr.sort
# end

# a1 = ["arp", "live", "strong"]
# a2 = ["lively", "alive", "harp", "sharp", "armstrong"]
# p in_arr(a1, a2)

# a1 = ["tarp", "mice", "bull"]
# p in_arr(a1, a2)

=begin
input: an array of hashes, the hash keys are irrelevant but their value contains a string (ie name)
output: a string

rules:
- outputs string must sepeate the names by a comma and a space except for the last one which should use an ampersand

challenges:
- iterating over the input array such that I get a list of names as strings

algorithm:
# - set `names_only` to an empty array
- get an array of the names
  - could use map to access the key value pairs
- join all but the last name together into a single string sperated by a comma and a space
- prepend ' & ' to the final name
- append  the last name to the output string 

=end

def list(input)
  names_only = input.map do |hash|
    hash.values.first
  end
  return names_only.first if names_only.size == 1
  final_name = " & #{names_only.pop}"
  # out_str = names_only.join ', '
  "#{names_only.join ', '}#{final_name}"
end


p list([{name: 'Bart'},{name: 'Lisa'},{name: 'Maggie'},{name: 'Homer'},{name: 'Marge'}])