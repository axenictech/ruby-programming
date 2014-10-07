class Duck
	def print
		puts "Hello"
	end
end
class Ducktype 
	
	def print 
		puts "Hi"
	end
end

a=Duck.new
a=Ducktype.new
a.print
a.print

b=Ducktype.new
b=Duck.new
b.print
b.print