first=Array[2,8,6,4,3]
second=Array[9,6,8,3,1]

puts "First array is #{first}"
puts "Second array is #{second}"

merge=Array.new
merge=first + second
puts "Merged Array is #{merge}"

add=Array.new
add=first & second
puts "Common element in Array is #{add}"

sub=Array.new
sub=first - second
puts "Different element in Array is #{sub}"

mul=Array.new
mul=first * 2
puts "Multiplied Array is #{mul}"

del=first.delete_at(1)
puts "#{del} Element is deleted"

ins=first.insert(1,10)
puts "#{ins} element added to the first array"