class Person
	def say
		puts "Person say hello"
	end
end

class Animal 
	def say
		puts "Animal say $$$$$$"
	end
end

talk1=Person.new
talk1.say
talk1=Animal.new
talk1.say

puts " "

talk2=Person.new
talk2=Animal.new
talk2.say
talk2.say

puts " "

talk3=Animal.new
talk3=Person.new
talk3.say
talk3.say