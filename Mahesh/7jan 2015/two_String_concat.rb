
def stringManupulation()
	puts "\n\n\n::::::::::::::::Program Showing String manuplution Operation:::::::::::::::::::::::::::::::::::::::::::::\n\n"


puts "\nEnter Your First String  : "
str1 =gets().chomp()
puts "\nEnter Your Second String : "
str2 =gets().chomp()


c_st=""
i=0
	if(( str1.length) >= (str2.length))
		loop do
			# puts"1"
			if(i==str1.length)
				break
			end

			if(i<str2.length)
			c_st<< str1[i]
		   	c_st<< str2[i]
		   else
		   	c_st<< str1[i]
		   end

		   i+=1
		end
	else
		loop do
			# puts"2"
			if(i==str2.length)
				break
			end

			if(i<str1.length)
				c_st<< str1[i]
		   		c_st<< str2[i]
		   	else
		   	c_st<< str2[i]
		   	end
		   	i+=1
		end

	end

puts "Concanated String : #{c_st}"
end
stringManupulation()