class Animal
	def tiger
	puts "in a parent class","its a tiger"
	end
end
class Cat<Animal
	def cat
	puts "in a base class ","its a cat"
	end
end

a=Cat.new
a.cat
a.tiger

