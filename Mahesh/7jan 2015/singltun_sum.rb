
class Array

	def s_sum
		puts"\n\n Showing addition of array"

		puts "#{self.inject{|s,x| s+x}}"		
	end
end

puts "\n\n::::::::::::::Program showing sum method on array  object using singltun method::::::::::::::"

[1,2,3].s_sum

