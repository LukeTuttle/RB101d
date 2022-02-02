def prob_sep(num)
  puts "=> EXERCISE # #{num} -------------"
end

prob_sep(1)

10.times{ |x| puts (" " * x) + "The Flinstones Rock!" }

prob_sep(2)
prob_sep(3)


def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.length == 4
  while  dot_separated_words.size > 0
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end
  true
end
