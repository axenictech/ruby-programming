first=Array[1,2,3,4,5,8,6]
second=Array[3,5,6,7,8,9,0]
puts "First array is : #{first}"
puts "Second array is : #{second}"

mix=Array.new()
mix=first + second
puts "Concatination of array is : #{mix}"

com=Array.new()
com=first & second
puts "Common element of array is : #{com}"

sub=Array.new()
sub=first - second
puts "Subtraction of array is : #{sub}"

mul=Array.new()
mul=first*2
puts "Multiple of 2 for array first : #{mul}"

ind=first.at(4)
puts "4 index element of array first is : #{ind}"

len=first.length
puts "Length of array first is : #{len}"

del=first.delete_at(1)
puts "Delete element at 1 is : #{del}"

ins=first.insert(1,3)
puts "first array after inserting new element : #{ins}"