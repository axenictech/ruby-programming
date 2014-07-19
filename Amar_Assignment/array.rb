class Array

	def addition
		sum=0
		self.each {|i| sum+=i}
		puts sum
	end
end

[1,2,3,4].addition
