def prob_sep(num)
  puts "=> EXERCISE # #{num} -------------"
end

prob_sep 0
# 0 'Cute angles'
# Requirements:
# - write a method that take a floating point number taht represent
#     an angle between 0 and 360 degrees and reutrns a String that 
#     represents taht angle in degrees (use degree symbol), minutes and seconds
# Mental model:
# - If the num arg is an integer then return the a string with int
#     degrees and 0 mins and zero seconds (this may actually may not be need bc %)
# - use get_degmin to get min and seconds integer values
# - use format_dms() to format deg,min,sec values to everything appearing between ()
# - interpolate result of format_dms inside of `"%()"`
# - output result
# - SUBROUTINE format_dms(arr)
#   - take an integer arr like: [degrees, minutes, seconds]
#   - format the seconds and minutes to have a leading zero if only 1 digit
#   - use interpolation to return a string in format: "%(dd`DEGSymb`mm'ss")"
# - SUBROUTINE get_degmin(float)
#   - multiply result of `float % 1` by 60 to get int values for minutes. 
#   - use the same process as above upon result to get seconds (may need to round to int value)
#   - returns an arr [degrees, minutes, seconds]

# Algorithm:
# - SUBROUTINE get_degmin()
#   - take the  
# - 
# - 
# - 

DEGREE = "\xC2\xB0"

def dms(anum)
  dms_int_arr = get_degmin(anum)
  # this formats the dms arr into "dd°mm'ss\"" format
  dms_str_fmtd = format("%d%c%02d'%02d\"", *dms_int_arr.insert(1, DEGREE))
  "%(#{dms_str_fmtd})"
end

def get_degmin(num)
  deg = num
  min = (deg % 1) * 60
  sec = (min % 1) * 60
  [deg, min, sec].map(&:to_i)
end

puts dms(30)
puts dms(76.73)
puts dms(254.6)
puts dms(93.034773)
puts dms(0)
puts dms(360)

puts dms(30) == %(30°00'00")
puts dms(76.73) == %(76°43'48")
puts dms(254.6) == %(254°36'00")
puts dms(93.034773) == %(93°02'05")
puts dms(0) == %(0°00'00")
puts dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

prob_sep 1
# 1 'Delete Vowels'
# Requirements:
# - 

def remove_vowels(str)
  str.to_a.map { |x| x.delete("aeiouAEIOU") }
end

puts remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
puts remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
puts remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']


prob_sep 2
# 2 'Fibonaci number Location by Length'
# Requirements:
# - 
# - 
# Mental model:
# - compute the fib sequence storing each value as the number of digits rather than the actual fib number
# - use a `which` type method to return the index of the first item with a value = to the value in arg supplied
# Algorithm:
# - 

def find_fibonacci_index_by_length(int)
  ult = 1
  penult = 1
  index = 2
  loop do
    new_num = penult + ult
    new_num_dig_length = new_num.to_s.size
    if new_num_dig_length >= int
      return index + 1
    else
      penult = ult
      ult = new_num
      index += 1
    end
  end
end

# puts find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
# puts find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
# puts find_fibonacci_index_by_length(10) == 45
# puts find_fibonacci_index_by_length(100) == 476
# puts find_fibonacci_index_by_length(1000) == 4782
# puts find_fibonacci_index_by_length(10000) == 47847

prob_sep 3
# 3 'Reversed Arrays (Part 1)'
# Requirements:
# - write amehtod that takes an Array as an arguemetn, and reversees its elemetns i npalce; that is,
#     mutatee the array passed ino this mehtod. the ruten value should be tehe same aaray object
# Mental model:
# - move the final element in the arr to the index indicated by the counter keeping track of how 
#     many times the loop has been ran. make sure the arr doesnt keep growing by popping the last element
#      Do this until the iteration counter == the array length + 1
# Algorithm:
# - 
# - 
# - 
# - 
# - 

def reverse!(arr)
  iteration = 0
  until iteration >= arr.length - 1
    arr.insert(iteration, arr.pop)
    iteration += 1
  end
  arr
end

list = [1,2,3,4]
result = reverse!(list)
puts result == [4, 3, 2, 1] # true
puts list == [4, 3, 2, 1] # true
puts list.object_id == result.object_id # true

list = %w(a b e d c)
puts reverse!(list) == ["c", "d", "e", "b", "a"] # true
puts list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
puts reverse!(list) == ["abc"] # true
puts list == ["abc"] # true

list = []
puts reverse!(list) == [] # true
puts list == [] # true

prob_sep 4
# 4 'Reversed Arrays (Part 2)'
# Requirements:
# - write a method that takes an Array, and returns a new Array with the
#     elements of the original list in reverse order. Do not modify the original list 
# - 
# Mental model:
# - 
# Algorithm:
# - 
# - 
# - 
# - 
# - 

def reverse(arr)
  new_arr = []
  index = -1
  while index.abs < arr.length + 1
    new_arr.push(arr[index])
    index -= 1
  end
  new_arr
end

puts reverse([1,2,3,4]) == [4,3,2,1]          # => true
puts reverse(%w(a b e d c)) == %w(c d e b a)  # => true
puts reverse(['abc']) == ['abc']              # => true
puts reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
puts list.object_id != new_list.object_id  # => true
puts list == [1, 3, 2]                     # => true
puts new_list == [2, 3, 1]                 # => true

prob_sep 5
# 5 'Combining Arrays'
# Requirements:
# - 
# Mental model:
# - create an empty array. create a boolean switch and an iterator counter.
#   loop through the elements in both arrays flipping the switch after a
#   appending the current value at index i to the new array. the switch 
#   is for determining which array to pull from. Keep iterating until the 
#   length of the new array equals the combined lengths of the parent arrays. 
# Algorithm:
# - initialize out_array
# - initialize counter1 with value = 0
# - initialize counter2 with value = 0
# - LOOP until out_array.length == array1.length + array2.length + 2
#   - IF counter1.even? 
#     - out_array << array1[counter -1]
#   - increment counter
#   - switch = !switch
# - END
# - out_array.uniq
# -END
# I wanted my solution to be able to merge two arrays of different lengths.
#   I checked the LS solution before I got mine working. Moved on due to time. 

# LS Solution: 
def merge(array_1, array_2)
  array_1 | array_2
end

# def merge(arr1, arr2)
#   out_array = []
#   counter1 = 0
#   counter2 = 0
#   switch = true
#   until out_array.length >= arr1.length + arr2.length
#     if switch && counter1 <= arr1.length
#       switch = !switch unless counter2 >= arr2.length
#       out_array << arr1[counter1]
#       counter1 += 1
#     else
#       out_array << arr2[counter2]
#     end
#     switch = !switch
#   end
#   out_array.uniq
# end

puts merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

prob_sep 6
# 6 'Halvsies'
# Requirements:
# - 
# - 
# - 
# Mental model:
# - if the length is odd then r1 equals length / 2 + 1 & r2 = (r1.max...)
#     else r1 = (0..length / 2) and r2 = (length/2...)
# Algorithm:


def halvsies(arr)
  #return arr[[], []] if arr.length == 0
  halfl = arr.length / 2
  if arr.length.odd?
    r1 = (0..halfl)
  else
    r1 = (0..halfl - 1)
  end
  r2 = (r1.max + 1...)

  out_array = [arr[r1], arr[r2]]
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
#p halvsies([]) == [[], []]

prob_sep 7
# 7 'Find the Duplicate'
# Requirements:
# - 
# - 
# - 
# Mental model:
# - 
# Algorithm:
# - 
# - 
# - 

def find_dup(arr)
  arr.find { |element| arr.count(element) == 2 }
end

prob_sep 8
# 8 'Does My List Include This?'
# Requirements:
# - 
# - 
# - 
# Mental model:
# - use an enumerator#find to check each value against the arg value, if 
#   nil is returned from find then return false
# Algorithm:
# - 

def include?(array, value)
  array.each { |element| return true if value == element }
  false
end

puts include?([1,2,3,4,5], 3) == true
puts include?([1,2,3,4,5], 6) == false
puts include?([], 3) == false
puts include?([nil], nil) == true
puts include?([], nil) == false

prob_sep 9
# 9 'Right Triangles'
# Requirements:
# - 
# - 
# - 
# Mental model:
# - the number of lines ='s n and the number of stars on each line is equal to 
#   line # (sequence). All lines should be right justified. 
# Algorithm:
# - 
# - 
# - 
# - 

def triangle(n)
  i = 0
  while i <= n
    puts format("% #{n}s", '*' * i)
    i += 1
  end
end

triangle(5)
triangle(9)
