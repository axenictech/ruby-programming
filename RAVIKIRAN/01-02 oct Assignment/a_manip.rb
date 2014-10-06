first=Array.new()
second=Array.new()

first=["a","b","c"]
second=["x","y","z"]
puts "First array is : #{first}"
puts "Second array is : #{second}"

add=Array.new()
for i in 0..2
	add[i]=first[i]+second[i]
end

puts "Output array is : #{add}"