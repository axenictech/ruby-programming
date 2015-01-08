puts "enter the no"
no = gets.to_i
fact = 1
	while no > 0 do
      fact = fact * no
      no -= 1
	end
puts "factorial is: #{fact}"
