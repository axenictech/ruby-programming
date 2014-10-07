puts "Enter No. : "
no=gets.to_i
fact=1

for i in 1..no
	fact=fact*i
end

puts "Factorial is : #{fact}"