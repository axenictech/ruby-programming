class MyDemo
	def animal
		puts "My Dog"
	end
	def person
		puts "My Person"
	end

end

obj=MyDemo.new
obj.animal
obj.person
obj2=MyDemo.new
def obj2.person
		p "bhushan"
	end
obj2.person
obj2.animal