def prob_sep(num)
  puts "=> EXERCISE # #{num} -------------"
end

prob_sep 1
# 1 'ASCII Srring Value'
# Reqs:
# - write a method that determines and return the ASCII string value of supplied string
# Mental model:
# - split string into chars then iteratively store the ASCII vals into a sum variable.
# Algorithm:
# - split string
# - define 'sum' variable
# - LOOP
#   - for each char increment sum variable by character value
# - END
# RETURN sum

def ascii_value(str)
  char_arr = str.chars
  sum = 0
  while char_arr.length > 0
    cur_char = char_arr.pop
    sum += cur_char.ord
  end
  sum
end

puts ascii_value('Four score') == 984
puts ascii_value('Launch School') == 1251
puts ascii_value('a') == 97
puts ascii_value('') == 0

prob_sep 2
# 2 'After Midnight (Part 1)'
# Requirements:
# - write a method that takes a time (int) as minutes before (neg) or
#     after (pos) midnight.
# - must output a string in "hh:mm" format
# Mental model:
# - Set a constant MIN_DAY which provides the number of minutes in a day.
# - SUBROUTINE: determine if the integer is pos or negative, and either (-) from DAY_MINUTES
#                 or add to zero.
# - Next, determine how many hours and how many minutes are contained withing the
#     result of operation above.
#   Could probably use an integer method or result % 60 for this.
# - Finally, interpolate the hours and minutes into an out string.
#   Make sure that if either minutes or hours are < 10 there is a
#       0 prepended to the value.
# - RETURN interpolated strin
# Algorithm:
# - if int is 0 return '00:00'
# - SUBROUTINE:
#   - SET min_day to 24 * 60
#   - add or subtract integer to/from MIN_DAY depending on -/+.
#   - save value as cur_time.
# - Get # of hrs and min from cur_time (maybe use divmod)
# - Interpolate hrs and mins into an out_string.
#   Make sure that a 0 get prepended if either hrs or min < 10

def time_of_day(int)
  return "00:00" if int == 0

  cur_time = get_cur_time(int)
  hrs, min = cur_time.divmod(60)

  format("%02d:%02d", hrs, min)
end

def get_cur_time(int)
  min_day = 24 * 60
  bef_aft_midnt = int < 0 ? min_day : 0
  cur_day_time = int.abs % 1440
  if int < 0
    bef_aft_midnt - cur_day_time
  else
    bef_aft_midnt + cur_day_time
  end
end

puts time_of_day(0) == "00:00"
puts time_of_day(-3) == "23:57"
puts time_of_day(35) == "00:35"
puts time_of_day(-1437) == "00:03"
puts time_of_day(3000) == "02:00"
puts time_of_day(800) == "13:20"
puts time_of_day(-4231) == "01:29"

prob_sep 3
# 3 'After Midnight (Part 2)'
# Requirements:
# - Write two methods that each take a time of day in 24hr ("hh:mm") format
#    and return the number of minutes before and after midnight respectively.
# - Both methods should return a vlaue in the rane 0..1439
# Mental model:
# - after_midnight()
#  - If '00:00' return 0 (maybe dont use this)
#  - run get_ints() to get integer values for hrs and min from supplied string
#  - Multiply hrs * 60 and add min to it -- assign to cur_day_minutes
#  - cur_day_min % 1440
#  - END
# - before_midnight()
#  - If '00:00' return 0
#  - run get_ints() to get integer values for hrs and min from supplied string
#  - Multiply hrs * 60 and add min to it -- assign to cur_day_minutes
#  - subtract cur_day_min % 1440 from 1440
#  - END
#
# - SUBROUTINE get_ints(): Get integer values for hrs and min from supplied string
#    - run char and take the 0,1 elements for hour and 3,4 elements for min
#    - cobine each set of two elements into a single string and run to_i on it
#        return hrs and mins as 0,1 elements of array respectively

# ----- MY SOLUTION -------
def after_midnight(hrs_min_str)
  hrs, min = get_ints(hrs_min_str)
  get_cur_day_mins(hrs, min)
end

def before_midnight(hrs_min_str)
  hrs, min = get_ints(hrs_min_str)
  cur_day_mins = get_cur_day_mins(hrs, min)
  mins_out = 1440 - cur_day_mins
  mins_out = 0 if mins_out == 1440

  mins_out
end

def get_cur_day_mins(hrs, min)
  (hrs * 60 + min) % 1440
end

def get_ints(str)
  str_arr = str.chars
  str_arr = [str_arr[0..1], str_arr[3..4]]

  str_arr.map! { |arr| "#{arr[0]}#{arr[1]}".to_i }
end

# ----- LS SOLUTION -------
## MY COMMENTARY:
#    - This solutions is much more elegant than mine.
#      I think the place I went wrong was not thinking to split
#        to combine the chars for hrs and min--it's was simpler
#        than the subroutine I created to accomplish the same.
# HOURS_PER_DAY = 24
# MINUTES_PER_HOUR = 60
# MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

# def after_midnight(time_str)
#   hours, minutes = time_str.split(':').map(&:to_i)
#   (hours * MINUTES_PER_HOUR + minutes) % MINUTES_PER_DAY
# end

# def before_midnight(time_str)
#   delta_minutes = MINUTES_PER_DAY - after_midnight(time_str)
#   delta_minutes = 0 if delta_minutes == MINUTES_PER_DAY
#   delta_minutes
# end

puts after_midnight('00:00') == 0
puts before_midnight('00:00') == 0
puts after_midnight('12:34') == 754
puts before_midnight('12:34') == 686
puts after_midnight('24:00') == 0
puts before_midnight('24:00') == 0

prob_sep 4
# 4 'Letter Swap'
# Requirements:
# - 
# Mental model:
# - 
# Algorithm:
# - 
# - 
# - 
# - 
# - 