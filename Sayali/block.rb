class Block
	def print
		puts "hi"
		yield 1
		 

	end
end
Block.new.print {|i| puts "Hello #{i}"
	             puts "Hwz u?"
	         	 puts "bye"	}