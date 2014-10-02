class Inherit
	def parent(a,b)
		puts "In Parent"
		@a=a
		@b=b
	end
end
	class Child<Inherit
		def child

		puts "inherited child"
		puts @a * @b
		

	end
end
p=Child.new
p.parent(20,30)
p.child