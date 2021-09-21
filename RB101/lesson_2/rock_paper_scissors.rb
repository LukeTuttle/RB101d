VALID_CHOICES = %w(rock paper scissors lizard spock)
SCORE_NEEDED_FOR_WIN = 5
WHO_BEATS_WHO = {
  'rock': %w(lizard scissors),
  'paper': %w(rock spock),
  'scissors': %w(paper lizard),
  'lizard': %w(spock paper),
  'spock': %w(rock scissors)
}

def prompt(message)
  puts("=> #{message}")
end

def display_results(result)
  case result
    when 1
       prompt("YOU won!")
    when 2
       prompt("The COMPUTER won!")
    when 3
       prompt("It's a tie!") 
  end
end

def win?(first, second)
  if first == second
    3 # tie
  elsif WHO_BEATS_WHO[first.to_sym].include?(second)
    1 # first wins
  else
    2 # second wins
  end
end

# Program start

score_count = [0, 0]
trial_count = 0
loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice")
    end
  end

  computer_choice = VALID_CHOICES.sample
  
  trial_count += 1
  prompt("TRIAL #: #{trial_count}")
  prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

  #require('pry')
  #binding.pry
  who_won = win?(choice, computer_choice)
  score_count[who_won - 1] += 1 unless who_won == 3
  puts("------")
  display_results(who_won)
  break if score_count.max >= SCORE_NEEDED_FOR_WIN

  prompt("Score after #{trial_count} trials")
  puts("     player: #{score_count[0]}")
  puts("     computer: #{score_count[1]}")
  
  
  prompt("Do you want to play agian? (y/n):")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

you_won = "Congratulations! You won the match!"
you_lost = "Whaap Whaap...You lost the match"
score_count[0] > score_count[1] ? prompt(you_won): prompt(you_lost) 

prompt("FINAL SCORE: You: #{score_count[0]} | Computer: #{score_count[1]}")
prompt("Thank you for playing. Good bye!")