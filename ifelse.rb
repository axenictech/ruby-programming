class IFELSE
	def accept 
		puts "Enter no:"
		 $no=gets.to_i
	end
	def print
		if $no %2 ==0
			puts "#{$no}Number is even"

		else
			puts "#{$no} number is odd"
		end
	end
end
IFELSE.new.accept
IFELSE.new.print
