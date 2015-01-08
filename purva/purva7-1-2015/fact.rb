def fact(no)
	fact=1
	while no > 0
      fact = fact * no
      no -= 1
	end
	puts "factorial is:#{fact}"
end
fact(5)