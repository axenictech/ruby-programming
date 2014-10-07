class Singleton
	def college
		puts "Hello"
	end
end
s=Singleton.new



def s.student
	puts "hi"
end

s.student
s.college