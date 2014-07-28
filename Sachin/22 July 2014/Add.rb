class Addition
		
	attr_reader :a, :b
	attr_accessor :c
	
	def initialize(a,b,c)
	
	@a=a
	@b=Float(b)
	@c=c
	
	end

end

add=Addition.new(2,5.5,0)

puts "Value of a  = #{add.a}"
puts "Value of b = #{add.b}"
add.c=add.a+add.b
puts "Addition of a and b = #{add.c}"
