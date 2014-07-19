class Person
	def say
		puts "hello"
	end
end

baby=Person.new
man=Person.new

def baby.say
		puts "taw taw taw"
end

baby.say
man.say