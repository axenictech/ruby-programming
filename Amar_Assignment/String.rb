#define our custom method to calculate String len 
class String

	def len
		count=0
		self.each_char { |i| count+=1} #calculate count by adding current refrence object
		puts count
	end
end
"Amardeep".len	#calling len method
