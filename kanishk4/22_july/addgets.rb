class Add
	attr_reader:a, :b
	attr_accessor:c
	def initialize(a,b,c)
	@a=a;
	@b=b;
	@c=c;
end
end
puts "enter the value of a"
a=gets
puts "enter the value of b"
b=gets
c=a.to_i+b.to_i
puts "addition of a and b is=#{c}"