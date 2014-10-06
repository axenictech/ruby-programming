class Array
	def array
		a=0
		self.each do |i|
			a +=i
		end
		puts a
	end
end
s=Array.new
s.array
[1,2,3,4,5].array