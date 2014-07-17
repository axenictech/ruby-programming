def addition
#declare an array
array=Array.new
puts "enter the array size:"
#take the size of array
no=gets.to_i


no.times do
#delet the \n using chomp
  str = gets.chomp
#push into array
  p array.push str
end

sum=0

#iterate an add for the total
array.each do |i|
	c=i.to_i
	sum+=c


end
p sum
end
addition


