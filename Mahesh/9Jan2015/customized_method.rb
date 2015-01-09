class String

	def lth
		i=0;
		self.each_byte{|c| i+=1}; #return length of string
		 i
	end
end
puts "ABC".lth


class Integer

	def icmt(val=0) #return incremented current value by passed parameter
		self+val
		
	end
end
puts 5.icmt

