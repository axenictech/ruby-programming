class String

	def size
		
		count=0
		self.each_char {|i| count+=1}
		puts count
	end
end

"abcdef".size