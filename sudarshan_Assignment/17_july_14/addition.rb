def add
	a=0
	ARGV.each do |i| #take input from command line
		b=i.to_i
		a +=b
	end
	puts a
end
add