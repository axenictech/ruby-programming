	module Trangle
		PI=3.14

		def cal(len,br)
			return PI*len*br
		end
	end

	module Square
		
		def cal(side)
			return side*side
		end
	end

	class Area
		extend Trangle
		extend Square

	end 

	areaof_trangle=Trangle.cal(2.5,3.5)
	areaof_square=Square.cal(10.5)
	puts("Area of trangle: #{areaof_trangle}")
	puts("Area of Square: #{areaof_square}")
	
	
