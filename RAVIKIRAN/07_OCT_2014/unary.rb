class MagicString < String
	def +@
		upcase
	end

	def -@
		downcase
	end

	def !@
		swapcase
	end
end

str=MagicString.new("Ravikiran")

puts "Uppercase : #{+str}"
puts "Uppercase : #{-str}" 
puts "Uppercase : #{!str}"
