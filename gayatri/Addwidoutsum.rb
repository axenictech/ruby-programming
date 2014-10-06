class Add

	def sum
		puts "Enter the two no. for addition:"
		a=gets.to_i
		b=gets.to_i
		c=a+b
		puts "Addition is :#{c}"
	end
end
g=Add.new
g.sum
