class String

	def lth
		i=0;
		self.each_byte{|c| i+=1}; #return length of string
		 i
	end
end
puts"\n\n:::::::::::::::::::::::::::::::::::::::You are in Customized method Program:::::::::::::::::::::::::::::::::::::::::\n\n"
print'Result of puts "ABC".lth =>'
puts "ABC".lth


class Integer

	def icmt(val=0) #return incremented current value by passed parameter
		self+val
		
	end
end
print'Result of puts 5.icmt =>'

puts 5.icmt

