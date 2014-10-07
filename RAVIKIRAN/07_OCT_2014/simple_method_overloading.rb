class Rectangle
	def initialize(*args)
		if args.size<2 || args.size>3
			puts "This method takes either 2 or 3 arguments"
		else
			if args.size==2
				puts "This methos has exactly 2 arguments"
			else
				puts "Three arguments"
			end
		end
	end
end

Rectangle.new([10,23],4,10)
Rectangle.new([10,23],[4,10])
Rectangle.new(1)

class Circle
	def rad(r)
		return r*3
	end

   def rada(r,p)
		return r*p	
	end
end

a=Circle.new.rad(3)
#b=Circle.new.rad(3,3.14)
puts "a : #{a}"
#puts "b: #{b}"