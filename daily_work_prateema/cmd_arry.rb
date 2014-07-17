def addition
	a=0
	#take input from command line
	ARGV.each do |i| 
		b=i.to_i
		a +=b
	end
	puts a
end
add
