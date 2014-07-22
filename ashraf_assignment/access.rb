class A
	def display
	puts "in a"
	end
	def square(a)
	puts a*a
	end 
	private:square #we can't call the private method from user
end
A.new.display
A.new.square(3)
