class IfElse

	def show
		a=gets
		if a.to_i>10
			puts "a is greter than 10"
		else 
			puts "a is less than 10"
		end
			
	end

	def unless

		b=gets
		unless b.to_i<50
			puts "Entered value greter than 50"
		else
			puts "Entered value less than 50"
			
		end

	end

end
var=IfElse.new
var.show
var.unless