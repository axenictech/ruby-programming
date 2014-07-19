class Animal
	def cat
			p "mow"
	end
	def dog
		p "bow"
	end
end

class Person
	def cat
			p "mowmow"
	end
	def dog
		p "bowbow"
	end
end
a=Animal.new
a.cat
a.dog
a=Person.new
a.cat
a.dog