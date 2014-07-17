def addition
array=Array.new
puts "enter the array size:"
no=gets.to_i


no.times do
  str = gets.chomp
  p array.push str
end

sum=0


array.each do |i|
	c=i.to_i
	sum+=c


end
p sum
end
addition


