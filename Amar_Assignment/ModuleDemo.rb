#program for calculating area trangle & square using module and by overloading methods in module

	module Trangle
		PI=3.14

		def cal(len,br)		#method cal that clcualte area of trangle and return result 
			return PI*len*br
		end
	end

	module Square
		
		def cal(side)		#oveloding method cal that clcualte area of square and return result 
			return side*side
		end
	end

	class Area
		extend Trangle
		extend Square

	end 

	areaof_trangle=Area.Trangle.cal(2.5,3.5) #calling method cal of Trangle module
	areaof_square=Area.Square.cal(10.5)	 #calling method cal of square module
	puts("Area of trangle: #{areaof_trangle}")
	puts("Area of Square: #{areaof_square}")
	
	
